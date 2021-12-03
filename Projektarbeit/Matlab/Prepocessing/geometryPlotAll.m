%Dimensions of the House


xStart = 0%Ignored Base is ALWAYS (0|0) for Symmetry Reasons
yStart = 0
height = 8
width = 8
margin = 0.5

%Critical Point
xC = 4;
yC = 4;


%Door
doorW = 1
doorH = 2

%Window
windW = 2.5;
windH = 3;
windMargin = 0.25;

	%Helping Variables
	ww = windW + 2 * windMargin %window Width and margin
	wh = windH + 2 * windMargin
	%For House
	rw = width - 2 * margin %real width
	rh = height - margin %real height
    
%Step Size
doorStep = 8
windowStep = 0.1


data = 0;
DataMatrix = zeros(2,5);

%Steps always begin with 0:step
maxDStep = floor((rw - doorW)/doorStep)
maxWindowStepWidth = floor((rw - ww)/windowStep)
maxWindowStepHeight = floor((rh - doorH - wh)/windowStep)
maxWStep = (maxWindowStepWidth+1) * (maxWindowStepHeight+1) - 1 %+ maxWindowStepWidth//2

nextPosW = ceil(ww/windowStep)
nextPosH = ceil(wh/windowStep)



%Find all possible configurations
for d = 0:1:maxDStep
    doorX = margin + d * doorStep;
    for w1 = 0:1:maxWStep
        colW1 = mod(w1,maxWindowStepWidth+1);
        rowW1 = floor(w1/(maxWindowStepWidth+1)); 
        windX = colW1*windowStep + margin + windMargin + 0.1 * rand();
        windY = rh -wh-rowW1*windowStep + windMargin + 0.1 * rand();
        

        for w2 = w1+nextPosW:1:maxWStep
            %Misses some data points at the turnover point
            
            colW2 = mod(w2,maxWindowStepWidth+1);
            rowW2 = floor(w2/(maxWindowStepWidth+1));
           
            if rowW1 == rowW2 || rowW2 - rowW1 >= nextPosH %Else a window *COULD* overlap
            
            windX2 = colW2*windowStep + margin + windMargin + 0.1 * rand();
            windY2 = rh -wh -rowW2*windowStep + windMargin + 0.1 * rand();
            
            
            %Stop if window would be inside critical point
            if isInRectangle(windX,windY,windW,windH,xC,yC) || ...
                    isInRectangle(windX2,windY2,windW,windH,xC,yC)
               
            else
                %Plotting
                figure
                plotSquare(xStart, yStart, width, height,[0 0 0]);
                hold on
                plotSquare(xStart + margin,yStart,rw,rh,'r'); %Margin
                plot(xC,yC,'go')
                plotSquare(doorX,yStart, doorW, doorH, [0.5 0.5 0.5]);
                plotSquare(windX, windY, windW, windH, [0.2 1 0.2]);
                plotSquare(windX2, windY2, windW, windH, [0.2 0.2 0.5]);  
                
                data = data + 1;
                DataMatrix(data,:) = [doorX windX windY windX2 windY2];
                
                axis([-1 9 -0.5 8.5])
            end
            end
            
            
            
        end
    end
end