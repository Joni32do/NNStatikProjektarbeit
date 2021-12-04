function bool = critIsInWindow(window,critPoint)
%Function to determine if a critical point is within a rectangle with given
%dimensions. Only works for scalar values
x = window(1);
y = window(2);
w = window(3);
h = window(4);
xC = critPoint(1);
yC = critPoint(2);
if (x < xC && xC < x + w) && (y < yC && yC < y + h)
    bool = true;
else
    bool = false;
end


end