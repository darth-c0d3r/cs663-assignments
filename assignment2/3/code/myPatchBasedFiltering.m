function myPatchBasedFiltering(img_real, img_noisy, par)
    [h, w] = size(img_noisy);
    f = @(X) myPatchHelper(X, par);
    img_out = nlfilter(img_noisy, [33 33], f);
    rmsd = sqrt((sum(sum((img_real-img_out).^2)))/(h*w));
    disp(rmsd);
    figure
    colormap gray;
    imagesc(img_out);
end
