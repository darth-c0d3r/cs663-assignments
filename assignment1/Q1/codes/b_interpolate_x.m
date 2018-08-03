function img = b_interpolate_x(image, factor, yjump)
  [M,N] = size(image);
  img = image;
  i_rng = 1:yjump:M;
  for right=(factor+1):factor:N
  	for i=i_rng
	    left=right-factor;
	    img(i,left:right) = linspace(image(i,left), image(i,right), factor+1);
    end
  end
end
