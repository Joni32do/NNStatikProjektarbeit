function bool = windowInwindow(window1, window2)
%Checks if two windows are intersecting
x1 = window1(1);
y1 = window1(2);
w1 = window1(3);
h1 = window1(4);

x2 = window2(1);
y2 = window2(2);
w2 = window2(3);
h2 = window2(4);
if h1 ~= h2 || w1 ~= w2 
    warning("In this check both windows should have the same dimension");
end
%Check if any corner of one window is in the other window - this is enogh
%because both windows have same dimension
if (x1 < x2 && x2 < x1 + w1)

end