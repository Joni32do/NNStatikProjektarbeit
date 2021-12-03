function plotSquare(x,y,w,h, color)

xL = [x x+w];
yL = [y y+h];
one = [1 1];

plot(xL,y*one,'Color', color); %Down Stroke
hold on
plot(xL, (y+h) * one,'Color', color); %Up Stroke
plot(x*one , yL,'Color', color); %Left Stroke
plot((x+w)*one , yL,'Color', color); %Right Stroke

end
