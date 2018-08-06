%% Histogram Equalization
% For image (5) histogram equaliztion is much better than linear contrasting. This is because for the image there is a large frequency of pixels with both high intensity and low intensity. So on application of histogram equaliztion this constricted data spread is distributed over all the histograms by equalizing it with  uniform cdf. Thus giving a better output having color intensities ranging over the  middle values as well.

%% Function
function myHE(img_name)
% apply histogram equalization on a given image
  [img, map] = imread(img_name);
  [w,h,d] = size(img);
  img_out = img;
  i=1:w;
  j=1:h;
  
  %% Iterating over all channels  
  for k=1:d
    x = reshape(img(i,j,k), 1, w*h);
    hist_ = histc(x, 0:255); % histogram of given image
    cdf = cumsum(hist_); % cdf of given image
    cdf = (cdf/cdf(256))*255;
    img_out(i,j,k) = cdf(img(i,j,k)+1);
  end
  
  iptsetpref('ImshowAxesVisible','on');
  figure('units','normalized','outerposition',[0 0 1 1])
  subplot(1,2,1);
  imshow(img, map), colorbar;
  title('Original Image')
  subplot(1,2,2);
  imshow(img_out, map), colorbar;
  title('Historgram Equalized Image')
  
end