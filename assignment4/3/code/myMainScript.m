%% MyMainScript

tic;
%% Your code here

[ORL_train, ORL_test] = getORL('../../1/images/ORL_faces');
eigORL(ORL_train, ORL_test);

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
            col = double(reshape(img,r*c,1));
            if idx < 9
                train = [train col];
            else
                test = [test col];
            end    
        end
    end
    
    for i=33:40
        folder = strcat(path,'/s',int2str(i));
        D = dir(folder);
        for idx=9:size(D,1)
            img_name = strcat(folder,'/',D(idx).name);
            img = imread(img_name);
            [r, c] = size(img);
            col = double(reshape(img,r*c,1));
            test = [test col];    
        end
    end
    
    X_mean = mean(train,2);
    train = train - X_mean;
    test = test - X_mean;
end