function img = b_interpolate_x(image, factor, yjump)
% apply row-wise bi-linear interpolation on every yjump_th row
% factor is the number of pixels to insert between two pixels
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
