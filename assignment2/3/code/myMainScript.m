%% MyMainScript

tic;
%% Your code here

var_par = 0.009:0.001:0.010;
for par = var_par
    myPatchBasedFiltering('../data/grassNoisy.mat',par);
end    
    
% 0.010 for grassNoisy
% 0.007 for honeyComb
toc;
