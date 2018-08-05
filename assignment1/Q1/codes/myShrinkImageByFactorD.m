function myShrinkImageByFactorD()
% shrink a given image by factor of d, evenly in both dimensions
  d1 = 2;
  d2 = 3;
  img_name = '../data/circles_concentric.png';
  [img, map] = imread(img_name);
  [w,h] = size(img);
  img_out_1 = img(d1:d1:w, d1:d1:h);
  img_out_2 = img(d2:d2:w, d2:d2:h);
  
  iptsetpref('ImshowAxesVisible','on');
  figure('units','normalized','outerposition',[0 0 1 1])
  subplot(1,3,1);
  imshow(img, map), colorbar;
  title('Original Image')
  subplot(1,3,2);
  imshow(img_out_1, map), colorbar;
  title('Shrinked Image (factor=2)')
  subplot(1,3,3);
  imshow(img_out_2, map), colorbar;
  title('Shrinked Image (factor=3)')
end