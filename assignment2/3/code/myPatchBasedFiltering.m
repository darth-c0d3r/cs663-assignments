function myPatchBasedFiltering(img_name, par)
    image_struct = load(img_name);
    img = image_struct.imageOrig;
    [h, w] = size(img);
    f = @(X) myPatchHelper(X, par);
    img_out = nlfilter(img, [33 33], f);
    figure
    colormap gray;
    imagesc(img_out);
    rmsd = (img - img_out);
    rmsd = sqrt((sum(sum(rmsd.^2)))/(h*w));
    disp(rmsd);
end