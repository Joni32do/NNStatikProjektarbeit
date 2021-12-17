clear;
clc;
load("R_005_930_complete");
%addpath 'C:\Users\Jonathan\Documents\GitHub\NNStatikProjektarbeit\Projektarbeit\Matlab\Preprocessing'
addpath '\\stud.uni-stuttgart.de\users\st\st166934\Eigene Dateien\GitHub\NNStatikProjektarbeit\Projektarbeit\Matlab\Preprocessing'
%Evaluate Minimum on finer Grid
%Dimensions of the House



%% Can be altered
%Step Size
doorStep = 0.5;
windowStep = 0.15;

sampleSize = 1e4;
%For a random sample size of 1e8
% Elapsed time is 3165.951856 seconds.
% 
% minimum =
% 
%     0.5000    0.5000    0.0000    0.5000    0.0000    0.0000    0.0000         0         0         0
% 
% 
% index =
% 
%     13182729    24302514    57975618     9142075    67148344    48020680    44399288           1           1           1




evalFunc = @(x) simpleNN(x);
tic
solu = randomGeometryFunc(sampleSize,evalFunc,p);
toc
%solu = orderedGeometryFunc(doorStep,windowStep,evalFunc,p);
%solu = [Config U S];

[minimum index] = min(abs(solu));
MinimalData = zeros(5,10);
title = "minimale " + ["X Verschiebung" "Y Verschiebung" "X Spannung" "Y Spannung" "XY Spannung"];
for k = 1:5
    MinimalData(k,:) = solu(index(k+5),:);
    plotData(MinimalData(k,:),title(k));
end
