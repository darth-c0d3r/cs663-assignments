%% MyMainScript

tic;
%% Your code here

% Converting intensity range of both images to [0,1].

% img_real = im2double(imread('../data/grass.png'));
% imgStruct = load('../data/grassNoisy.mat');
% img_noisy = im2double(imgStruct.imgCorrupt);

% imgStruct = load('../data/barbara.mat');
% img = imgStruct.imageOrig;
img = im2double(imread('../data/honeyCombReal.png'));
[h,w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_real = im2double(img);
img_noisy = im2double(img+noise);

g_filter = fspecial('gaussian', 9, 2);

var_par = 0.7:0.05:1.1;
for par = var_par
    myPatchBasedFiltering(img_real,img_noisy,par);
end    
    
toc;
% 0.84 for grassNoisy
% 0.9 for honeyComb
% 87 for barbara

toc;
