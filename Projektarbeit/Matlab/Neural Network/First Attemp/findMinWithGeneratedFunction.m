%Evaluate Minimum on finer Grid

%Dimensions of the House


xStart = 0   %Ignored Base is ALWAYS (0|0) for Symmetry Reasons
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
windW = 1.25;
windH = 1.25;
windMargin = 0.125;

	%Helping Variables
	ww = windW + 2 * windMargin %window Width and margin
	wh = windH + 2 * windMargin
	%For House
	rw = width - 2 * margin %real width
	rh = height - margin %real height
    
%Step Size
doorStep = 1
windowStep = 0.5


data = 0;
solu = zeros(199,10);

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
            if isInRectangle(windX,windY,windW,windH,xC,yC) || ...
                    isInRectangle(windX2,windY2,windW,windH,xC,yC)
               
            else
                data = data + 1;
                
                datapoint = [doorX windX windY windX2 windY2];
                solu(data,:) = [datapoint simData005_1911(datapoint)];
            end
            end
            
            
            
        end
    end
end

[minimum index] = min(solu)
% minimum =
% 
%    5.0000e-01   6.2500e-01   2.1250e+00   6.2500e-01   2.1250e+00  -7.2820e-03  -8.6915e-02  -9.7568e+04  -8.2171e+05  -9.8965e+04
% 
% 
% index =
% 
%            1           1        3165          10          66        3182        3208         714        2760         532
MinimalData = zeros(5,10);
title = "minimale " + ["X Verschiebung" "Y Verschiebung" "X Spannung" "Y Spannung" "XY Spannung"];
for k = 1:5
    MinimalData(k,:) = solu(index(k+5),:);
    plotData(MinimalData(k,:),title(k));
end
