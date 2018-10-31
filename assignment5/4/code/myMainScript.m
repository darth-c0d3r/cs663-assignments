%% MyMainScript

tic;

img_in = imread('../data/barbara256.png');
[h, w] = size(img_in);
img = padarray(img_in, [h/2, w/2]);
imf = fftshift(fft2(img));

D = [40 80];
for i = 1:2
	myIdealLowPassFilter(imf, h, w, D(i));
end

sigma = [40 80];
for i = 1:2
	myGaussianLowPassFilter(imf, h, w, sigma(i));
end

toc;
