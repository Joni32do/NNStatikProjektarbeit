%Create Histogram of Config

%Get Config - here by loading it from a Ansys Simulation R(andom)
load("R_005_930_complete.mat");

windMargin = 0.25;
X(:,2:5) = X(:,2:5) + windMargin;
for i = 1:5
    subplot(2,3,i)
    histogram(X(:,i))
    
end