% returns histogram for a component of the image
function histgm = myAHE_helper(img_comp)
  [w,h] = size(img_comp);
  i=1:w;
  j=1:h;
  x = reshape(img_comp(i,j), 1, w*h);
  histgm = histc(x, 0:255);
end