function myNearestNeighborInterpolation(factor_r, factor_c)
  img_name = '../data/barbaraSmall.png';
  img = imread(img_name);
  [M,N] = size(img);
  img_out = zeros(factor_r*(M-1)+1,factor_c*(N-1)+1);

  rng_r = ceil((factor_r-1)/2);
  rng_c = ceil((factor_c-1)/2);
  for i = 1:M
    i_ = 1 + (i-1)*factor_r;
    ymin = max(1,i_-rng_r);
    ymax = min(i_+rng_r,factor_r*(M-1)+1);
    for j = 1:N
      j_ = 1 + (j-1)*factor_c;
      xmin = max(1,j_-rng_c);
      xmax = min(j_+rng_c,factor_c*(N-1)+1);
      img_out(ymin:ymax,xmin:xmax)=img(i,j);
    end
  end
  visualize(img_out);
end
