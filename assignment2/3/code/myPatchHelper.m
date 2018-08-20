function res = myPatchHelper(window, h)
    g_filter = fspecial('gaussian',9,2);
    A = im2col(window, [9 9], 'sliding');
    B = repmat(A(:,ceil(end/2)), [1 size(A,2)]);
    C = repmat(g_filter(:), [1 size(A,2)]);
    D = (A-B).*C;
%     Scaling so that parameter can have high value
    D = D*100;
    weights = exp(-sum(D.*D)/(h*h));
    center_intensities = A(ceil(end/2),:);
    res = sum(weights.*center_intensities)/sum(weights);
end
