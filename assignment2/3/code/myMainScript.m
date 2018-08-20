%% MyMainScript

tic;
% scaling is done in code so that the parameter could have a high value;

% Converting intensity range of both images to [0,1].

% img = im2double(imread('../data/grass.png'));
% imgStruct = load('../data/grassNoisy.mat');
% img_noisy = im2double(imgStruct.imgCorrupt);

% imgStruct = load('../data/barbara.mat');
% img = imgStruct.imageOrig;

% img = im2double(imread('../data/honeyCombReal.png'));
% [h,w] = size(img);
% noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
% img = im2double(img);
% img_noisy = im2double(img+noise);

g_filter = fspecial('gaussian', 9, 2);
colormap gray;
imagesc(g_filter);
mults = [1.0, 0.9, 1.1];

%  barbara
img_name = '../data/barbara.mat';
image_struct = load(img_name);
img = image_struct.imageOrig;
[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img = im2double(img);
img_noisy = im2double(img+noise);
figure;
colormap gray;
imagesc(img);
title('barbara normal');
figure;
colormap gray;
imagesc(img_noisy);
title('barbara noisy');
sigma = 87;
disp('Barbara');
for i=1:3
    sd = mults(1,i)*sigma;
    [img_out, rmsd] = myPatchBasedFiltering(img,img_noisy,sd);
    disp(strcat([num2str(mults(1,i)), ' ', num2str(rmsd)]));
    t = strcat(['barbara_', num2str(mults(1,i)),'.png']);
    imwrite(mat2gray(img_out),t);
end

% %  grass
img = im2double(imread('../data/grass.png'));
[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_noisy = img+noise;
figure;
colormap gray;
imagesc(img);
title('grass normal');
figure;
colormap gray;
imagesc(img_noisy);
title('grass noisy');
sigma = 0.84;
disp('Grass');
for i=1:3
    sd = mults(1,i)*sigma;
    [img_out, rmsd] = myPatchBasedFiltering(img,img_noisy,sd);
    disp(strcat([num2str(mults(1,i)), ' ', num2str(rmsd)]));
    t = strcat(['grass_', num2str(mults(1,i)),'.png']);
    imwrite(mat2gray(img_out),t);
end
% 
%  honeycomb
img = im2double(imread('../data/honeyCombReal.png'));
[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_noisy = img+noise;
figure;
colormap gray;
imagesc(img);
title('honeyComb normal');
figure;
colormap gray;
imagesc(img_noisy);
title('honeyComb noisy');
sigma = 0.90;
disp('Honeycomb');
for i=1:3
    sd = mults(1,i)*sigma;
    [img_out, rmsd] = myPatchBasedFiltering(img,img_noisy,sd);
    disp(strcat([num2str(mults(1,i)), ' ', num2str(rmsd)]));
    t = strcat(['honeycomb_', num2str(mults(1,i)),'.png']);
    imwrite(mat2gray(img_out),t);
end


% 0.84 for grassNoisy
% 0.9 for honeyComb
% 87 for barbara

toc;