% A function to display final formatted image as per instructions.
function visualize(img)
  myNumOfColors = 200;
  myColorScale = [[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]'];
  figure, imagesc(img);
  colormap(myColorScale);
  if length(size(img))==3
    colormap jet;
  else
    colormap gray;
  end
  daspect([1 1 1]);
  axis tight;
  colorbar;
endfunction  