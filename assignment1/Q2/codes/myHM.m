function myHM(img_name, img_ref_name)
  img = imread(img_name);
  img_ref = imread(img_ref_name);
  
  [w,h,d] = size(img);
  [wr, hr, ~] = size(img_ref);
  
  img_out = img;
  i=1:w;
  j=1:h;
  
  for k=1:d
    x = reshape(img(i,j,k), 1, w*h);
    hist_img = histc(x, 0:255);
    cdf = cumsum(hist_img);
    cdf = cdf/cdf(256);
     
    x = reshape(img_ref(:,:,k), 1, wr*hr);
    hist_ref = histc(x, 0:255);
    cdf_ref = cumsum(hist_ref);
    cdf_ref = cdf_ref/cdf_ref(256);
    cdf_inv = icdf(cdf_ref, cdf(:));
    
    img_out(i,j,k) = cdf_inv(img(i,j,k)+1);
  end
  visualize(img_out);
  
end