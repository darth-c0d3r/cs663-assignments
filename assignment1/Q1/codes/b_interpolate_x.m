function img = b_interpolate_x(image, factor, yjump)
  [M,N] = size(image);
  img = image;
  for i=1:yjump:M
    for right=factor+1:factor:N
      left=right-factor;
      m = (image(i,right)-image(i,left))/factor;
      intr = (1:(factor-1))*m + image(i,left);
      img(i,left+1:right-1) = intr;
    end
  end
endfunction
