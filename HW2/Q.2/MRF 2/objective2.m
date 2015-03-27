function [objFunc ] =objective2(currentVal,noisyIm,currentIm,i,j,alpha,gamma)
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

if abs(temp1)<=gamma 
    temp1=0.5*abs(temp1)^2;
else
    temp1=gamma*abs(temp1)-0.5*gamma^2;
end


if abs(temp2)<=gamma 
    temp2=0.5*abs(temp2)^2;
else
    temp2=gamma*abs(temp2)-0.5*gamma^2;
end


if abs(temp3)<=gamma 
    temp3=0.5*abs(temp3)^2;
else
    temp3=gamma*abs(temp3)-0.5*gamma^2;
end


if abs(temp4)<=gamma 
    temp4=0.5*abs(temp4)^2;
else
    temp4=gamma*abs(temp4)-0.5*gamma^2;
end

temp=temp1+temp2+temp3+temp4;
objFunc=(1-alpha)*abs(noisyIm(i,j)-currentVal)^2+alpha*temp;
end


