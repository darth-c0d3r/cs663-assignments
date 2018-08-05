function myShrinkImageByFactorD(d)
% shrnk a given image by factor of d, evenly in both dimensions
  img_name = '../data/circles_concentric.png';
  img = imread(img_name);
  [w,h] = size(img);
  img_out = img(d:d:w, d:d:h);
  visualize(img_out);
end