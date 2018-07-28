function myBilinearInterpolation(factor_r, factor_c)
  img_name = '../data/barbaraSmall.png';
  img = imread(img_name);
  [M,N] = size(img);
  w = factor_r*(M-1)+1;
  h = factor_c*(N-1)+1;
  img_out = zeros(w,h);
  img_out(1:factor_r:w, 1:factor_c:h) = img;
  img_out = b_interpolate_x(img_out, factor_c, factor_r);
  img_out = b_interpolate_x(img_out', factor_r, 1)';
  visualize(img_out);
endfunction
