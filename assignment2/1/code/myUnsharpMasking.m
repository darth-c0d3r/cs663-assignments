function [imgOutput] = myUnsharpMasking(img_in, scale, radius)
    
    img = load(img_in);
    imgIn = img.imageOrig;

    imgInput = mat2gray(myLinearContrastStretching(mat2gray(imgIn)));
    
    gaussian = fspecial('gaussian', [5,5], radius);
    img_blurred = imfilter(imgIn, gaussian, 'conv');
    output_mat = imgIn + scale*(imgIn - img_blurred);
    imgOutput = mat2gray(myLinearContrastStretching(mat2gray(output_mat)));
    
    figure;
    subplot(1,2,1);
    imshow(imgInput), colorbar;
    title('Original Image');
    subplot(1,2,2);
    imshow(imgOutput), colorbar;
    title('Sharpened Image');
    
end