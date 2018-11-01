%% MyMainScript

tic;

im = double(imread('../data/barbara256.png'));
im1 = double(im) + randn(size(im))*20;

patch_size = 7;
sigma = 20;
sigma_intensity = 10;

rmse_PCADenoising1 = myPCADenoising1(im, im1, patch_size, sigma)
rmse_PCADenoising2 = myPCADenoising2(im, im1, patch_size, sigma, 0)

% [im2, rmse_BilateralFiltered] = myBilateralFiltering(im, im1, sigma, sigma_intensity)

%% Poisson Distributed Noise
% The first case is much better than the second case where im has been divided by 20.
% This is because in the second case the noise introduced is much greater
% than the first case and hence, a comparitive bad restoration.

im_poisson1 = sqrt(im) + randn(size(im))*0.25;
rmse_Poisson1 = myPCADenoising2(im, im_poisson1, patch_size, 1/4, 1)

im_poisson2 = sqrt(im)./sqrt(20) + randn(size(im))*0.25;
rmse_Poisson2 = myPCADenoising2(im, im_poisson2, patch_size, 1/4, 2)

toc;