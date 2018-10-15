%% MyMainScript

tic;
%% Your code here
[Yale_train, r, c] = getYale('../../1/images/CroppedYale');
reconstruction(Yale_train, mean(Yale_train,2), r, c);

toc;

function [train, r, c] = getYale(path)
    train = [];
    PATH = dir(path);
    for i=3:size(PATH,1)
        folder = strcat(path,'/',PATH(i).name);
        D = dir(folder);
        for idx=3:42
            img_name = strcat(folder,'/',D(idx).name);
            img = imread(img_name);
            [r, c] = size(img);
            col = double(reshape(img,r*c,1));
            train = [train col];
        end
    end
    disp("Matrices Generated!");
end