function [] = myIdealLowPassFilter(imf, rows, cols, D)
	H = zeros(2*rows, 2*cols);
	for i = 1:abs(D)
		for j = 1:abs(D)
			if i*i + j*j <= D*D
				H(rows + i, cols + j) = 1;
				H(rows - i, cols + j) = 1;
				H(rows + i, cols - j) = 1;
				H(rows - i, cols - j) = 1;
            end
		end
	end
	figure;
	imagesc(log(abs(H) + 1));
	title(['Ideal Low Pass Filter | D = ', num2str(D)]);
	colormap('jet');
	colorbar;

	img_out = imf.*H;
	img_out = real(ifft2(ifftshift(img_out)));
	img_out = img_out(rows/2 + 1:rows/2 + rows, cols/2 + 1:cols/2 + cols);
	figure;
	imagesc(img_out);
	title(['Ideal Low Pass Filtered Image | D = ', num2str(D)]);
	colormap('gray');
	colorbar;
end