clc;clear;close all

load('data33.mat')

rmsd=zeros(10,33);

reconstructedImages=zeros(size(data33,1)/2,size(data33,2)/2,size(data33,3));

for j=1:size(data33,3)
    
    inputIm=imresize(data33(:,:,j),1/2);
    
    u=dct2(inputIm);
    
    N=size(u,1);
    eps=1;
    p=0;
    
    K=0:0.1:0.9;
    for k=1:10
        
        M=floor(N*(1-K(k))); % varying compression ratio       
        
        phi=rand(M,N); % symmetric bernouli
        phi=((phi >= .5)-(phi < .5))/sqrt(M);
        
        b=phi*u;
        u=phi'*((phi*phi')\b);
        
        %%%% Run the algorithm %%%%
        IRL1
        
        rmsd(k,j)=rms(rms(idct2(u)-inputIm));
    end
    
end

mat=sum((rmsd<=100),2)/33;
figure
plot(0:0.1:0.9,mat)
title('fraction of reconstructed images vs compression ratio')
xlabel('compression ratio (0 means no compression)')
ylabel('fraction of reconstructed images')
