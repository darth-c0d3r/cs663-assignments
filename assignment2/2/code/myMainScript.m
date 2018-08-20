%% MyMainScript

tic;
%% Your code here
space = [1.0, 0.9, 1.1, 1.0, 1.0];
inten = [1.0, 1.0, 0.9, 0.9, 1.1];


%  barbara
img_name = '../data/barbara.mat';
image_struct = load(img_name);
img = image_struct.imageOrig;
[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_noisy = img+noise;

sigma_space = 1.45;
sigma_inten = 9.9;

% iptsetpref('ImshowAxesVisible','on');
% figure;
% imshow(mat2gray(img)), colorbar;
% title('Input Image');
% figure;
% imshow(mat2gray(img_noisy)), colorbar;
% title('Noisy Image');
disp('Barbara');
for i=1:5
    s_sd = space(1,i)*sigma_space;
    i_sd = inten(1,i)*sigma_inten;
    [img_out, rmsd] = myBilateralFiltering(img, img_noisy, s_sd, i_sd);
    
%     figure;
%     imshow(mat2gray(img_out)), colorbar;
%     title(strcat(['Filtered Image, s-sd*', num2str(space(1,i)), ' i-id*', num2str(inten(1,i))]));
    disp(strcat([num2str(space(1,i)), ' ', num2str(inten(1,i)), ' ' , num2str(rmsd)]));
    t = strcat(['barbara_', num2str(space(1,i)), '_', num2str(inten(1,i)),'.png']);
    imwrite(mat2gray(img_out),t);
end

% grass
img = im2double(imread('../data/grass.png'));
[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_noisy = img+noise;

% iptsetpref('ImshowAxesVisible','on');
% figure;
% imshow(mat2gray(img)), colorbar;
% title('Input Image');
% figure;
% imshow(mat2gray(img_noisy)), colorbar;
% title('Noisy Image');

sigma_space = 0.8;
sigma_inten = 0.165;

disp('Grass');
for i=1:5
    s_sd = space(1,i)*sigma_space;
    i_sd = inten(1,i)*sigma_inten;
    [img_out, rmsd] = myBilateralFiltering(img, img_noisy, s_sd, i_sd);
    
%     figure;
%     imshow(mat2gray(img_out)), colorbar;
%     title(strcat(['Filtered Image, s-sd*', num2str(space(1,i)), ' i-id*', num2str(inten(1,i))]));
    disp(strcat([num2str(space(1,i)), ' ', num2str(inten(1,i)), ' ' , num2str(rmsd)]));
    t = strcat(['grass_', num2str(space(1,i)), '_', num2str(inten(1,i)),'.png']);
    imwrite(mat2gray(img_out),t);
end


% % honeycomb
img = im2double(imread('../data/honeyCombReal.png'));
[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_noisy = img+noise;

% iptsetpref('ImshowAxesVisible','on');
% figure;
% imshow(mat2gray(img)), colorbar;
% title('Input Image');
% figure;
% imshow(mat2gray(img_noisy)), colorbar;
% title('Noisy Image');

sigma_space = 1.05;
sigma_inten = 0.14;

disp('HoneyComb');
for i=1:5
    s_sd = space(1,i)*sigma_space;
    i_sd = inten(1,i)*sigma_inten;
    [img_out, rmsd] = myBilateralFiltering(img, img_noisy, s_sd, i_sd);
    
%     figure;
%     imshow(mat2gray(img_out)), colorbar;
%     title(strcat(['Filtered Image, s-sd*', num2str(space(1,i)), ' i-id*', num2str(inten(1,i))]));
    disp(strcat([num2str(space(1,i)), ' ', num2str(inten(1,i)), ' ' , num2str(rmsd)]));
    t = strcat(['honeycomb_', num2str(space(1,i)), '_', num2str(inten(1,i)),'.png']);
    imwrite(mat2gray(img_out),t);
end

toc;
