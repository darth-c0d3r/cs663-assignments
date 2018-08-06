%% Nearest Neighbor Interpolation

%% Function
function myNearestNeighborInterpolation()
% apply neares-neighbor interpolation inserting factor_r 
% pixels per pixel row-wise and factor_c per pixel column-wise. 
  factor_r=3;
  factor_c=2;
  img_name = '../data/barbaraSmall.png';
  [img, map] = imread(img_name);
  [M,N] = size(img);
  img_out = zeros(factor_r*(M-1)+1,factor_c*(N-1)+1);

  % range of influence around every pixel
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
  
  iptsetpref('ImshowAxesVisible','on');
  figure('units','normalized','outerposition',[0 0 1 1])
  subplot(1,2,1);
  imshow(img, map), colorbar;
  title('Original Image')
  subplot(1,2,2);
  imshow(img_out, map), colorbar;
  title('Enlarged Image using Nearest Neighbor Interpolation')
end
