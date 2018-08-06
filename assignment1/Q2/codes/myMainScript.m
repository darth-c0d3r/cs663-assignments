%% MyMainScript

tic;
% myLinearContrastStretching('../data/barbara.png');
% myLinearContrastStretching('../data/TEM.png');
% myLinearContrastStretching('../data/canyon.png');
% myLinearContrastStretching('../data/church.png');
% myHE('../data/barbara.png');
% myHE('../data/TEM.png');
% myHE('../data/canyon.png');
% myHE('../data/church.png');
% myHM();
% myAHE('../data/barbara.png', 10);
% myAHE('../data/barbara.png', 100);
% myAHE('../data/barbara.png', 200);
% myAHE('../data/barbara.png', 300); % optimal
myAHE('../data/barbara.png', 600);
% myAHE('../data/TEM.png', 10);
% myAHE('../data/TEM.png', 50);
% myAHE('../data/TEM.png', 200); % optimal 
% myAHE('../data/TEM.png', 300);
% myAHE('../data/TEM.png', 500);
% myAHE('../data/canyon.png', 10);
% myAHE('../data/canyon.png', 100);
% myAHE('../data/canyon.png', 200);
% myAHE('../data/canyon.png', 400); % optimal
% myAHE('../data/canyon.png', 600);
% myCLAHE('../data/barbara.png', 25, 0.02);
% myCLAHE('../data/barbara.png', 300, 0.1); % optimal 
% myCLAHE('../data/barbara.png', 500, 0.1);
% myCLAHE('../data/barbara.png', 300, 0.05);
% myCLAHE('../data/barbara.png', 500, 0.05);
myCLAHE('../data/TEM.png', 10);
myCLAHE('../data/TEM.png', 50);
myCLAHE('../data/TEM.png', 150);
myCLAHE('../data/TEM.png', 300);
myCLAHE('../data/TEM.png', 500);
% myCLAHE('../data/canyon.png', 10);
% myCLAHE('../data/canyon.png', 100);
% myCLAHE('../data/canyon.png', 200);
% myCLAHE('../data/canyon.png', 400);
% myCLAHE('../data/canyon.png', 600);

toc;
