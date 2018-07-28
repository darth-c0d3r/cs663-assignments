function myAHE(img_name, n)
  img = imread(img_name);
  [w,h,d] = size(img);
  img_out = img;
%  i=1:w;
%  j=1:h;
  
  for k=1:d
    for i=500:700
      ymin=max(1,i-ceil((n-1)/2));
      ymax=min(i+ceil((n-1)/2), w);
      for j=500:700
        xmin=max(1,j-ceil((n-1)/2));
        xmax=min(j+ceil((n-1)/2), h);
        part = img(ymin:ymax, xmin:xmax,k);
        img_out(i,j,k) = myAHE_helper(part,i-ymin+1,j-xmin+1);
      end
    end
  end
  visualize(img_out);
  
endfunction