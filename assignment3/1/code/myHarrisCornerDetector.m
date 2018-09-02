function myHarrisCornerDetector(img_name, sigma_smooth, sigma_wt, patch_size, k)
    imgStruct = load(img_name);
    img = mat2gray(imgStruct.imageOrig);
    img = imgaussfilt(img, sigma_smooth);
    [h, w] = size(img);
%     X and Y Gradients of image
    [Ix,Iy] = imgradientxy(img);
%     figure;
%     subplot(1,2,1)
%     imshow(Ix);
%     colorbar;
%     title('X derivative image');
%     
%     subplot(1,2,2)
%     imshow(Iy);
%     colorbar;
%     title('Y derivative image');

    Mx = Ix.*Ix;
    My = Iy.*Iy;
    Mxy = Ix.*Iy;
    
    g_filter = fspecial('gaussian',patch_size, sigma_wt);
    E1 = zeros(h,w);
    E2 = zeros(h,w);
    R = zeros(h,w);
    sz = (patch_size-1)/2;
    for i=1:h
        for j=1:w
            i_rng = max(i-sz,1):min(i+sz,h);
            j_rng = max(j-sz,1):min(j+sz,w);
            m11 = sum(sum(Mx(i_rng,j_rng).*g_filter));
            m12 = sum(sum(Mxy(i_rng,j_rng).*g_filter));
            m22 = sum(sum(My(i_rng,j_rng).*g_filter));
            M = [m11 m12; m12 m22];
            E = eig(M);
            E1(i,j) = min(E);
            E2(i,j) = max(E);
            R(i,j) = det(M)-k*trace(M)*trace(M);
        end
    end
    
%     figure;
%     subplot(1,2,1);
%     imshow(mat2gray(E1));
%     colorbar;
%     title('Eigenvalue 1');
%     
%     subplot(1,2,2);
%     imshow(mat2gray(E2));
%     colorbar;
%     title('Eigenvalue 2');
    
    corners = (R>0)*200;
    figure;
    imshow(mat2gray(corners));
    colorbar;
    title('Corners');

end
