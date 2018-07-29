function myAHE(img_name, n)
  img = imread(img_name);
  [w,h,d] = size(img);

  img_out = img;
  sz = ceil((n-1)/2);
  rng_j = 1:(h-n);
  for k=1:d
    flag = 0;
    histgm = myAHE_helper(img(1:n,1:n,k));
    for i=1:(w+1-n)
      rng_i = i:(i+n-1);
      cdf = cumsum(histgm);
      cdf = (cdf/cdf(256))*255;
      img_out(i+sz,rng_j(1)+sz,k) = cdf(img(i+sz,rng_j(1)+sz,k)+1);
      for j=rng_j
        if flag == 0
          histgm = histgm - myAHE_helper(img(rng_i,j,k));
          histgm = histgm + myAHE_helper(img(rng_i,j+n,k));
        else
          histgm = histgm + myAHE_helper(img(rng_i,j,k));
          histgm = histgm - myAHE_helper(img(rng_i,j+n,k));
        end
        cdf = cumsum(histgm);
        cdf = (cdf/cdf(256))*255;
        img_out(i+sz,j+1+sz,k) = cdf(img(i+sz,j+1+sz,k)+1);
      end
      rng_j = fliplr(rng_j);
      flag = 1-flag;
    end
  end
  visualize(img_out);
  
end