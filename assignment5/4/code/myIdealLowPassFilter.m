function [] = myIdealLowPassFilter(imf, h, w, D)
	H = zeros(2*h, 2*w);
	for i = 1:abs(D)
		for j = 1:abs(D)
			if i*i + j*j <= D*D
				H(h + i, w + j) = 1;
				H(h - i, w + j) = 1;
				H(h + i, w - j) = 1;
				H(h - i, w - j) = 1;
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
	img_out = img_out(h/2 + 1:h/2 + h, w/2 + 1:w/2 + w);
	figure;
	imagesc(img_out);
	title(['Ideal Low Pass Filtered Image | D = ', num2str(D)]);
	colormap('gray');
	colorbar;
end