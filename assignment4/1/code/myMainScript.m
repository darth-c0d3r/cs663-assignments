%% MyMainScript

tic;
%% Your code here

[ORL_train, ORL_test] = getORL('../images/ORL_faces');
eigORL(ORL_train, ORL_test);
svdORL(ORL_train, ORL_test);

% [Yale_train, Yale_test] = getYale('../images/CroppedYale');
% svdYale(Yale_train, Yale_test);

toc;

function [train, test] = getORL(path)
    train = [];
    test = [];
    for i=1:32
        folder = strcat(path,'/s',int2str(i));
        D = dir(folder);
        for idx=3:size(D,1)
            img_name = strcat(folder,'/',D(idx).name);
            img = imread(img_name);
            [r, c] = size(img);
            col = double(reshape(img',r*c,1));
            if idx < 9
                train = [train col];
            else
                test = [test col];
            end    
        end
    end
    
    X_mean = mean(train,2);
    train = train - X_mean;
    test = test - X_mean;
end

function [train, test] = getYale(path)
    train = [];
    test = [];
    PATH = dir(path);
    for i=3:size(PATH,1)
        folder = strcat(path,'/',PATH(i).name);
        D = dir(folder);
        for idx=3:size(D,1)
            img_name = strcat(folder,'/',D(idx).name);
            img = imread(img_name);
            [r, c] = size(img);
            col = double(reshape(img',r*c,1));
            if idx < 43
                train = [train col];
            else
                test = [test col];
            end    
        end
    end
    
    X_mean = mean(train,2);
    train = train - X_mean;
    test = test - X_mean;
    disp("Matrices Generated!");
end