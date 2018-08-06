%% Bilinear Interpolation

%% Function
function myBilinearInterpolation()
% apply bilinear interpolation inserting factor_r pixels per pixel 
% row-wise and factor_c per pixel column-wise. 
  factor_r = 3;
  factor_c = 2;
  img_name = '../data/barbaraSmall.png';
  [img, map] = imread(img_name);
  
  [M,N] = size(img);
  w = factor_r*(M-1)+1;
  h = factor_c*(N-1)+1;
  img_out = zeros(w,h);
  % copy the original image into new-image in sparse positions
  img_out(1:factor_r:w, 1:factor_c:h) = img;
  % apply row-wise bilinear interpolation every factor_r columns
  img_out = b_interpolate_x(img_out, factor_c, factor_r);
  % apply column-wise bilinear interpolation on every column
  % apply it on transpose so that same function for rows can be reused.
  img_out = b_interpolate_x(img_out', factor_r, 1)';

  iptsetpref('ImshowAxesVisible','on');
  figure('units','normalized','outerposition',[0 0 1 1])
  subplot(1,2,1);
  imshow(img, map), colorbar;
  title('Original Image')
  subplot(1,2,2);
  imshow(img_out, map), colorbar;
  title('Enlarged Image using Bilinear Interpolation');
  
end
