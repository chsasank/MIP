clc;clear;close all
load('assignmentShapeAnalysis.mat')
%% unaligned point sets
figure
for i=1:numOfPointSets
    hold on
    scatter(pointSets(1,:,i),pointSets(2,:,i))
end
title('unaligned point sets')

%%initialising mean point set
meanPtSet=mean(pointSets,3);

meanPtSet=meanPtSet-repmat(mean(meanPtSet,2),1,size(meanPtSet,2)); % making zero mean 

meanPtSet=meanPtSet/sqrt(sum(sum(meanPtSet.^2))/size(meanPtSet,2));% normalising the initial mean point set 

%% shape mean calculation
outPtSets=zeros(size(pointSets));
flag=1;
prevMean=meanPtSet;
iter=0;
while(flag)
    iter=iter+1;
    for i=1:size(pointSets,3)
        outPtSets(:,:,i)=align(meanPtSet,pointSets(:,:,i));
    end
    meanPtSet=mean(outPtSets,3);
    if sum(sum(abs(meanPtSet-prevMean)))/sum(sum(abs(prevMean)))<0.01
        flag=0;
    else
        prevMean=meanPtSet;
    end
end

figure
for i=1:numOfPointSets
    hold on
    scatter(outPtSets(1,:,i),outPtSets(2,:,i))
end
title('aligned point sets')


figure
for i=1:numOfPointSets
    hold on
    scatter(outPtSets(1,:,i),outPtSets(2,:,i),[],[0,1,0])
end

hold on 
scatter(meanPtSet(1,:),meanPtSet(2,:),[],[0,0,1])
title('aligned point sets with mean point set marked')


%% modes of shape variability calculation

outPtSets=reshape(outPtSets,[size(pointSets,1)*size(pointSets,2),size(pointSets,3)]);

[COEFF,~,latent]=pcacov(outPtSets'); 
figure
plot(latent)
title('eigen values/variances of principal modes')

V=reshape(COEFF,[size(pointSets,1),size(pointSets,2),size(COEFF,2)]);

figure
subplot(2,2,1)
scatter(V(1,:,1),V(2,:,1))
subplot(2,2,2)
scatter(V(1,:,2),V(2,:,2))
subplot(2,2,3)
scatter(V(1,:,3),V(2,:,3))
subplot(2,2,4)
scatter(V(1,:,4),V(2,:,4))
title('first 4 principal components of shape variation')


