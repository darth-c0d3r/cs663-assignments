function myBilateralFiltering(img_name)
    
%     parameters
    k_size = 5;
    sigma_space = 10;
    sigma_intensity = 10;
    
    image_struct = load(img_name);
    img = image_struct.imageOrig;
    [h, w] = size(img);
    noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
    img_noisy = img+noise;
    
    space_filter = fspecial('gaussian', k_size, sigma_space);
%     imagesc(mat2gray(space_filter));
    img_out = img_noisy;
    for i=k_size:(h-k_size)
        for j=k_size:(w-k_size)
            im_part = img_noisy(i:i+k_size-1,j:j+k_size-1);
            int_filter = normpdf(im_part,img_noisy(i,j),sigma_intensity);
            filter = int_filter .* space_filter;
            numer = sum(sum(filter .* im_part));
            denom = sum(sum(filter));
            img_out(i+floor(k_size/2),j+floor(k_size/2)) = numer/denom;
        end
    end
    figure, imshow(mat2gray(img_out));
    figure, imshow(mat2gray(img_noisy));
end