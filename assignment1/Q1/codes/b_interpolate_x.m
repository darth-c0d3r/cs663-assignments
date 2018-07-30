function img = b_interpolate_x(image, factor, yjump)
  [M,N] = size(image);
  img = image;
  i_rng = 1:yjump:M;
  for right=factor+1:factor:N
    left=right-factor;
    img(i_rng,left:right) = linspace(image(i_rng,left), image(i_rng,right), factor+1);
  end
end
