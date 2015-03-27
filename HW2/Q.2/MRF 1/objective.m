function [objFunc ] =objective(currentVal,noisyIm,currentIm,i,j,alpha)
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
temp=abs(temp1)^2+abs(temp2)^2+abs(temp3)^2+abs(temp4)^2;
objFunc=(1-alpha)*abs(noisyIm(i,j)-currentVal)^2+alpha*temp;
end


