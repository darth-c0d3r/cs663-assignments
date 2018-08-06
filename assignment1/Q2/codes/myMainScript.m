%% MyMainScript

tic;
myLinearContrastStretching('../data/barbara.png');
myLinearContrastStretching('../data/TEM.png');
myLinearContrastStretching('../data/canyon.png');
myLinearContrastStretching('../data/church.png');
myHE('../data/barbara.png');
myHE('../data/TEM.png');
myHE('../data/canyon.png');
myHE('../data/church.png');
myHM();
myAHE('../data/barbara.png', 20);
myAHE('../data/barbara.png', 300); % optimal
myAHE('../data/barbara.png', 600);
myAHE('../data/TEM.png', 30);
myAHE('../data/TEM.png', 300); % optimal 
myAHE('../data/TEM.png', 700);
myAHE('../data/canyon.png', 20);
myAHE('../data/canyon.png', 400); % optimal
myAHE('../data/canyon.png', 600);
m
myCLAHE('../data/barbara.png', 300, 0.06); % optimal 
myCLAHE('../data/barbara.png', 600, 0.06);
myCLAHE('../data/barbara.png', 300, 0.03);
myCLAHE('../data/barbara.png', 600, 0.03);
myCLAHE('../data/TEM.png', 30, 0.05);
myCLAHE('../data/TEM.png', 300, 0.1); % optimal
myCLAHE('../data/TEM.png', 700, 0.1);
myCLAHE('../data/TEM.png', 300, 0.05);
myCLAHE('../data/TEM.png', 700, 0.05);
myCLAHE('../data/canyon.png', 20, 0.1);
myCLAHE('../data/canyon.png', 400, 0.08); % optimal
myCLAHE('../data/canyon.png', 600, 0.08);
myCLAHE('../data/canyon.png', 400, 0.04);
myCLAHE('../data/canyon.png', 600, 0.04);

toc;
