function myHarrisCornerDetector(img_name, sigma_smooth, sigma_wt, k)
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
    
    g_filter = fspecial('gaussian',3, sigma_wt);
    E1 = zeros(h,w);
    E2 = zeros(h,w);
    R = zeros(h,w);
    for i=2:h-1
        for j=2:w-1
            m11 = sum(sum(Mx(i-1:i+1,j-1:j+1).*g_filter));
            m12 = sum(sum(Mxy(i-1:i+1,j-1:j+1).*g_filter));
            m22 = sum(sum(My(i-1:i+1,j-1:j+1).*g_filter));
            M = [m11 m12; m12 m22];
            E = eig(M);
            E1(i,j) = min(E);
            E2(i,j) = max(E);
            R(i,j) = det(M)-k*trace(M)*trace(M);
        end
    end
    
    disp(min(min(E1)));
    disp(max(max(E1)));
    disp(mean(mean(E1)));
    disp(min(min(E2)));
    disp(max(max(E2)));
    disp(mean(mean(E2)));
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