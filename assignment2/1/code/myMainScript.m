%% MyMainScript

tic;
%% Your code here

myUnsharpMasking('../data/lionCrop.mat', 1, 2);
myUnsharpMasking('../data/lionCrop.mat', 2, 2);
myUnsharpMasking('../data/lionCrop.mat', 0.7, 2);
myUnsharpMasking('../data/lionCrop.mat', 0.5, 2);
myUnsharpMasking('../data/lionCrop.mat', 0.3, 2);

toc;

