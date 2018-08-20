function [img_out,rmsd] = myPatchBasedFiltering(img_real, img_noisy, par)
    [h, w] = size(img_noisy);
    f = @(X) myPatchHelper(X, par);
    img_out = nlfilter(img_noisy, [33 33], f);
    rmsd = sqrt((sum(sum((img_real-img_out).^2)))/(h*w));  
end