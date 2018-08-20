function res = myPatchHelper(window, h)
    g_filter = fspecial('gaussian',9,2);
    center_patch = window(13:21,13:21);
    center_patch = center_patch.*g_filter;
    A = im2col(window, [9 9], 'sliding');
    B = repmat(center_patch(:), [1 625]);
    C = repmat(g_filter(:), [1 625]);
    weights = exp(-sum((A.*C-B).^2)/(h*h));
    center_intensities = A(41,:);
    res = sum(weights.*center_intensities)/sum(weights);
end