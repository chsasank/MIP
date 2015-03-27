%% Load images
clc;clear;close all
load('assignmentImageDenoisingBrainNoisy.mat')
initialIm = imageNoisy;

%% Quadratic potential
alpha = 0.225;
priorType = 'quad';
gamma = [];

gradientDescentScript; %actual code in this script. Parameters

figure
subplot(2,2,1)
imshow(real(initialIm))
title('noisy image')

subplot(2,2,2)
imshow(real(currentIm))
title('denoised image')

subplot(2,2,3)
plot(values)
title('objective values')


%% Discontinous-Huber potential
alpha = 0.95;
gamma = 0.006;
priorType = 'disc-huber';

gradientDescentScript;

figure
subplot(2,2,1)
imshow(real(initialIm))
title('noisy image')

subplot(2,2,2)
imshow(real(currentIm))
title('denoised image')

subplot(2,2,3)
plot(values)
title('objective values')

%% Discontinous potential
alpha = 0.99;
gamma = 0.0012;
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