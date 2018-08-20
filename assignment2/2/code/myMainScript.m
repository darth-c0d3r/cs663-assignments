%% MyMainScript

tic;
%% Your code here
sigma_s = 1.25;
sigma_i = 0.1;

% %  barbara
img_name = '../data/barbara.mat';
image_struct = load(img_name);
img = image_struct.imageOrig;
[h, w] = size(img);
noise = randn(h,w)*(max(max(img))-min(min(img)))*0.05;
img_noisy = img+noise;

% % grass
% img_struct = load('../data/grassNoisy.mat');
% img_noisy = im2double(img_struct.imgCorrupt);
% img = im2double(imread('../data/grass.png'));

% % honeycomb
% img_struct = load('../data/honeyCombReal_Noisy.mat');
% img_noisy = im2double(img_struct.imgCorrupt);
% img = im2double(imread('../data/honeyCombReal.png'));


rmsd = zeros(1,1);
for s = sigma_s
    disp(s);
    for i = sigma_i
        rmsd(1,1) = myBilateralFiltering(img, img_noisy, s, i);
%         disp(rmsd(s,i));
    end
end
% disp(rmsd);
toc;
