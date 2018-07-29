function myHM(img_name, img_ref_name)
  img = imread(img_name);
  img_ref = imread(img_ref_name);
  
  [w,h,d] = size(img);
  [wr, hr, dr] = size(img_ref);
  
  img_out = img;
  i=1:w;
  j=1:h;
  
  for k=1:d
    hist_img = zeros(1,256);
    x = reshape(img(i,j,k), 1, w*h);
    [a,b] = hist(x, unique(x)); 
    hist_img(b+1) = a;
    cdf = cumsum(hist_img);
    cdf = cdf/cdf(256);
     
    hist_ref = zeros(1,256);
    x = reshape(img_ref(:,:,k), 1, wr*hr);
    [a,b] = hist(x, unique(x)); 
    hist_ref(b+1) = a;
    cdf_ref = cumsum(hist_ref);
    cdf_ref = cdf_ref/cdf_ref(256);
    cdf_inv = icdf(cdf_ref, cdf(:));
    
    img_out(i,j,k) = cdf_inv(img(i,j,k)+1);
  end
  visualize(img_out);
  
end