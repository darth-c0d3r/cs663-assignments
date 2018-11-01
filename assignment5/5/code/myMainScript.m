%% MyMainScript

tic;

im = double(imread('../data/barbara256.png'));
im1 = double(im) + randn(size(im))*20;

patch_size = 7;
sigma = 20;
sigma_intensity = 10;

rmse_PCADenoising1 = myPCADenoising1(im, im1, patch_size, sigma)
rmse_PCADenoising2 = myPCADenoising2(im, im1, patch_size, sigma, 0)

%% Bilateral FIltering
% PCA is a much better technique for denoising as compared to bilateral
% filtering. PCA based techniques focus on image restoration unlike
% bilateral filtering which focusses on image enhancement only.

% Also using KNN for eigenspace ensures that the mean squared alpha is
% close to the true value. Hence, better image restoration as is observed.
[im2, rmse_BilateralFiltered] = myBilateralFiltering(im, im1, sigma, sigma_intensity);
rmse_BilateralFiltered

%% Poisson Distributed Noise
% The first case is much better than the second case where im has been divided by 20.
% This is because in the second case the noise introduced is much greater
% than the first case and hence, a comparitive bad restoration.

im_poisson1 = sqrt(im) + randn(size(im))*0.25;
rmse_Poisson1 = myPCADenoising2(im, im_poisson1, patch_size, 1/4, 1)

im_poisson2 = sqrt(im)./sqrt(20) + randn(size(im))*0.25;
rmse_Poisson2 = myPCADenoising2(im, im_poisson2, patch_size, 1/4, 2)

toc;