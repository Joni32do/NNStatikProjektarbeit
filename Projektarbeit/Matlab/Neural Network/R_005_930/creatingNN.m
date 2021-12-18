%Script to test different approaches to create a NN

nameNN = "lm_55_1812";


hiddenLayerSizeCell = {[5], [5 5], [4 2 2]}; %A third layer is shit
for hiddLay = 1:numel(hiddenLayerSizeCell)
hiddenLayerSize = hiddenLayerSizeCell{hiddLay};

for trainFcn = ["trainlm"]; %["trainlm","trainbr", "trainscg"]
 
    
nameNN = trainFcn + num2str(hiddenLayerSize) + "_" + (date + "");
nameNN = strrep(nameNN," ","_");


load("R_005_930_complete.mat");
x = Config';
t = U';

% Choose a Training Function
% trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

% Create a Fitting Network
% hiddenLayerSize = [5 5]; %[10]
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
performance = perform(net,t,y)

% Recalculate Training, Validation and Test Performance
trainTargets = t .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,y)
valPerformance = perform(net,valTargets,y)
testPerformance = perform(net,testTargets,y)





% View the Network
% view(net)





% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)







% Generate MATLAB function for neural network for application
% deployment in MATLAB scripts or with MATLAB Compiler and Builder
% tools, or simply to examine the calculations your trained neural
% network performs.
genFunction(net,nameNN);
%     y = myNeuralNetworkFunction(x);


end
end




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
