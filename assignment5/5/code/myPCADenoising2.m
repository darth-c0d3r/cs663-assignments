function rmse = myPCADenoising2(im1, patch_size, sigma)
	[rows, cols] = size(im1);
	m = rows - patch_size + 1;
	n = cols - patch_size + 1;
	P = zeros(patch_size^2, m*n);
	P_reconstruct = P;

	K = 200;

	for i = 1:m
		for j = 1:n
			P(:, (i-1)*n + j) = reshape(im1(i:i + patch_size - 1, j:j + patch_size - 1), [], 1);
		end
	end

	im2_a = zeros(rows, cols);
	im2_b = zeros(rows, cols);

	for i = 1:m
		for j = 1:n
			z = (i - 1)*n+j;
			x_min = max(1, i - 15);
			x_max = min(m, i + 15);
			y_min = max(1, j - 15);
			y_max = min(n, j + 15);
			for k = x_min:x_max
				for l = y_min:y_max
					Q(:, (x_max - x_min + 1)*(k - x_min) + (l - y_min + 1)) = P(:, (k - 1)*m + l);
				end
			end

			[IDX, D] = knnsearch(Q', P(:, z)', 'K', K);
			Q = Q(:, IDX);

			[W,D] = eig(Q*Q');
			alpha = W'*Q;
			alpha_mean = max(0, diag(alpha*alpha')/K - sigma*sigma);
			alpha_check = (((alpha_mean/sigma*sigma).^(-1))+1).^(-1);
			alpha_denoised = diag(alpha_check)*alpha(:, 1);

			P_reconstruct(:, z) = W*alpha_denoised;
		end
	end

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