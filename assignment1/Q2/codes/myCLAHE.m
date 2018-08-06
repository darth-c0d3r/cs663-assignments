function myCLAHE(img_name, n, free_p)
  [img, map] = imread(img_name);
  [w,h,d] = size(img);
  img_out = img;
  tic
  sz = ceil((n-1)/2);
  lextra = 1:n-sz;
  rextra = (h-sz):h;
  for k=1:d
      rng_y = 1:h;
      flag = 0;
      hist_gm = myAHE_helper(img(1:n-sz,1:n-sz,k));
      for i=1:w
          rng_x = max(1,i-sz):min(w,i+n-1-sz);
          cdf = cumsum(hist_gm);
          threshold = free_p*cdf(256);
          hist_mod = hist_gm;
          hist_mod(hist_gm > threshold) = threshold;
          diff = sum(hist_gm-hist_mod);
          hist_mod = hist_mod + diff/256;
          cdf = cumsum(hist_mod);
          cdf = (cdf/cdf(256))*255;
          img_out(i,rng_y(1),k) = cdf(img(i,rng_y(1),k)+1);
          for j=rng_y(2:h)
              if flag == 0
                  if j-sz > 1
                      hist_gm = hist_gm - myAHE_helper(img(rng_x,j-sz-1,k));
                  end
                  if j+n-1-sz <= h
                      hist_gm = hist_gm + myAHE_helper(img(rng_x,j+n-1-sz,k));
                  end
              else
                  if j-sz >= 1
                      hist_gm = hist_gm + myAHE_helper(img(rng_x,j-sz,k));
                  end
                  if j+n-sz <= h
                      hist_gm = hist_gm - myAHE_helper(img(rng_x,j+n-sz,k));
                  end
              end    
              cdf = cumsum(hist_gm);
              threshold = free_p*cdf(256);
              hist_mod = hist_gm;
              hist_mod(hist_gm > threshold) = threshold;
              diff = sum(hist_gm-hist_mod);
              hist_mod = hist_mod + diff/256;
              cdf = cumsum(hist_mod);
              cdf = (cdf/cdf(256))*255;
              img_out(i,j,k) = cdf(img(i,j,k)+1); 
          end
          
          if flag == 0
              extra = rextra;
          else
              extra = lextra;
          end
          
          if i-sz > 1
              hist_gm = hist_gm - myAHE_helper(img(i-sz-1,extra,k));
          end
          if i+n-1-sz <= w
              hist_gm = hist_gm + myAHE_helper(img(i+n-1-sz,extra,k));
          end
          
          rng_y = fliplr(rng_y);
          flag = 1-flag;
      end    
  end
  
  iptsetpref('ImshowAxesVisible','on');
  figure('units','normalized','outerposition',[0 0 1 1]);
  subplot(1,2,1);
  imshow(img, map), colorbar;
  title('Original Image');
  subplot(1,2,2);
  imshow(img_out, map), colorbar;
  title(['CLAHE Image ' num2str(n) ' , ' num2str(free_p)]);
end