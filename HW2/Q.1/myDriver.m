%% Load images
clc;clear;close all
load('assignmentImageDenoisingPhantom.mat')
initialIm = imageNoisy;
RRMSE(imageNoiseless,initialIm)

%% Quadratic potential
alpha = 0.225;
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
title('denoised image')

subplot(2,3,4)
plot(values)
title('objective values')

subplot(2,3,6)
plot(error_rrmse)
title('RRMSE error')

%% Discontinous-Huber potential
alpha = 0.95;
gamma = 0.006;
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
title('denoised image')

subplot(2,3,4)
plot(values)
title('objective values')

subplot(2,3,6)
plot(error_rrmse)
title('RRMSE error')
%% Discontinous potential
alpha = 0.99;
gamma = 0.0012;
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
title('denoised image')

subplot(2,3,4)
plot(values)
title('objective values')

subplot(2,3,6)
plot(error_rrmse)
title('RRMSE error')