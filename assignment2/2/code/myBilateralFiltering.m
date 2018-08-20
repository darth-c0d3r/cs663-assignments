function rmsd = myBilateralFiltering(img_name, sigma_space, sigma_intensity)
    
%     parameters
    k_size = 11;
%     sigma_space = 5.0;
%     sigma_intensity = 10.0;
    half_k = ceil(k_size/2);
    image_struct = load(img_name);
    img = image_struct.imageOrig;
    [h, w] = size(img);
    noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
    img_noisy = img+noise;
    
    space_filter = fspecial('gaussian', k_size, sigma_space);
%     space_filter = space_filter ./ space_filter(half_k, half_k);
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
%             int_filter = exp(-(im_part-img_noisy(i,j).^2)/(2.0*(sigma_intensity^2)));
            int_filter = normpdf(im_part,img_noisy(i,j),sigma_intensity);
            filter = int_filter .* (space_filter(il:ir, jl:jr));
            numer = sum(sum(filter .* im_part));
            denom = sum(sum(filter));
            img_out(i,j) = numer/denom;
        end
    end
    figure, imshow(mat2gray(img_out));
    figure, imshow(mat2gray(img_noisy));
%     iptsetpref('ImshowAxesVisible','on');
%     figure('units','normalized','outerposition',[0 0 1 1])
%     subplot(1,3,1);
%     imshow(mat2gray(img)), colorbar;
%     title('Input Image')
%     subplot(1,3,2);
%     imshow(mat2gray(img_noisy)), colorbar;
%     title('Noisy Image')
%     subplot(1,3,3);
%     imshow(mat2gray(img_out)), colorbar;
%     title('Filtered Image')
%     
%     rmsd calculation
    rmsd = (img - img_out);
    rmsd = sqrt((sum(sum(rmsd.^2)))/(h*w));
%     disp(rmsd);
end
