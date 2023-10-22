function [RMMs,EOFs,Ds]=rmm(olr,u200,u850,enso_index,lat)
%% Extract Intraseasonal Features
olr=cat(4,olr,u850,u200);
for i=1:size(olr,1)
    for j=1:size(olr,2)
        for k=1:size(olr,4)
            olr_here=squeeze(olr(i,j,:,k));
            % remove harmonic
            olr_here=olr_here-harmonic(olr_here);
            % remove enso
            olr_here=rmenso(olr_here,enso_index);
            % remove pre-120 mean
            olr_here=olr_here-movmean(olr_here,[120 0]);
            olr(i,j,:,k)=olr_here;
        end
    end
end
%% Spatially Averaging
olr_full=[];
for k=1:3
    olr_here=olr(:,:,:,k).*repmat(cosd(lat'),1,1,size(olr,3));
    olr_here=squeeze(nansum(olr_here,2)./nansum(cosd(lat')));
    olr_full=[olr_full;olr_here];
end
olr_full=olr_full./nanstd(olr_full,0,2);
%% EOF
[EOFs,PCs,Ds]=eof(olr_full);
RMMs=PCs(1:2,:);
EOFs=EOFs(:,1:2);
Ds=Ds(1:2);
end