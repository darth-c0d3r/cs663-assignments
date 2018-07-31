function myAHE(img_name, n)
  img = imread(img_name);
  [w,h,~] = size(img);
  sz = ceil((n-1)/2);

  mod_img(sz+1:w+sz,sz+1:h+sz,:) = img(:,:,:);
  mod_img(1:sz,1:sz,:) = img(1:sz,1:sz,:);
  mod_img(1:sz,h+sz+1:h+2*sz,:) = img(1:sz,h+1-sz:h,:);
  mod_img(w+sz+1:w+2*sz,1:sz,:) = img(w+1-sz:w,1:sz,:);
  mod_img(w+sz+1:w+2*sz,h+sz+1:h+2*sz,:) = img(w+1-sz:w,h+1-sz:h,:);
  mod_img(sz+1:w+sz,1:sz,:) = img(1:w,1:sz,:);
  mod_img(1:sz,sz+1:h+sz,:) = img(1:sz,1:h,:);
  mod_img(sz+1:w+sz,h+sz+1:h+2*sz,:) = img(1:w,h+1-sz:h,:);
  mod_img(w+sz+1:w+2*sz,sz+1:h+sz,:) = img(w+1-sz:w,1:h,:);
  img = mod_img;

  [w,h,d] = size(img);
  img_out = img;
  rng_j = 1:(h-n);
  for k=1:d
    flag = 0;
     hist_gm = myAHE_helper(img(1:n,1:n,k));
     for i=1:(w+1-n)
      rng_i = i:(i+n-1);
      window = img(rng_i,:,k);
      cdf = cumsum(hist_gm);
      cdf = (cdf/cdf(256))*255;
      img_out(i+sz,rng_j(1)+sz,k) = cdf(img(i+sz,rng_j(1)+sz,k)+1);
      for j=rng_j
        if flag == 0
          hist_gm = hist_gm - myAHE_helper(window(:,j,:));
          hist_gm = hist_gm + myAHE_helper(window(:,j+n,:));
        else
          hist_gm = hist_gm + myAHE_helper(window(:,j,:));
          hist_gm = hist_gm - myAHE_helper(window(:,j+n,:));
        end
        cdf = cumsum(hist_gm);
        cdf = (cdf/cdf(256))*255;
        img_out(i+sz,j+1+sz,k) = cdf(img(i+sz,j+1+sz,k)+1);
      end
      
      if flag == 0
        hist_gm = hist_gm - myAHE_helper(img(rng_i,(h+1-n):h,k));
        hist_gm = hist_gm - myAHE_helper(img((i+1:min(i+n,w)),(h+1-n):h,k));
      else
        hist_gm = hist_gm - myAHE_helper(img(rng_i,1:n,k));
        hist_gm = hist_gm - myAHE_helper(img((i+1:min(i+n,w)),1:n,k));
      end
      
      rng_j = fliplr(rng_j);
      flag = 1-flag;
    end
  end
  img_out = img_out(sz+1:w-sz,sz+1:h-sz,:);
  visualize(img_out);
end