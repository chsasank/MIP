function [ val,grad ] = potentialFunction( U,gamma,type )
% type can be one of 'quad', 'disc-huber' or 'disc'


if(strcmp(type,'quad'))
    val = abs(U).^2;
    grad = 2*U;
    
elseif(strcmp(type,'disc-huber'))
    val = (0.5*abs(U.^2)).*(abs(U) <= gamma) + ...
        (gamma*abs(U) - 0.5*gamma^2).*(abs(U) > gamma);
    
    grad = U.*(abs(U) <= gamma) + ...
        (gamma*sign(U)).*(abs(U) > gamma);
    
elseif(strcmp(type,'disc'))
    val = gamma*abs(U) - gamma^2*log(1+abs(U)/gamma);
    grad = gamma*sign(U) - gamma*sign(U)./(1+abs(U)/gamma);
else
    error('wrong type')
end

end


