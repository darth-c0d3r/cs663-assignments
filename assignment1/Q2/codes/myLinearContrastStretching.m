function myLinearContrastStretching(img_name)
% apply linear contrast stretching on an image
  img = imread(img_name);
  [w,h,d] = size(img);
  img_out = img;
  
  % iterate over all channels
  for k=1:d
      max_n = max(max(img(:,:,k)));
      min_n = min(min(img(:,:,k)));
      disp(max_n);
      disp(min_n);
      if max_n ~= min_n
          img_out(:,:,k) = (img(:,:,k)-min_n)*(255/(max_n-min_n));
      end
  end
  visualize(img_out);
end
