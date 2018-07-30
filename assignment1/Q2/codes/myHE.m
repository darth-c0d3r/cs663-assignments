function myHE(img_name)
  img = imread(img_name);
  [w,h,d] = size(img);
  img_out = img;
  i=1:w;
  j=1:h;
  
  for k=1:d
    hist_ = zeros(1,256);
    x = reshape(img(i,j,k), 1, w*h);
    [a,b] = hist(x, unique(x)); 
    hist_(b+1) = a;
    cdf = cumsum(hist_);
    cdf = (cdf/cdf(256))*255;
    img_out(i,j,k) = cdf(img(i,j,k)+1);
  end
  visualize(img_out);
  
end