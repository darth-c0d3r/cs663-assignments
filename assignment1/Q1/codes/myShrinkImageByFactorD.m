function myShrinkImageByFactorD(d)
  img_name = '../data/circles_concentric.png';
  img = imread(img_name);
  [w,h] = size(img);
  img_out = zeros(w/d,h/d);
  for i = d:d:w
    for j = d:d:h
      img_out(i/d,j/d) = img(i,j);
    end
  end
  visualize(img_out);
  % Remember to save images later on for d=2,3.
endfunction