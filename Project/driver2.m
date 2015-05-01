clc;clear;close all

load('data33.mat')

rmsd=zeros(1,33);

reconstructedImages=zeros(size(data33,1)/2,size(data33,2)/2,size(data33,3));

for j=1:size(data33,3)
    
    inputIm=imresize(data33(:,:,j),1/2);
    
    u=dct2(inputIm);
    
    N=size(u,1);
    eps=1;
    p=1;
    
    M=floor(N/2);
    
    
    
    phi=rand(M,N); % symmetric bernouli
    phi=((phi >= .5)-(phi < .5))/sqrt(M);
    
    b=phi*u;
    u=phi'*((phi*phi')\b);
    
    %%%% Run the algorithm %%%%
    IRLS
    
    reconstructedImages(:,:,j)=idct2(u);
        
    rmsd(j)=rms(rms(idct2(u)-inputIm));
end

[~,sortIndex1] = sort(rmsd,'ascend');
[~,sortIndex2] = sort(rmsd,'descend');

figure
subplot(1,2,1)
imshow(uint8(data33(:,:,sortIndex1(1))))
subplot(1,2,2)
imshow(uint8(reconstructedImages(:,:,sortIndex1(1))))
title('Good Reconstruction')

figure
subplot(1,2,1)
imshow(uint8(data33(:,:,sortIndex1(2))))
subplot(1,2,2)
imshow(uint8(reconstructedImages(:,:,sortIndex1(2))))
title('Good Reconstruction')

figure
subplot(1,2,1)
imshow(uint8(data33(:,:,sortIndex1(3))))
subplot(1,2,2)
imshow(uint8(reconstructedImages(:,:,sortIndex1(3))))
title('Good Reconstruction')

figure
subplot(1,2,1)
imshow(uint8(data33(:,:,sortIndex2(1))))
subplot(1,2,2)
imshow(uint8(reconstructedImages(:,:,sortIndex2(1))))
title('Bad Reconstruction')

figure
subplot(1,2,1)
imshow(uint8(data33(:,:,sortIndex2(2))))
subplot(1,2,2)
imshow(uint8(reconstructedImages(:,:,sortIndex2(2))))
title('Bad Reconstruction')