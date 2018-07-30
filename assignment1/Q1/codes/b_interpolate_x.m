function img = b_interpolate_x(image, factor, yjump)
  [M,N] = size(image);
  img = image;
  i_rng = 1:yjump:M;
  for right=(factor+1):factor:N
    left=right-factor;
    m = (image(i_rng,right) - image(i_rng,left))/(factor);
%     img(i_rng,left:right) = linspace(image(i_rng,left), image(i_rng,right), factor+1);
%     disp(image(i_rng,left):m:image(i_rng,right));
%     disp(img(i_rng,left:right));
    img(i_rng,left:right) = image(i_rng,left):m:image(i_rng,right);
  end
end
