function Label = ND_Ward_E_KT(data,c,Sigma_array)  
    if nargin<2
        error('at least two input is needed')
    end
    if nargin<3
        D = squareform(pdist(data,'minkowski',2)); % equivalent to euclidean distance
        Sigma_array = logspace(log10(0.001),log10(max(D(:))),8); % note: y = logspace(a,b,n) generates n points between decades 10^a and 10^b.
    else
        D = squareform(pdist(data,'minkowski',2)); % equivalent to euclidean distance
    end 
    Ens_TsGTD=zeros(size(D));
    for i=1:length(Sigma_array) 
        [W,I] = KernelizedND(D,Sigma_array(i));
        TsGTD_i = Tree_symm_Transitive_Dis(W,I);
        Ens_TsGTD = Ens_TsGTD + TsGTD_i;
    end 
    
    Ens_TsGTD = Ens_TsGTD/length(Sigma_array);  

    corrDist = Ens_TsGTD(find(tril(ones(size(D)),-1)));  
    clusterTree = linkage(corrDist','ward');
    % dendrogram(clusterTree)
    Label = cluster(clusterTree, 'maxclust', c);  