function TsTD = Tree_symm_Transitive_Dis(W,I)
[W2,idx]=sort(W,'Descend');
N=length(W);
D_IT=zeros(N,N);
for i=1:N-1
    new_root=idx(i);
    end_node=I(new_root);
    I(new_root)=new_root;
    I2=identify_root(I);
    old_root=I2(end_node);
    D_IT(I2==new_root,I2==old_root)=W2(i); 
end
TsTD=max(D_IT,D_IT');