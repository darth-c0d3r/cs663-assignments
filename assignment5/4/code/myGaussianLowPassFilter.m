function [] = myGaussianFilter(imf, h, w, sigma)
	H = zeros(2*h, 2*w);
	gaussFilter = fspecial('gaussian', [2*h, 2*w], sigma);
	figure;
	imagesc(log(abs(gaussFilter) + 1));
	title(['Gaussian Low Pass Filter | sigma = ', num2str(sigma)]);
	colormap('jet');
	colorbar;

	img_out = imf.*gaussFilter;
	img_out = real(ifft2(ifftshift(img_out)));
	img_out = img_out(h/2 + 1:h/2 + h, w/2 + 1: w/2 + w);
	figure;
	imagesc(img_out);
	title(['Gaussian Low Pass Filtered Image | sigma = ', num2str(sigma)]);
	colormap('gray');
	colorbar;
end