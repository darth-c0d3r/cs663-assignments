function myShrinkImageByFactorD(d)
  img_name = '../data/circles_concentric.png';
  img = imread(img_name);
  [w,h] = size(img);
  img_out = img(d:d:w, d:d:h);
  visualize(img_out);
  % Remember to save images later on for d=2,3.
end