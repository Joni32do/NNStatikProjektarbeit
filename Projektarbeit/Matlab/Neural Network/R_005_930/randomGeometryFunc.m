function solu = randomGeometryFunc(size,evalFunc,p)
%Evaluates a function with the Geometry defined by parameters p by tr 
%   Detailed explanation goes here
height = p.h;
width = p.w;
margin = p.m;

%Critical Point
xC = p.xC;
yC = p.yC;


%Door
doorW = p.dW;
doorH = p.dH;

%Window
windW = p.wW;
windH = p.wH;
windMargin = p.wM;

	%Helping Variables
	ww = windW + 2 * windMargin; %window Width and margin
	wh = windH + 2 * windMargin;
	%For House
	rw = width - 2 * margin; %real width
	rh = height - margin; %real height 



genData = 0;
solu = zeros(size,10);



%Find all possible configurations


while genData < size
    doorX = margin + rand()* (rw-doorW);
    door = [doorX 0 doorW doorH];
    windX1 = margin + rand()* (rw-ww);
    windY1 = rand() * (rh-wh);
    window1 = [windX1 windY1 ww wh];
    if ~doorIsInWindow(window1, door) && ~critIsInWindow(window1, [xC yC])
        windX2 = margin + rand()* (rw-ww);
        windY2 = rand() * (rh-wh);
        window2 = [windX2 windY2 ww wh];
        
        if ~doorIsInWindow(window2, door) && ~windowInwindow(window1, window2) && ...
                ~critIsInWindow(window2, [xC yC])

            genData = genData + 1;
            datapoint = [doorX windX1 windY1 windX2 windY2];
            solu(genData,:) = [datapoint evalFunc(datapoint) zeros(1,3)];
        
        end
    end
end
solu = solu(1:numel(find(solu(:,1))),:);
end

