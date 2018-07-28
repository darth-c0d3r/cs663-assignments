function myNearestNeighborInterpolation(factor)
  img_name = '../data/barbaraSmall.png';
  img = imread(img_name);
  [M,N] = size(img);
  img_out = zeros(factor*(M-1)+1,factor*(N-1)+1);

  rng = ceil(factor/2);
  for i = 1:M
    i_ = 1 + (i-1)*factor;
    ymin = max(1,i_-rng);
    ymax = min(i_+rng,factor*(M-1)+1);
    for j = 1:N
      j_ = 1 + (j-1)*factor;
      xmin = max(1,j_-rng);
      xmax = min(j_+rng,factor*(N-1)+1);
      img_out(ymin:ymax,xmin:xmax)=img(i,j);
    end
  end
  visualize(img_out);
endfunction
