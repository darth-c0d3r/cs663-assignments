function [] = myGaussianFilter(imf, rows, cols, sigma)
	H = zeros(2*rows, 2*cols);
	gaussFilter = fspecial('gaussian', [2*rows, 2*cols], sigma);
	figure;
	imagesc(log(abs(gaussFilter) + 1));
	title(['Gaussian Low Pass Filter | sigma = ', num2str(sigma)]);
	colormap('jet');
	colorbar;

	img_out = imf.*gaussFilter;
	img_out = real(ifft2(ifftshift(img_out)));
	img_out = img_out(rows/2 + 1:rows/2 + rows, cols/2 + 1: cols/2 + cols);
	figure;
	imagesc(img_out);
	title(['Gaussian Low Pass Filtered Image | sigma = ', num2str(sigma)]);
	colormap('gray');
	colorbar;
end