function pix_out = myAHE_helper(img,p,q)
  [w,h,d] = size(img);
  img_out = img;
  i=1:w;
  j=1:h;
  hist_ = zeros(1,256);
  x = reshape(img(i,j), 1, w*h);
  [a,b] = hist(x, unique(x)); 
  hist_(b+1) = a;
  cdf = cumsum(hist_);
  cdf = (cdf/cdf(256))*255;
  pix_out = cdf(img(p,q)+1);
endfunction