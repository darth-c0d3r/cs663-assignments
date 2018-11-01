%% MyMainScript

tic;

img_in = imread('../data/barbara256.png');
[rows, cols] = size(img_in);
img = padarray(img_in, [rows/2, cols/2]);
imf = fftshift(fft2(img));

D = [40 80];
for i = 1:2
	myIdealLowPassFilter(imf, rows, cols, D(i));
end

sigma = [40 80];
for i = 1:2
	myGaussianLowPassFilter(imf, rows, cols, sigma(i));
end

toc;