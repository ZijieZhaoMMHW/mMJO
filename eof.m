function [EOFs,PCs,Ds]=eof(data)
F = detrend(data',0);
% calculating cov matrix
C = F' * F;
% performing EOF analysis
[EOFs,D] = eig(C);
PCs = EOFs' * F';
% getting explained variance
D = diag(D);
D = D ./ nansum(D);
% sorting the order
[Ds,idx_here] = sort(D,'descend');
EOFs = EOFs(:,idx_here);
PCs = PCs(idx_here,:);
% normalization
EOFs = EOFs .* (nanstd(PCs,0,2))';
PCs = PCs ./ nanstd(PCs,0,2);
end