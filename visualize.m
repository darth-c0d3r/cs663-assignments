% A function to display final formatted image as per instructions.
function visualize(img, bnw=1)
  myNumOfColors = 200;
  myColorScale = [[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]',[0:1/(myNumOfColors-1):1]'];
  imagesc(img);
  colormap(myColorScale);
  if bnw == 0
    colormap jet;
  else
    colormap gray;
  end
  daspect([1 1 1]);
  axis tight;
  colorbar;
endfunction  