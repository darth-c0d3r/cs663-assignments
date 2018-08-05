function visualize(img)
% a utility function to display final formatted image as per instructions
% used in all questions
  myNumOfColors = 200;
  myColorScale = [[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]'];
  figure, imagesc(img); % display image in new window without overriding the previouly opened image
  colormap(myColorScale);
  if length(size(img))==3 % for 3 channeled (i.e. colored) image
    colormap jet;
  else % for single channeled (i.e. grayscale) image
    colormap gray;
  end
  % balance the aspect ratio
  daspect([1 1 1]);
  axis tight;
  % for adding colorbar
  caxis([0 myNumOfColors]);
  colorbar;
end