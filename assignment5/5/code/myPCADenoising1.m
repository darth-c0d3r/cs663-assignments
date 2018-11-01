function rmse = myPCADenoising(im1, patch_size, sigma)
	[rows, cols] = size(im1);
	m = rows -patch_size + 1;
	n = cols -patch_size + 1;
	P = zeros(patch_size^2, m*n);
	for i = 1:m
		for j = 1:n
			P(:, (i - 1)*n + j) = reshape(im1(i:i + patch_size - 1, j:j + patch_size - 1), [], 1);
		end
	end

	[W, D] = eig(P*P');

	alpha = W'*P;
	alpha_mean = max(0, diag(alpha*alpha')/m*n - sigma*sigma);
	alpha_check = (((alpha_mean/sigma*sigma).^(-1))+1).^(-1);
	alpha_denoised = diag(alpha_check)*alpha;

	im2_a = zeros(rows, cols);
	im2_b = zeros(rows, cols);

	P_reconstruct = W*alpha_denoised;

	for i = 1:m
		for j = 1:n
			im2_a(i:i + patch_size - 1, j:j + patch_size - 1) = im2_a(i:i + patch_size - 1, j:j + patch_size - 1) + reshape(P_reconstruct(:, (i - 1)*n + j), [], patch_size);
			im2_b(i:i + patch_size - 1, j:j + patch_size - 1) = im2_b(i:i + patch_size - 1, j:j + patch_size - 1) + 1;
		end
	end

	im2 = im2_a./im2_b;
	subplot(1, 2, 1);
	imshow(im1/255);
	subplot(1, 2, 2);
	imshow(im2/255);

	dif = double(im2) - double(im);
	dif = dif.*dif;
	rmse = sqrt(sum(dif(:))/(rows*cols));
end