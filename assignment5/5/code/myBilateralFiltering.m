function [img_out, rmse] = myBilateralFiltering(im, im1, sigma_space, sigma_intensity)
	
	[rows, cols] = size(im);
	img_out = zeros(rows, cols);

	for i = 1:rows
		for j = 1:cols
			

	figure;
	subplot(1,2,1);
	imshow(mat2gray(im1));
	title('Noised Image');
	subplot(1,2,2);
	imshow(mat2gray(img_out));
	title(['Bilateral Filtered Image | rmse = ', num2str(rmse)]);
end