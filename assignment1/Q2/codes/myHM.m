%% Histogram Matching
% Observation : The output image that we get seems to be much better than the input dull image (retina.png). The reason for this is that histogram matching involves calculating the cdf of the reference image and then matching the input image to its calculated cdf. And since the histogram of the reference image is much better distributed, when it is matched upon the input image the output that we get is much better.

%% Function
function myHM()
% apply histogram matching on img with respect to img_ref 
  [img, map1] = imread('../data/retina.png');
  [img_ref, map2] = imread('../data/retinaRef.png');
  mask = imread('../data/retinaMask.png');
  refmask = imread('../data/retinaRefMask.png');
  
  [w,h,d] = size(img);
  [wr, hr, ~] = size(img_ref);
  
  img_out_hm = img;
  img_out_he = img;
  i=1:w;
  j=1:h;
  
  %% Iterating over all channels  
  for k=1:d
      
    x = img(:,:,k);
    x(mask == 0) = -1; % set background pixels=-1
    x = reshape(x, 1, w*h);
    hist_img = histc(x, 0:255);

    cdf = cumsum(hist_img);
    cdf = cdf/cdf(256);
    img_out_hm(i,j,k) = cdf(img(i,j,k)+1);
    
    x = img_ref(:,:,k);
    x(refmask == 0) = -1;
    x = reshape(x, 1, wr*hr);
    hist_ref = histc(x, 0:255);
    cdf_ref = cumsum(hist_ref);
    cdf_ref = cdf_ref/cdf_ref(256);
    
    cdf_inv = zeros(1,256);
    for l=1:256
        % get cdf_inverse for discrete variable
        [~,cdf_inv(1,l)]=min(abs(cdf_ref-cdf(1,l)));
    end
    
    img_out_hm(i,j,k) = cdf_inv(img(i,j,k)+1);
  end
  img_out_hm(mask==0) = 0;
  img_out_he(mask==0) = 0;
  
  iptsetpref('ImshowAxesVisible','on');
  figure('units','normalized','outerposition',[0 0 1 1]);
  subplot(1,3,1);
  imshow(img, map1), colorbar;
  title('Original Image');
  subplot(1,3,2);
  imshow(img_out_hm, map2), colorbar;
  title('Histogram matched Image');
  subplot(1,3,3);
  imshow(img_out_he, map2), colorbar;
  title('Histogram equalized Image');
end