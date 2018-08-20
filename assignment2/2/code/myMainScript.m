%% MyMainScript

tic;
%% Your code here


% %  barbara
img_name = '../data/barbara.mat';
image_struct = load(img_name);
img = image_struct.imageOrig;

% % grass
% img = im2double(imread('../data/grass.png'));

% % honeycomb
% img = im2double(imread('../data/honeyCombReal.png'));

[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_noisy = img+noise;

sigma_space = 2.0;
sigma_inten = 9.0;

space = [1.0, 0.9, 1.1, 1.0, 1.0];
inten = [1.0, 1.0, 0.9, 0.9, 1.1];

iptsetpref('ImshowAxesVisible','on');
figure;
imshow(mat2gray(img)), colorbar;
title('Input Image');
figure;
imshow(mat2gray(img_noisy)), colorbar;
title('Noisy Image');

for i=1:5
    s_sd = space(1,i)*sigma_space;
    i_sd = inten(1,i)*sigma_inten;
    [img_out, rmsd] = myBilateralFiltering(img, img_noisy, s_sd, i_sd);
    
    figure;
    imshow(mat2gray(img_out)), colorbar;
    title(strcat(['Filtered Image, ', num2str(space(1,i), ' ']));
    disp(rmsd);
end

toc;
