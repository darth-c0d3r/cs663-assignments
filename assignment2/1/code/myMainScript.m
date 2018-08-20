%% MyMainScript

tic;
%% Your code here

myUnsharpMasking('../data/lionCrop.mat', 0.25, 5);
myUnsharpMasking('../data/lionCrop.mat', 0.5, 5);
myUnsharpMasking('../data/lionCrop.mat', 0.75, 5);

myUnsharpMasking('../data/lionCrop.mat', 0.25, 3);
myUnsharpMasking('../data/lionCrop.mat', 0.5, 3);
myUnsharpMasking('../data/lionCrop.mat', 0.75, 3);

toc;

