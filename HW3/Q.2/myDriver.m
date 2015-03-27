%% Load images
clc;clear;close all
load('assignmentImageReconstructionBrain.mat')
initialIm = ifft2(imageKspaceData);

%% Quadratic potential
alpha = 0.935;
priorType = 'quad';
gamma = [];

gradientDescentScript; %actual code in this script. Parameters

figure
subplot(2,2,1)
imshow(real(initialIm))
title('noisy image')

subplot(2,2,2)
imshow(real(currentIm))
title('reconstructed image')

subplot(2,2,3)
plot(values)
title('objective values')


%% Discontinous-Huber potential
alpha = 0.9993;
gamma = 0.005;
priorType = 'disc-huber';

gradientDescentScript;

figure
subplot(2,2,1)
imshow(real(initialIm))
title('noisy image')

subplot(2,2,2)
imshow(real(currentIm))
title('reconstructed image')

subplot(2,2,3)
plot(values)
title('objective values')

%% Discontinous potential
alpha = 0.99993;
gamma = 0.001;
priorType = 'disc';

gradientDescentScript;

figure
subplot(2,2,1)
imshow(real(initialIm))
title('noisy image')

subplot(2,2,2)
imshow(real(currentIm))
title('reconstructed image')

subplot(2,2,3)
plot(values)
title('objective values')