function [Y,Xf,Af] = trainlm4__2__118-Dec-2021(X,~,~)
%TRAINLM4__2__118-DEC-2021 neural network simulation function.
%
% Auto-generated by MATLAB, 18-Dec-2021 18:24:11.
% 
% [Y] = trainlm4__2__118-Dec-2021(X,~,~) takes these arguments:
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
b1 = [-3.1805675370793342616;0.94164927683549148885;-1.1695071264451524229;1.7884550370890521798];
IW1_1 = [0.48851447038063583461 -2.3463612684469685732 0.084650502995853790789 1.4239041272994832354 -1.4660033920468631408;-0.12394179978379744889 -0.9171878784884522906 0.13067856679454892266 0.036921416318568191228 0.18693119930395332706;-2.5701363654603550657 -1.4028765644396004042 -2.6670534137900001603 1.2341100816425412123 0.3804417615898575411;1.3697655157267658588 -0.66169591875772670875 1.7240140695266552573 -0.055732747066090340682 -0.64388902195706709808];

% Layer 2
b2 = [-4.4649229374113703628;2.8049675442243078294];
LW2_1 = [-3.7168695858360725204 1.6054095502815934893 -2.5359820195582680746 -2.6195756107984125016;1.8292741738287037201 -1.0005969004279204881 1.3796640539923685775 1.4541440117579371716];

% Layer 3
b3 = 1.4864819416216901171;
LW3_2 = [-1.5155866866809386551 -2.2938953066461627017];

% Layer 4
b4 = [0.1044495340713764292;1.5444511974025616485];
LW4_3 = [-0.056262825355183454512;-3.1522517164162389136];

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
