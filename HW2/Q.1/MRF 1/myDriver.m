tic
load('assignmentImageDenoisingPhantom.mat')

% imageNoisy=imageNoisy(1:2:end,1:2:end);
% imageNoiseless=imageNoiseless(1:2:end,1:2:end);

[m,n]=size(imageNoisy);

currentIm=imageNoisy;
alpha=0.2;

for i=1:m
    for j=1:n
        prevVal=imageNoisy(i,j);
        prevPost=objective(prevVal,imageNoisy,currentIm,i,j,alpha);
        
        flag=true;
        
        while(flag)
            
            currentVal=prevVal*1.1;
            currentPost=objective(currentVal,imageNoisy,currentIm,i,j,alpha);
            
            flag=(abs(currentPost-prevPost)>0.01*abs(prevPost));
            
            if currentPost>prevPost
                prevVal=prevVal*0.8;
                prevPost=objective(prevVal,imageNoisy,currentIm,i,j,alpha);
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
