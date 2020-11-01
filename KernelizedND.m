function [W,I] = KernelizedND(D,sigma)  
S_IT=exp(-D/sigma);
D = acos(S_IT);  % cosine distance in kernel space        
% D = sqrt(2-2*S_IT); % Euclidean distance in kernel space
P_Amp=sum(S_IT,2);clear S_IT;
N = length(P_Amp);
C=repmat(P_Amp,1,N)-repmat(P_Amp',N,1);
D(C>0)=inf;
D((C==0)&(tril(ones(N,N))))=inf;
[W,I]=min(D,[],2);
W_Max_idx=find(isinf(W));
I(W_Max_idx)=W_Max_idx;
W(W_Max_idx)=0;