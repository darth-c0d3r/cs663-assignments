function myHE(img_name)
  img = imread(img_name);
  [w,h,d] = size(img);
  img_out = img;
  
  for k=1:d
    hist = zeros(1,256);
    for i=1:w
      for j=1:h
        hist(1,img(i,j,k)+1) += 1;
      end
    end
    cdf = zeros(1,256);
    sum = 0;
    for bin=1:256
      sum += hist(bin);
      cdf(bin)=sum;
    end
    cdf = (cdf/sum)*255;
    
    for i=1:w
      for j=1:h
        img_out(i,j,k) = cdf(img(i,j,k)+1);
      end
    end
    
  end  
  visualize(img_out);
  
endfunction