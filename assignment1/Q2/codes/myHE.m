function myHE(img_name)
% apply histogram equalization on a given image
  img = imread(img_name);
  [w,h,d] = size(img);
  img_out = img;
  i=1:w;
  j=1:h;
  
  % iterate over all channels  
  for k=1:d
    x = reshape(img(i,j,k), 1, w*h);
    hist_ = histc(x, 0:255); % histogram of given image
    cdf = cumsum(hist_); % cdf of given image
    cdf = (cdf/cdf(256))*255;
    img_out(i,j,k) = cdf(img(i,j,k)+1);
  end
  visualize(img_out);
  
end