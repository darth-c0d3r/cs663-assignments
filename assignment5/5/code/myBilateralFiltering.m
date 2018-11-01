function [img_out, rmse] = myBilateralFiltering(img, img_noisy, sigma_space, sigma_intensity)
    
    k_size = 11;
    [h, w] = size(img);
    
    space_filter = fspecial('gaussian', k_size, sigma_space);
    img_out = img_noisy;
    sz = ceil((k_size-1)/2);
    for i=1:h
        for j=1:w
            i_min = max(1, i-sz);
            i_max = min(h, i+sz);
            j_min = max(1, j-sz);
            j_max = min(w, j+sz);
            il = i_min - i + sz + 1;
            jl = j_min - j + sz + 1;
            ir = 2*sz + 1 - ((i+sz)-(i_max));
            jr = 2*sz + 1 - ((j+sz)-(j_max));
            im_part = img_noisy(i_min:i_max,j_min:j_max);
            int_filter = normpdf(im_part,img_noisy(i,j),sigma_intensity);
            filter = int_filter .* (space_filter(il:ir, jl:jr));
            filter = filter ./ sum(sum(filter));
            img_out(i,j) = sum(sum(filter .* im_part));
        end
    end
    rmse = (img - img_out);
    rmse = sqrt((sum(sum(rmse.^2)))/(h*w));

    figure;
    subplot(1,2,1);
    imshow(mat2gray(img_noisy));
    title('Noisy Image');
    subplot(1,2,2);
    imshow(mat2gray(img_out));
	title(['Bilateral Filtered Image | rmse = ', num2str(rmse)]);

end