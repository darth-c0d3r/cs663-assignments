img = load('image_low_frequency_noise.mat');
sz = size(img.Z, 1);

% 14,8
thresh = 14;
R = 8;

img_pad = padarray(img.Z, [sz/2, sz/2]);
ft_shifted = fftshift(fft2(img_pad));
ft_log = log(abs(ft_shifted)+1);

ft_thresh = find(ft_log > thresh);
ft_ind = ceil(ft_thresh/size(ft_log,1));
ft_ind = [ft_thresh-size(ft_log,1)*(ft_ind-1) ft_ind];

filter = ones(size(ft_shifted));
circ_filter = ones(2*R+1);
for i=1:(2*R+1)
    for j=1:(2*R+1)
        if (i-R-1)^2 + (j-R-1)^2 > R^2
            circ_filter(i,j) = 1;
        else
            circ_filter(i,j) = 0;
        end    
    end
end

for i = 1:size(ft_ind,1)
    filter(ft_ind(i,1)-R:ft_ind(i,1)+R,ft_ind(i,2)-R:ft_ind(i,2)+R) = filter(ft_ind(i,1)-R:ft_ind(i,1)+R,ft_ind(i,2)-R:ft_ind(i,2)+R) .* circ_filter;
end
ft_log_filtered = ft_log .* filter;

ft_shifted = ft_shifted .* filter;
% figure, imshow(mat2gray(abs(ft_shifted)));
img_final = ifft2(ifftshift(ft_shifted));
img_final = img_final(sz/2+1:3*sz/2, sz/2+1:3*sz/2);


% figure
% imshow(ft_log,[-1 18]);
% colormap(jet); colorbar;
% title('Log of FT of Image (shifted)');
% 
% figure
% imshow(filter);
% colormap(gray); colorbar;
% title('Filter');
% 
% figure
% imshow(ft_log_filtered, [-1, 18]);
% colormap(jet); colorbar;
% title('Filtered Log of FT of Image');

% figure
% imshow(mat2gray(img.Z));
% colormap(gray); colorbar;
% title('Original Image');

figure
imshow(mat2gray(img_final));
colormap(gray); colorbar;
title('Final Filtered Image');

