function bool = isInRectangle(x,y,w,h,xC,yC)
%Function to determine if a critical point is within a rectangle with given
%dimensions. Only works for scalar values
if (x < xC && xC < x + w) && (y < yC && yC < y + h)
    bool = true;
else
    bool = false;
end


end