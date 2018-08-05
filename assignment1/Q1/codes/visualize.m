function visualize(img, n, i, t)
% a utility function to display final formatted image as per instructions
%  used in all questions
   myNumOfColors = 200;
   myColorScale = [[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]'];
   colormap(myColorScale);
   if length(size(img))==3 % for 3 channeled (i.e. colored) image
     colormap jet;
   else % for single channeled (i.e. grayscale) image
     colormap gray;
   end
   

subplot(1,n,i);
image(img), colorbar;
title(t);
% file_name = strcat('../images/barbara_zoom_', num2str(D), '.png');

end