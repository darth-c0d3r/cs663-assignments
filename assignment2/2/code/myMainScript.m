%% MyMainScript

tic;
%% Your code here
sigma_s = 0.8;
sigma_i = 20;

rmsd = zeros(1,1);
for s = sigma_s
    for i = sigma_i
        rmsd(1,1) = myBilateralFiltering('../data/barbara.mat',s ,i);
    end
end
disp(rmsd);
toc;
