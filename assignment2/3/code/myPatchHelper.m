function res = myPatchHelper(window, h)
% <<<<<<< HEAD
%     g_filter = fspecial('gaussian',9,2);
%     center_patch = window(13:21,13:21);
%     center_patch = center_patch.*g_filter;
%     A = im2col(window, [9 9], 'sliding');
%     B = repmat(center_patch(:), [1 625]);
%     C = repmat(g_filter(:), [1 625]);
%     weights = exp(-sum((A.*C-B).^2)/(h*h));
%     center_intensities = A(41,:);
%     res = sum(weights.*center_intensities)/sum(weights);
% =======
    center_patch = window(13:21,13:21);
    g = @(X) exp(-sum(sum((X-center_patch).^2))/(h*h));  
%     weights = nlfilter(window, [9 9], g);
    for i=5:29
        for j=5:29
            weights(i,j) = g(window(i-4:i+4,j-4:j+4));
        end
    end
%     Removing boundaries
    weights(1:4,:) = 0;
    weights(30:33,:) = 0;
    weights(:,1:4) = 0;
    weights(:,30:33) = 0;

%     Removing center pixel
    weights(17,17) = 0;
    
    res = sum(sum(weights.*window))/sum(sum(weights));
% >>>>>>> e3a4e45e7a82db793f4e0219e302c659c75e7f04
end