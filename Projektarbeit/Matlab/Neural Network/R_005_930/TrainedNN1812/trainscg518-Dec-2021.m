function [Y,Xf,Af] = trainscg518-Dec-2021(X,~,~)
%TRAINSCG518-DEC-2021 neural network simulation function.
%
% Auto-generated by MATLAB, 18-Dec-2021 18:24:08.
% 
% [Y] = trainscg518-Dec-2021(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 5xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 2xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.50826608;0.75224505;0.25240559;0.7524299;0.250911845];
x1_step1.gain = [0.33388061039706;0.400593992760585;0.364089031557419;0.400510983928626;0.363726553603256];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.1608246690094892184;1.6610290139738181914;-0.38718345068658194252;0.054739581139237242224;-0.65252426873236091254];
IW1_1 = [0.68055492894245717128 -0.20917577803059989039 -0.64974514914036318736 0.67825176437091738713 1.314474531432782145;-2.2727773499207755137 0.92971758347871646944 -0.64296698532676377358 0.09190187350228973262 -1.391204907704163718;-0.10961388456421874982 1.2533750115664690217 2.800850769314509936 -0.91641052485608409661 0.85752355218138509585;-0.41265046067046684541 0.26800284213611896833 -0.25181314133069182537 -2.2586727396942443136 0.29313998191597534504;0.74466826629802129744 1.7890556201842793271 -0.3641706969420155926 -0.44259650646520315442 -0.36614238441710578176];

% Layer 2
b2 = [0.36471603712351485793;0.33052741767370896753];
LW2_1 = [-0.13652157281789298326 -0.49005060328734850739 -0.055121385245973437972 -0.35319641194398837536 0.41605655971080052202;0.45526133993215062157 -0.072125823738247038519 0.50697929493865989681 0.12784209759276504714 -0.17340630523775288352];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.585808911511449;0.568900823163935];
y1_step1.xoffset = [-1.78720142;-6.54522631];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end