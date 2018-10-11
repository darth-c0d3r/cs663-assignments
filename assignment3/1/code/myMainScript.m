%% MyMainScript

tic;
%% Your code here

% Optmial value of parameters is:
% Sigma_smoothing = 1
% Sigma_weights = 1
% k = 0.05
myHarrisCornerDetector('../data/boat.mat',1,1,0.05,5,0.01);

toc;
