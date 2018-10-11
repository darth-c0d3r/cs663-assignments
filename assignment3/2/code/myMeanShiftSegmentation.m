function myMeanShiftSegmentation(hr, hs, num_iter, num_neighbours)
	
    filename = '../data/baboonColor.png';
	img_in = imread(filename);
	img = imgaussfilt(img_in, 1);
	img = imresize(img, 0.5);

	img_size = size(img);
	img_out = zeros(img_size);
	num_rows = img_size(1);
	num_cols = img_size(2);

	samples = zeros(5, num_rows*num_cols);

	for i = 1:num_rows
		for j = 1:num_cols
			samples(:, i*num_cols - num_cols + j) = [i; j; img(i, j, 1); img(i, j, 2); img(i, j, 3)];
		end
	end

	X = samples';
	X(:, 1:2) = X(:, 1:2)/hs;
	X(:, 3:5) = X(:, 3:5)/hr;

	for i = 1:num_iter
		[idx, D] = knnsearch(X, X, 'K', num_neighbours);
		weights = exp(-(D.^2));
		sum_weights = sum(weights, 2);
		for j = 3:5
			X(:, j) = sum(weights.*reshape(X(idx(:, :), j), [], num_neighbours), 2)./sum_weights;
		end
	end

	for i = 1:num_rows
		for j = 1:num_cols
			img_out(i, j, :) = X(i*num_cols - num_cols + j, 3:5);
		end
	end

	img_out = imresize(img_out, 2);

	figure;
	subplot(1,2,1);
	imshow(img_in);
	title('Original Image');

	subplot(1,2,2);
	imshow(img_out);
	title(['Segmented Image (hr = ' num2str(hr) ' || hs = ' num2str(hs) ')'])
end