tic
load('assignmentImageDenoisingPhantom.mat')

% imageNoisy=imageNoisy(1:2:end,1:2:end);
% imageNoiseless=imageNoiseless(1:2:end,1:2:end);

[m,n]=size(imageNoisy);

currentIm=imageNoisy;

alpha=0.16;

gamma=1.3;



for i=1:m
    for j=1:n
        prevVal=imageNoisy(i,j);
        prevPost=objective3(prevVal,imageNoisy,currentIm,i,j,alpha,gamma);
        
        flag=true;
        
        while(flag)
            
            currentVal=prevVal*1.1;
            currentPost=objective3(currentVal,imageNoisy,currentIm,i,j,alpha,gamma);
            
            flag=(abs(currentPost-prevPost)>0.01*abs(prevPost));
            
            if currentPost>prevPost
                prevVal=prevVal*0.8;
                prevPost=objective3(prevVal,imageNoisy,currentIm,i,j,alpha,gamma);
                flag=true;
            else
                prevVal=currentVal;
                prevPost=currentPost;
            end
            
        end
        currentIm(i,j)=currentVal;
        
    end
end



toc
