tic
load('assignmentImageDenoisingBrainNoisy.mat')

% imageNoisy=imageNoisy(1:2:end,1:2:end);
% imageNoiseless=imageNoiseless(1:2:end,1:2:end);

[m,n]=size(imageNoisy);

currentIm=imageNoisy;
alpha=0.2;
gamma=1.35;

for i=3
    for j=5
        prevVal=imageNoisy(i,j);
        prevPost=objective3(prevVal,imageNoisy,currentIm,i,j,alpha,gamma);
        
        flag=true;
       count=0;
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
           count=count+1;
           objFunc(count)=currentPost;
        end
        currentIm(i,j)=currentVal;
        
    end
end



toc
