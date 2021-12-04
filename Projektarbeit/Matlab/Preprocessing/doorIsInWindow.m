function bool = doorIsInWindow(window,door)
%Function checks if the position of a window and a door collide
x = window(1);
y = window(2);
w = window(3);
h = window(4);
dl = door(1);
dr = door(1) + door(3);
dh = door(4);
%Either all corners of the window are on the right side or on the left side
%of the door
if y > dh
    bool = false;
else
    if ((x < dl) && ((x+w) < dl))
        bool = false;
    elseif ((x > dr) && ((x+w) > dr))
        bool = false;
    else 
        bool = true;
    end
end

end