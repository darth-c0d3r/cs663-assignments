%% MyMainScript

tic;

im = imread('../data/barbara256.png');
im1 = double(im) + randn(size(im))*20;

patch_size = 7;
sigma = 20;

figure(1);
rmse_PCADenoising1 = myPCADenoising1(im1, patch_size, sigma);

figure(2);
rmse_PCADenoising2 = myPCADenoising2(im1, patch_size, sigma);

toc;
