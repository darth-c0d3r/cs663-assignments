
%% MyMainScript

tic;
myUnsharpMasking('../data/lionCrop.mat', 2, 2);
myUnsharpMasking('../data/superMoonCrop.mat', 0.1, 1);

toc;