function x = plotData(data, plotName) 

xStart = 0;
yStart = 0;
height = 8;
width = 8;
doorX = 1;
doorY = 2;
windW = 1.25;
windH = 1.25;

door = data(1);
windX = data(2);
windY = data(3);
windX2 = data(4);
windY2 = data(5);

ux = data(6);
uy = data(7);
sx = data(8);
sy = data(9);
sxy = data(10);

figure('Name',plotName);
plotSquare(xStart, yStart, width, height,[0 0 0]);
hold on
plotSquare(door,yStart, doorX, doorY, [0.5 0.5 0.5]);
plotSquare(windX, windY, windW, windH, [0.2 1 0.2]);
plotSquare(windX2, windY2, windW, windH, [0.4 0.5 0]); 
% normalize
uN = sqrt(ux^2 + uy^2);
sN = sqrt(sx^2 + sy^2);
quiver(4,4,ux/uN,uy/uN)
quiver(4,4,sx/sN,sy/sN)
plot(4,4,'bo')
axis equal
xlim([-1 9])
ylim([-1 9])

% 
% str = "UX = " + num2str(ux) + "  UY = " + num2str(uy);
% dim = [.2 .5 .83 .83];
% annotation('textbox',dim,'String',str,'FitBoxToText','on');
end