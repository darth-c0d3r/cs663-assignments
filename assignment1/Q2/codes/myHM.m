function myHM()
% apply histogram matching on img with respect to img_ref 
  img = imread('../data/retina.png');
  img_ref = imread('../data/retinaRef.png');
  mask = imread('../data/retinaMask.png');
  refmask = imread('../data/retinaRefMask.png');
  
  [w,h,d] = size(img);
  [wr, hr, ~] = size(img_ref);
  
  img_out = img;
  i=1:w;
  j=1:h;
  
  % iterate over all channels  
  for k=1:d
      
    x = img_ref(:,:,k);
    x(refmask == 0) = -1; % set background pixels=-1
    x = reshape(img(:,:,k), 1, w*h);
    hist_img = histc(x, -1:255);
    hist_img = hist_img(2:257); % choose histogram for foreground only

    cdf = cumsum(hist_img);
    cdf = cdf/cdf(256);
    
    x = img_ref(:,:,k);
    x(mask == 0) = -1;
    x = reshape(img_ref(:,:,k), 1, wr*hr);
    hist_ref = histc(x, -1:255);
    hist_ref = hist_ref(2:257);
    cdf_ref = cumsum(hist_ref);
    cdf_ref = cdf_ref/cdf_ref(256);
    
    cdf_inv = zeros(1,256);
    for l=1:256
        % get cdf_inverse for discrete variable
        [~,cdf_inv(1,l)]=min(abs(cdf_ref-cdf(1,l)));
    end
    
    img_out(i,j,k) = cdf_inv(img(i,j,k)+1);
  end
  visualize(img_out);
  visualize(img);
  
end