function [Y,Xf,Af] = simData005_1911(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 03-Dec-2021 13:44:25.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = Qx5 matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = Qx5 matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.keep = [2 3 4 5];
x1_step2.xoffset = [1.125;1.125;1.125;1.125];
x1_step2.gain = [0.444444444444444;0.444444444444444;0.444444444444444;0.444444444444444];
x1_step2.ymin = -1;

% Layer 1
b1 = [5.5413510557102094722;-3.2948045065876940818;5.6961949447501085686;-0.4741255012991683615;1.0837170624634866467;0.16187396113094043582;0.75545929281073054273;-0.11899228379939477684;1.2348624733205184612;-0.57054744587316763571;-2.4739267331930552274;-0.21567787448334402312];
IW1_1 = [-5.0032194584043940822 -3.5692171385509716686 -0.3567982795924588002 -0.23049070935711352126;2.6647350474513813445 0.31507864442799998761 2.960300195949884916 -2.1887238582222861005;-4.529364933269873994 8.3858634662680078264 3.3523170307475700369 4.7007547571762593464;0.44664038350889917472 1.7648067975943459995 0.37700752494756617494 0.74897623341548702491;2.6678789603041019873 -2.5529800415542336367 0.53526999805359043449 -0.4970944781902872367;-4.549615566076754547 1.9322468430071766399 -0.9710214406656294539 1.4301535957434763358;-0.75954166954945045998 -2.9461047155805806241 -0.80569252312441141939 -1.6217995228971391342;-0.017829866750264624503 3.3878643820058798042 0.24067697534141893612 2.6919856966577957458;0.80349505135234300379 3.9746710096221580244 -2.1900748066983566353 -1.4681089392540283001;3.7268923612136632961 3.9608086671298394776 0.20955766659182001321 -1.1930758076566030379;-3.9734876871380309105 -1.5612441871482189981 -4.3009401636008357528 -4.1848645805149047305;4.0837460956876459051 4.858351236073476187 0.51384117123734707189 -1.357662191619482206];

% Layer 2
b2 = [0.37166910819634513263;0.51416786157292582171;-1.1877215167138277518;1.142026821360674127;-0.39279087024622683089];
LW2_1 = [0.42247671330426211922 -0.67087547068847686038 0.16557607927294057393 0.40217503432098083982 -0.69882298524465513712 -0.51628137570420806757 0.23045451535867261805 0.09585704812046048906 -0.24217486654736458673 0.55720239041941621583 -0.97188287970087983147 0.050530484324715956024;0.5073859174470354283 -0.74712515619089203689 -0.53731933313016444487 0.77874022075691984313 -0.44827713762015902743 0.83635927393985343148 -0.045391658881320788577 0.81280176169774176476 0.15131169302485761308 0.85991292697300381054 -0.35763560761304935554 -0.64374355580252340392;0.020080068380306473341 0.22946669404877245713 0.1694679045920997329 -0.56519412987878581145 1.126694341483296613 0.93130638838746104824 0.1989550054762416198 0.78489064540394126723 0.33560024383595060682 -0.62970811537332704866 -0.21388227214493429895 0.62973170846503967457;-0.022503725222218703972 -0.049237190139868214356 -0.28572051738192311143 1.9422151081387286631 -1.2046143491797349778 -0.7004013934073299863 0.64342105867548615716 -0.88843816161695188249 -0.32024521576563103054 0.93509688889194886308 0.20504213038041174677 -0.99051740912547581175;0.77106946738835124844 -0.39714439341905144465 0.07084239683681951838 2.1440349468772939012 -0.026764482412967756375 -0.97312127149265892356 0.9725325265629052307 -0.12287803282762024826 0.0035092842921668194849 0.029357477789675338886 0.13475097076356801207 -0.4806783801512355403];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [201.040118244158;73.7394781875969;9.78437200486461e-06;3.67401066250065e-06;1.25825471399278e-05];
y1_step1.xoffset = [-0.0073124143;-0.0587996542;-24394.5031;-753792.404;-87984.2413];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},1); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    X{1,ts} = X{1,ts}';
    temp = removeconstantrows_apply(X{1,ts},x1_step1);
    Xp1 = mapminmax_apply(temp,x1_step2);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
    Y{1,ts} = Y{1,ts}';
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

% Remove Constants Input Processing Function
function y = removeconstantrows_apply(x,settings)
y = x(settings.keep,:);
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