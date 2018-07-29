function histgm = myAHE_helper(img)
  [w,h] = size(img);
  i=1:w;
  j=1:h;
  x = reshape(img(i,j), 1, w*h);
  histgm = histc(x, 0:255);
end