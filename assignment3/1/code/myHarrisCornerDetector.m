function myHarrisCornerDetector(img_name, sigma_smooth, sigma_wt, k, patch_size, thr)
    imgStruct = load(img_name);
    img = mat2gray(imgStruct.imageOrig);
    img = imgaussfilt(img, sigma_smooth);
    [h, w] = size(img);
%     X and Y Gradients of image
    [Ix,Iy] = imgradientxy(img);
    figure;
    imshow(Ix);
    colorbar;
    title('X derivative image');
    
    figure;
    imshow(Iy);
    colorbar;
    title('Y derivative image');

%     Matrices helpful for calculating the structure tensor at each vertex
    Mx = Ix.*Ix;
    My = Iy.*Iy;
    Mxy = Ix.*Iy;
    
%     Gaussian filter for patch weights
    g_filter = fspecial('gaussian',patch_size, sigma_wt);
%     Matrices to store eigen values and 'R' value at each pixel
    E1 = zeros(h,w);
    E2 = zeros(h,w);
    R = zeros(h,w);
    sz = ceil((patch_size-1)/2);
    for i=1:h
        for j=1:w
%             Valid limits of window
            i_rng = max(i-sz,1):min(i+sz,h);
            j_rng = max(j-sz,1):min(j+sz,w);
            
%             Cropping the filter appropriately to deal with corner patches
            filt = g_filter(i_rng+sz+1-i, j_rng+sz+1-j);
            filt = filt/sum(sum(filt));
            m11 = sum(sum(Mx(i_rng,j_rng).*filt));
            m12 = sum(sum(Mxy(i_rng,j_rng).*filt));
            m22 = sum(sum(My(i_rng,j_rng).*filt));
            M = [m11 m12; m12 m22];     % M is the structure tensor
            E = eig(M);     % E gives the set of eigenvalues
            E1(i,j) = min(E);       % Matrix for first eigen-values
            E2(i,j) = max(E);       % Matrix for second eigen-values
            R(i,j) = det(M)-k*trace(M)*trace(M);    % R value for corresponding pixel
        end
    end
    
%     Considering all pixels with value > threshold as corners    
    corners = (R>thr);
    
    figure;
    imshow(mat2gray(E1));
    colorbar;
    title('Eigenvalue 1');
    
    figure;
    imshow(mat2gray(E2));
    colorbar;
    title('Eigenvalue 2');
    
    figure;
    imshow(mat2gray(corners));
    colorbar;
    title('Corners');

end
