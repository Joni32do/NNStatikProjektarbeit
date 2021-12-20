function [Y,Xf,Af] = trainbr4__2__118-Dec-2021(X,~,~)
%TRAINBR4__2__118-DEC-2021 neural network simulation function.
%
% Auto-generated by MATLAB, 18-Dec-2021 18:24:11.
% 
% [Y] = trainbr4__2__118-Dec-2021(X,~,~) takes these arguments:
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
b1 = [0.11356169372392366235;0.054831185436085526363;0.24972037065363247854;0.046215387657382180076];
IW1_1 = [0.25291301036665020385 0.4654968268594577574 -0.40205909798556327406 -1.259267311915666987 0.54689686380499791252;-0.53751117920275670592 0.34076751136074340254 0.077033186936388747812 -0.046043255228870483275 -0.25187568652997199825;0.088565330688435944806 0.37347931107407916773 -1.1730306504454133254 -0.051632153508591523139 0.42579408506461635664;0.87599192331709285764 -0.60430263859871868881 -0.10047007090969109488 -0.72388068841554631394 0.45753652842258285549];

% Layer 2
b2 = [-0.25526416934760698396;-0.071966978727541056071];
LW2_1 = [0.50975752718871059077 1.3630764335359732975 1.22204227326097703 -0.12126573804756117514;1.2830044092626793351 -0.59653238008293618666 0.23718065517247596818 -1.4065429696092026646];

% Layer 3
b3 = 0.29030430723411709826;
LW3_2 = [-1.1986664624344529617 1.577667051463576442];

% Layer 4
b4 = [0.041785740022569989316;-0.40400819944020804897];
LW4_3 = [0.10365809743841783441;2.0658444443017272008];

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
    a2 = tansig_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Layer 3
    a3 = tansig_apply(repmat(b3,1,Q) + LW3_2*a2);
    
    % Layer 4
    a4 = repmat(b4,1,Q) + LW4_3*a3;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a4,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(4,0);

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