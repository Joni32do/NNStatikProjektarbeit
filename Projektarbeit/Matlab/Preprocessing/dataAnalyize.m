% load("1911SimulationMesh_0-05.mat");
% Sim005 = X;
% Sim005Y = Y;
% 
% load("1911SimulationMesh_0-1.mat");
% Sim01 = X;
% Sim01Y = Y;
% 
% load("1911SimulationMesh_0-1Force250000+00.mat");
% Sim01F = X;
% Sim01FY = Y;
% 
% 
% format shorte
% k = 15;
% 
% 
% 
% %Data befor 15 is rubbish -> why
% for k = 14:28
%     comp = [Sim005Y(k,:); Sim01Y(k,:); Sim01FY(k,:)]
%     plotData(Sim01(k,:),"First 15");
% end
X = mmread('mytemp.mtx');
X = X(1:numel(find(X(:,1))),:);
% X(:,2:5) = X(:,2:5) + 0.25;
% for i = 1:5
%     subplot(2,3,i)
%     histogram(X(:,i))
    
% end


% for k = 1:50
%     plotData(X(k,:),"Hallo");
% end
