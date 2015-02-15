%% Load Shepp-Logan Image and take Radon transform
clc;clear;close all;
f = phantom(128);
figure
imshow(f)
theta = 0:3:177;
R = radon(f,theta);

%% Part a:

%%
% <html><h3>Ram-Lak filter</h3></html>
R_filtered = myFilter(R, 0.5,'Ram-Lak');
f_recon = backproj(R_filtered,theta);
figure
imshow(f_recon)

R_filtered = myFilter(R, 1,'Ram-Lak');
f_recon = backproj(R_filtered,theta);
figure
imshow(f_recon)
   
%%
% <html><h3>Shepp-Logan filter</h3></html>
R_filtered = myFilter(R, 0.5,'Shepp-Logan');
f_recon = backproj(R_filtered,theta);
figure
imshow(f_recon)

R_filtered = myFilter(R, 1,'Shepp-Logan');
f_recon = backproj(R_filtered,theta);
figure
imshow(f_recon)
    %% 
    % Observe that reconstructed image got smoother

%%
% <html><h3>Cosine filter</h3></html>
R_filtered = myFilter(R, 0.5,'Cosine');
f_recon = backproj(R_filtered,theta);
figure
imshow(f_recon)

R_filtered = myFilter(R, 1,'Cosine');
f_recon = backproj(R_filtered,theta);
figure
imshow(f_recon)
    %% 
    % Observe that reconstructed image got even smoother
    
%% Part b:
% Generate blurred images
f0 = f;
figure
imshow(f0)

mask = fspecial ('gaussian', 11, 1);
f1 = conv2 (f, mask, 'same');
figure
imshow(f1)

mask = fspecial ('gaussian', 51, 5);
f5 = conv2 (f, mask, 'same');
figure
imshow(f5)

%%
% Compute radon tranform
R0 = radon(f0,theta);
R1 = radon(f1,theta);
R5 = radon(f5,theta);

%%
% Reconstruct using Ram-Lak filtered back projection
R_filtered0 = myFilter(R0, 1,'Ram-Lak');
f_recon0 = backproj(R_filtered0,theta);
figure
imshow(f_recon0)

R_filtered1 = myFilter(R1, 1,'Ram-Lak');
f_recon1 = backproj(R_filtered1,theta);
figure
imshow(f_recon1)

R_filtered5 = myFilter(R5, 1,'Ram-Lak');
f_recon5 = backproj(R_filtered5,theta);
figure
imshow(f_recon5)

%% 
% Compute RRMSE
disp(RRMSE(f0,f_recon0))
disp(RRMSE(f1,f_recon1))
disp(RRMSE(f5,f_recon5))