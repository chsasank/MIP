%% Load images
clc;clear;close all
load('assignmentImageReconstructionPhantom.mat')
initialIm = ifft2(imageKspaceData);
RRMSE(imageNoiseless,initialIm)

%% Quadratic potential
alpha = 0.935;
priorType = 'quad';
gamma = [];

gradientDescentScript; %actual code in this script. Parameters

figure
subplot(2,3,1)
imshow(real(imageNoiseless))
title('noiseless image')

subplot(2,3,2)
imshow(real(initialIm))
title('noisy image')

subplot(2,3,3)
imshow(real(currentIm))
title('reconstructed image')

subplot(2,3,4)
plot(values)
title('objective values')

subplot(2,3,6)
plot(error_rrmse)
title('RRMSE error')

%% Discontinous-Huber potential
alpha = 0.9993;
gamma = 0.005;
priorType = 'disc-huber';

gradientDescentScript;
figure
subplot(2,3,1)
imshow(real(imageNoiseless))
title('noiseless image')

subplot(2,3,2)
imshow(real(initialIm))
title('noisy image')

subplot(2,3,3)
imshow(real(currentIm))
title('reconstructed image')

subplot(2,3,4)
plot(values)
title('objective values')

subplot(2,3,6)
plot(error_rrmse)
title('RRMSE error')
%% Discontinous potential
alpha = 0.99993;
gamma = 0.001;
priorType = 'disc';

gradientDescentScript;

figure
subplot(2,3,1)
imshow(real(imageNoiseless))
title('noiseless image')

subplot(2,3,2)
imshow(real(initialIm))
title('noisy image')

subplot(2,3,3)
imshow(real(currentIm))
title('reconstructed image')

subplot(2,3,4)
plot(values)
title('objective values')

subplot(2,3,6)
plot(error_rrmse)
title('RRMSE error')