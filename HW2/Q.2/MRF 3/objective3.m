function [objFunc ] =objective3(currentVal,noisyIm,currentIm,i,j,alpha,gamma)
[m,n]=size(noisyIm);

if i>1 && i<m
    if j>1 && j<n
        temp1=currentVal-currentIm(i-1,j);
        temp2=currentVal-currentIm(i+1,j);
        temp3=currentVal-currentIm(i,j-1);
        temp4=currentVal-currentIm(i,j+1);
    elseif j==1
        temp1=currentVal-currentIm(i-1,j);
        temp2=currentVal-currentIm(i+1,j);
        temp3=0;
        temp4=currentVal-currentIm(i,j+1);
    elseif j==n
        temp1=currentVal-currentIm(i-1,j);
        temp2=currentVal-currentIm(i+1,j);
        temp3=currentVal-currentIm(i,j-1);
        temp4=0;
        
    end
elseif i==1
     if j>1 && j<n
        temp1=0;
        temp2=currentVal-currentIm(i+1,j);
        temp3=currentVal-currentIm(i,j-1);
        temp4=currentVal-currentIm(i,j+1);
    elseif j==1
        temp1=0;
        temp2=currentVal-currentIm(i+1,j);
        temp3=0;
        temp4=currentVal-currentIm(i,j+1);
    elseif j==n
        temp1=0;
        temp2=currentVal-currentIm(i+1,j);
        temp3=currentVal-currentIm(i,j-1);
        temp4=0;
        
    end
elseif i==m
    if j>1 && j<n
        temp1=currentVal-currentIm(i-1,j);
        temp2=0;
        temp3=currentVal-currentIm(i,j-1);
        temp4=currentVal-currentIm(i,j+1);
    elseif j==1
        temp1=currentVal-currentIm(i-1,j);
        temp2=0;
        temp3=0;
        temp4=currentVal-currentIm(i,j+1);
    elseif j==n
        temp1=currentVal-currentIm(i-1,j);
        temp2=0;
        temp3=currentVal-currentIm(i,j-1);
        temp4=0;
        
    end

end
temp1=gamma*abs(temp1)-gamma^2*log(1+abs(temp1)/gamma);
temp2=gamma*abs(temp2)-gamma^2*log(1+abs(temp2)/gamma);
temp3=gamma*abs(temp3)-gamma^2*log(1+abs(temp3)/gamma);
temp4=gamma*abs(temp4)-gamma^2*log(1+abs(temp4)/gamma);
temp=temp1+temp2+temp3+temp4;
objFunc=(1-alpha)*abs(noisyIm(i,j)-currentVal)^2+alpha*temp;
end


