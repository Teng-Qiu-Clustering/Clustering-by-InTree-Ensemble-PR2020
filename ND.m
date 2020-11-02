function Label = ND(data,c,sigma)  % c: cluster number; sigma: kernel bandwidth
if nargin<2
    error('at least two inputs are needed')
end
if nargin<3 
    D = pdist(data);  sigma = quantile(D,0.01);
    D = squareform(D);
else
    D=squareform(pdist(data));
end
 

P=-sum(exp(-D/sigma),2); N=length(P);
C=repmat(P',N,1)-repmat(P,1,N);
D(C>0)=inf;
D((C==0)&(tril(ones(N,N))))=inf;
[W,I]=min(D,[],2);
idx=find(isinf(W)); I(idx)=idx; W(idx)=-inf;
% Stage 2: remove the undesired edges (Note: more effective method edge
% cutting method can be found in Qiu,et al. "Nearest descent, in-tree, and clustering",arXiv:1412.5902v2, 2014.)
[u,idx]=maxk(W,c-1);
I(idx)=idx;
% W(idx)=-inf;
% Note: Function "maxk" may not exist in low-version matlab; in this case,
% the following code (FOR-LOOP) can be used instead. 
% for i=1:c-1, 
%     [u,idx]=max(W); 
%     I(idx)=idx; 
%     W(idx)=-inf; 
% end
% Stage 3: gather at the root nodes
% I_old=(1:N)';
% while norm(I-I_old), I_old=I; I=I_old(I_old); end
I_new=I(I);
while norm(I-I_new), I=I_new; I_new=I(I); end
% Stage 4: cluster assignment (there is no need to transform Label to start from 1
% idx=find(isinf(W)); Label=zeros(N,1);
% for i=1:length(idx), Label(I==idx(i))=i; end
Label = I_new;


