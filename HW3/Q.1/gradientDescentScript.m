isConverged = false;
stepSize = 0.000001;
currentIm = initialIm;
values = []; error_rrmse = [];
objPrev = Inf;
numIter = 0;
while(~isConverged)
    %% calculate objective value
    diff1 = currentIm - circshift(currentIm,1);
    diff2 = currentIm - circshift(currentIm,-1);
    diff3 = currentIm - circshift(currentIm',1)';
    diff4 = currentIm - circshift(currentIm',-1)';
    
    % potential function/prior
    [V1,grad_fidelity_1] = potentialFunction( diff1, gamma, priorType);
    [V2,grad_fidelity_2] = potentialFunction( diff2, gamma, priorType);
    [V3,grad_fidelity_3] = potentialFunction( diff3, gamma, priorType);
    [V4,grad_fidelity_4] = potentialFunction( diff4, gamma, priorType);
    V = V1 + V2 + V3 + V4;
        
    % fidelity term
    fidelity = abs(imageKspaceData-imageKspaceMask*fft2(currentIm)).^2;
    
    % objective
    objCurr = sum(sum( (1-alpha)*fidelity + alpha*V ));
     
    %% gradient
    gradient_fidelity = 2*( ifft2(imageKspaceMask'*imageKspaceMask*fft2(currentIm)) - ifft2(imageKspaceMask'*imageKspaceData) );
    gradient_regularizer = grad_fidelity_1 + grad_fidelity_2 + grad_fidelity_3 + grad_fidelity_4;
    
    gradient = (1-alpha)*gradient_fidelity + alpha*gradient_regularizer;
    
    %% step size heuristic
    if abs(objPrev-objCurr)/objPrev < 1e-90  && numIter > 300
        isConverged = true;
        break;
    elseif objCurr > objPrev
        stepSize = stepSize*0.5;      
    elseif objCurr < objPrev
        stepSize = stepSize*1.1;
    end
    
    %% update currentImage
    currentIm = currentIm - stepSize*gradient;
    objPrev = objCurr;
    
    values = [values log(objCurr)];
    error_rrmse = [error_rrmse RRMSE(imageNoiseless,currentIm)];
    numIter = numIter + 1;
end
rrmse_final = RRMSE(imageNoiseless,currentIm);