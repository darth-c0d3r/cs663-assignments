%% Linear Contrast Stretching
% Observation : For image (5) the output that we get is not much contrasted as is required. Hence, linear contrast stretching isn't effective in this case. The reason for this is that linear contrast stretching maps the minimum value of the pixels of image to 0 and the maximum value to 255 and spreads all the internal pixels linerly between them. However for this image the minimum and maximum values of pixels (for every color) vary from 0 to 255 itself, hence negligible spreading is achieved.

%% Formula for Linear Function
% for every color $i$ with intensity $x_i$
% 
% $x_i=(x_i-min)*255/(max-min)$

%% Function
function myLinearContrastStretching(img_name)
  [img, map] = imread(img_name);
  [~,~,d] = size(img);
  img_out = img;
  
%% Iterating over all channels
  for k=1:d
      max_n = max(max(img(:,:,k)));
      min_n = min(min(img(:,:,k)));
      if max_n ~= min_n
          img_out(:,:,k) = (img(:,:,k)-min_n)*(255/(max_n-min_n));
      end
  end
  
  iptsetpref('ImshowAxesVisible','on');
  figure('units','normalized','outerposition',[0 0 1 1]);
  subplot(1,2,1);
  imshow(img, map), colorbar;
  title('Original Image');
  subplot(1,2,2);
  imshow(img_out, map), colorbar;
  title('Contrast Stretched Image');

  
end
