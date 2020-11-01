function Label = ND_Ward_E_KT(data,c,Sigma_array)

    % PCA or not
    %         [pc, zscores, pcvars] = princomp(double(data));
    %         en=cumsum(pcvars./sum(pcvars) * 100);
    %         data=zscores(:,en<95); 

    D = squareform(pdist(data,'minkowski',2));

    D_initial=D; 
    [N,dim]=size(data);
    if nargin<2
        error('at least two input is needed')
    end
    if nargin<3
    %%%%% note that y = logspace(a,b,n) generates n points between decades 10^a and 10^b.
    Sigma_array = logspace(log10(0.001),log10(max(D_initial(:))),8);
    end

    TsGTD=zeros(N,N,length(Sigma_array));
    for i=1:length(Sigma_array)
        D=D_initial;
        sigma=Sigma_array(i);

        S_IT=exp(-D/sigma);
        D = acos(S_IT);

        P_Amp=sum(S_IT,2);
        N = length(P_Amp);
        clear S_IT;

        C=repmat(P_Amp,1,length(P_Amp))-repmat(P_Amp',length(P_Amp),1);
        D(C>0)=inf;
        D((C==0)&(tril(ones(N,N))))=inf;
        [W,I]=min(D,[],2);
        W_Max_idx=find(isinf(W));
        I(W_Max_idx)=W_Max_idx;
        W(W_Max_idx)=0;
        TsGTD_i = Tree_symm_Transitive_Dis(W,I);
        TsGTD(:,:,i)=TsGTD_i;
    end 
    
    Ens_TsGTD = mean(TsGTD,3); 

    corrDist = Ens_TsGTD(find(tril(ones(N,N),-1)))';  
    clusterTree = linkage(corrDist,'ward');
    % dendrogram(clusterTree)
    Label = cluster(clusterTree, 'maxclust', c);  