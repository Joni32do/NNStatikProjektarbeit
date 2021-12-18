%Create Histogram of Config

%Get Config - here by loading it from a Ansys Simulation R(andom)
clear;
clc;
load("R_005_930_complete.mat");

windMargin = p.wM;
Config(:,2:5) = Config(:,2:5) + windMargin;
% for i = 1:5
%     subplot(2,3,i)
%     histogram(Config(:,i))
% end
Config = [[0 0 0 0 0]; Config];

%Some kind of sorting ...
%Take first element random ... search for next one which changes the least
n = size(Config,1);
for k = 1:size(Config,1)
    x = zeros(n,1);
    for k2 = k + 1:size(Config,1)
       x(k2) = squareErrorGeo(Config(k2,:),Config(k,:));
    end
    [B, I] = sort(x);
    Config = Config(I,:);
end

for k = 1:100
    plotData([Config(n + 1 - k,:) zeros(1,5)], "Sorted",p);
end



% 
% 
% 
% 
% Config = [3,3,3,3,3;
%           8,8,8,8,8;
%           0,0,0,0,0; 
%           3,3,3,3,3; 
%           7,7,7,7,7;
%           2,2,2,2,2;
%           1,1,1,1,1;
%           4,4,4,4,4;
%           5,5,5,5,5;
%           6,6,6,6,6];