function myBilinearInterpolation(factor_r, factor_c)
% apply bilinear interpolation inserting factor_r pixels per pixel 
% row-wise and factor_c per pixel column-wise. 
  img_name = '../data/barbaraSmall.png';
  img = imread(img_name);
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
  visualize(img_out);
end
