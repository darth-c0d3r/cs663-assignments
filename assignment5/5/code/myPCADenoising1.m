function rmse = myPCADenoising(im, im1, patch_size, sigma)
	[rows, cols] = size(im1);
	m = rows -patch_size + 1;
	n = cols -patch_size + 1;
	P = zeros(patch_size^2, m*n);
	count = m*n;
	for i = 1:m
		for j = 1:n
			P(:, (i - 1)*n + j) = reshape(im1(i:i + patch_size - 1, j:j + patch_size - 1), [], 1);
		end
	end

	[W, D] = eig(P*P');

	alpha = W'*P;
	alpha_mean = zeros(1, patch_size^2);

	for i = 1:patch_size^2
		alpha_mean(i)=max(0,sum(alpha(i,:)*(alpha(i,:)'))*(1/count)-sigma*sigma);
	end

	alpha_denoised=zeros(49,rows-6*cols-6);
	for i = 1:patch_size^2
		for j = 1:count
			alpha_denoised(i,j)=alpha(i,j)/(1+((sigma*sigma)/alpha_mean(i)));
		end
	end

	im2_a = zeros(rows, cols);
	im2_b = zeros(rows, cols);

	P_reconstruct = W*alpha_denoised;

	for i = 1:m
		for j = 1:n
			im2_a(i:i + patch_size - 1, j:j + patch_size - 1) = im2_a(i:i + patch_size - 1, j:j + patch_size - 1) + reshape(P_reconstruct(:, (i - 1)*m + j), [], patch_size);
			im2_b(i:i + patch_size - 1, j:j + patch_size - 1) = im2_b(i:i + patch_size - 1, j:j + patch_size - 1) + 1;
		end
	end

	im2 = im2_a./im2_b;

	dif = double(im2) - double(im);
	dif = dif.*dif;
	rmse = sqrt(sum(dif(:))/(rows*cols));

	figure;
	subplot(1, 2, 1);
	imshow(im1/255);
	title('Noised Image');
	subplot(1, 2, 2);
	imshow(im2/255);
	title(['PCADenoised1 Image | rmse = ', num2str(rmse)]);

end