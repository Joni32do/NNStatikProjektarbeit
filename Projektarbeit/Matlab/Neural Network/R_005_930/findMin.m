clear;
clc;
load("R_005_930_complete");
addpath 'C:\Users\Jonathan\Documents\GitHub\NNStatikProjektarbeit\Projektarbeit\Matlab\Preprocessing'
%Evaluate Minimum on finer Grid
%Dimensions of the House



%% Can be altered
%Step Size
doorStep = 0.5;
windowStep = 0.15;

sampleSize = 100000;



evalFunc = @(x) simpleNN(x);

solu = randomGeometryFunc(sampleSize,evalFunc,p);
%solu = orderedGeometryFunc(doorStep,windowStep,evalFunc,p);
solu = [Config U S];

[minimum index] = min(abs(solu))
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