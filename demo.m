%%
clear all;clc; close all;

load('Flame.mat');

c = 2; % c: cluster number
Label = ND_Ward_E_KT(data,c); % data: N rows, M columns (row denotes sample; column denotes feature);
 
figure;scatter(data(:,1),data(:,2),15,Label,'filled');

% 
% permute the distance matrix according to the clustering assignment
% Ranked_idx=[];
% for Label_id=1:length(unique(Label))
%     Ranked_idx=[Ranked_idx;find(Label==Label_id)];
% end
% figure;imshow(D_initial(Ranked_idx,Ranked_idx),[]);colorbar; axis equal;
% figure;imshow(Ens_TsGTD(Ranked_idx,Ranked_idx),[]);colorbar; axis equal;
% 
% visualization via classical MDS
% [Y,e] = cmdscale(Ens_TsGTD);
% 
% figure;scatter(Y(:,1),Y(:,2),15,annotation_data,'filled');
% axis image;grid off;set(gcf,'color','w');
% box on;axis;axis image;axis equal;
% set(gca,'ytick',[]);set(gca,'xtick',[]);
% set(gca,'fontsize',15,'fontweight','bold');
% xlabel('x','fontsize',15,'fontweight','bold')
% ylabel('y','fontsize',15,'fontweight','bold')


