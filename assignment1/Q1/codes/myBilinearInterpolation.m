function myBilinearInterpolation(factor_r, factor_c)
  img_name = '../data/barbaraSmall.png';
  img = imread(img_name);
  [M,N] = size(img);
  img_out = zeros(factor_r*(M-1)+1,factor_c*(N-1)+1);
  for i = 1:M
    for j = 1:N
      img_out(1+(i-1)*factor_r,1+(j-1)*factor_c) = img(i,j);
    end
  end
  img_out = b_interpolate_x(img_out, factor_c, factor_r);
  img_out = b_interpolate_x(img_out', factor_r, 1)';
  visualize(img_out);
endfunction
