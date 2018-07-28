function myBilinearInterpolation(factor)
  img_name = '../data/barbaraSmall.png';
  img = imread(img_name);
  [M,N] = size(img);
  img_out = zeros(factor*(M-1)+1,factor*(N-1)+1);
  for i = 1:M
    for j = 1:N
      img_out(1+(i-1)*factor,1+(j-1)*factor) = img(i,j);
    end
  end
  img_out = b_interpolate_x(img_out, factor, factor);
  img_out = b_interpolate_x(img_out', factor,1)';
  visualize(img_out);
endfunction
