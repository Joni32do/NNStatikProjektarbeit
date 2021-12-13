function solu = orderedGeometryFunc(doorStep, windowStep,evalFunc,p)
%UNTITLED2 Summary of this function goes here
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


%Steps always begin with 0:step
maxDStep = floor((rw - doorW)/doorStep);
maxWindowStepWidth = floor((rw - ww)/windowStep);
maxWindowStepHeight = floor((rh - doorH - wh)/windowStep);
maxWStep = (maxWindowStepWidth+1) * (maxWindowStepHeight+1) - 1; %+ maxWindowStepWidth//2

nextPosW = ceil(ww/windowStep);
nextPosH = ceil(wh/windowStep);



data = 0;
maxN = (maxDStep + 1).*(maxWStep + 1).^2;
solu = zeros(maxN,10);



%Find all possible configurations
for d = 0:1:maxDStep
    doorX = margin + d * doorStep;
    for w1 = 0:1:maxWStep
        colW1 = mod(w1,maxWindowStepWidth+1);
        rowW1 = floor(w1/(maxWindowStepWidth+1)); 
        windX = colW1*windowStep + margin + windMargin;
        windY = rh -wh-rowW1*windowStep + windMargin;
        

        for w2 = w1+nextPosW:1:maxWStep
            %Misses some data points at the turnover point
            
            colW2 = mod(w2,maxWindowStepWidth+1);
            rowW2 = floor(w2/(maxWindowStepWidth+1));
           
            if rowW1 == rowW2 || rowW2 - rowW1 >= nextPosH %Else a window *COULD* overlap
            
                windX2 = colW2*windowStep + margin + windMargin;
                windY2 = rh -wh -rowW2*windowStep + windMargin;


                %Stop if window would be inside critical point
                door = [doorX, 0, doorW, doorH];
                window1 = [windX,windY,windW,windH];
                window2 = [windX2,windY2,windW,windH];
                critPoint = [xC, yC];

                if ~critIsInWindow(window1,critPoint) && ...
                        ~critIsInWindow(window2,critPoint) && ...
                        ~doorIsInWindow(window1,door) && ...
                        ~doorIsInWindow(window2,door)

                    data = data + 1;
                    datapoint = [doorX windX windY windX2 windY2];
                    solu(data,:) = [datapoint evalFunc(datapoint) zeros(1,3)];
                end
            end     
        end
    end
end
solu = solu(1:numel(find(solu(:,1))),:);
end

