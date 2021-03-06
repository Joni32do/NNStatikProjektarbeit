%Script to test different approaches to create a NN


% ### I N I T ###

%Init Simulation Data
load("R_005_930_complete.mat");
x = Config';
t = U';


%Init varying net Architecture
hiddenLayerSizeCell = {[5], [5 5], [5 3 5],[10]}; %A third layer is shit

trainFcnArray = ["trainlm"]; %["trainlm","trainbr", "trainscg"]

% Init Index 
repeats = 3; %Neural Network Generation quality varies - repeat same process
numH = numel(hiddenLayerSizeCell);
numT = numel(trainFcnArray);
n = numT * numH * repeats;


%Init best NN
bestPerformance = 1; %init to worst possible NN
bestPerformName = "Shit";
performance = zeros(n,1); %Maybe make this shit a cell - would be better
% bestNet = ;
%###############



% Create a Fitting Network
% hiddenLayerSize = [5 5]
for hiddLay = 1:numH
hiddenLayerSize = hiddenLayerSizeCell{hiddLay};


% Choose a Training Function
% trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
for trK = 1:numT
 trainFcn = trainFcnArray(trK);

 
for rep = 1:repeats

iter = rep + (trK-1)*repeats + (hiddLay - 1)*numT*repeats
nameNN = trainFcn + num2str(hiddenLayerSize) + "_" + (date + "") + ...
    "_" + num2str(rep);
nameNN = strrep(nameNN," ","_");





net = fitnet(hiddenLayerSize,trainFcn);

% Choose Input and Output Pre/Post-Processing Functions
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};

% Setup Division of Data for Training, Validation, Testing
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Choose a Performance Function
net.performFcn = 'mse';  % Mean Squared Error

% Choose Plot Functions
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};




% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance(iter) = perform(net,t,y);




if bestPerformance >= performance(iter)
    bestPerformance = performance(iter);
    bestNet = net;
    bestPerformName = nameNN;
end


% View the Network
% view(net)













genFunction(net,nameNN);

end
end
end

view(bestNet)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)

% Recalculate Training, Validation and Test Performance
trainTargets = t .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,y)
valPerformance = perform(net,valTargets,y)
testPerformance = perform(net,testTargets,y)





%More Information

% plot functions       : help nnplot
% training functions   : help nntrain
% processing functions : help nnprocess
% division functions   : help nndivision
% performance functions: help nnperformance




%Training Function
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.





if (false)
    % Generate a matrix-only MATLAB function for neural network code
    % generation with MATLAB Coder tools.
    genFunction(net,'myNeuralNetworkFunction','MatrixOnly','yes');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    % Simulink Coder tools.
    gensim(net);
end
