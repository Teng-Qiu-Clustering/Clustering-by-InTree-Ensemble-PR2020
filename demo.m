
%%  
close all; addpath(genpath(pwd));  

%% datasets
data_names={'AGG','Flame','Spiral','Jain','2G','2G_unbalance','S1','UB','R15','D1024','3Circles','compound','S1_001S1','Iris','Seeds','Banknote','AML28','PMF'}
% data_names={'AGG','Flame','Spiral','Jain','2G','2G_unbalance','S1','UB','R15','D1024','3Circles','compound','S1_001S1','Iris','Seeds','Banknote','AML28','PMF','TSNE20_single_cell_mrna_pollen','TSNE20_USPS','TSNE20_MNIST_smallScale','TSNE20_dig1-10_uni','TSNE20_PalmData25_uni','TSNE20_Coil20Data_25_uni','TSNE20_orlFace','TSNE20_Mfeat','TSNE20_COIL100','TSNE20_Isolet_all','TSNE20_zip','TSNE20_semeion'};
 
%% compared methods
method_names = {'ND-Ward-E(KT)','ND'};

%% start testing
Result_all = [];
plot_flag = 0; % 0: do not show clustering results for 2D datasets; 1: show clustering result
record_num = 1;
for method_id = 1:length(method_names)
    method = method_names{method_id};
    for name_id=1:length(data_names)
        disp(['Method: ',method,'; Data: ',data_names{name_id}])
        load(['datasets\Random_permuted_' data_names{name_id},'.mat']);
        %     load(['datasets\' data_names{name_id},'.mat']);
        c =length(unique(annotation_data)); % c: cluster number; annotation_data: true cluster labels
 
        switch method
            case 'ND-Ward-E(KT)' % proposed method ND-Ward-E(KT) publised in Pattern Recognition (2020)
                Label = ND_Ward_E_KT(data,c); % data: N rows, M columns (row denotes sample; column denotes feature); Label: predicted cluster labels
            case 'ND' % Qiu,et al. "Nearest descent, in-tree, and clustering",arXiv:1412.5902v2, 2014.
                Label = ND(data,c);
            otherwise
                error('not included')
        end 
        
        % show clustering result for 2-dimensional datasets
        if plot_flag
            [N,dim] = size(data);
            if dim == 2
                figure; scatter(data(:,1),data(:,2),10,Label,'filled');
                set(gca,'xtick',[],'ytick',[]);axis tight; box on;
            end
        end
        
        % compute the evaluation scores
        [NMI,ARI]= NMI_ARI(Label,annotation_data);
        Result_all(record_num).dataName = data_names{name_id};
        Result_all(record_num).Method = method_names{method_id};
        Result_all(record_num).NMI = round(NMI*100)/100;
        Result_all(record_num).ARI = round(ARI*100)/100;
        record_num = record_num + 1;
    end
end

%% display the clustering results
disp(' ******************** Display All Results ************************ ')
if exist('Result_all','var')
    disp(struct2table(Result_all, 'AsArray', true)) %struct2table function may not exist in low matlab version; if so, then use the following commented codes
    
    %  disp('NMI ARI')
    %  for i = 1:length(Result_all)
    %     disp([Result_all(i).dataName, ':', sprintf('%8.2f',Result_all(i).NMI),sprintf('%8.2f',Result_all(i).ARI)])
    %  end
end

