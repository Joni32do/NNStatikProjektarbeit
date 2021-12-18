%Create Histogram of Config

%Get Config - here by loading it from a Ansys Simulation R(andom)
load("R_005_930_complete.mat");

windMargin = p.wM;
Config(:,2:5) = Config(:,2:5) + windMargin;
for i = 1:5
    subplot(2,3,i)
    histogram(Config(:,i))
end

Config(:,2)>0.5