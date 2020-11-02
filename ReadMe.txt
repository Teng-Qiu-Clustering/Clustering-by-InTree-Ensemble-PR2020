Run demo.m. This can reproduce the results in Fig.4A for the following TWO clustering method.

1) ND-Ward-E(KT): the proposed clustering method published in Pattern Recognition in 2020 (Title: "Enhancing In-Tree-based Clustering via Distance Ensemble and Kernelization" by Qiu and Li)

2) ND-K: a compared method (Qiu,et al. "Nearest descent, in-tree, and clustering",arXiv:1412.5902v2, 2014.) 

Note:
a) ND-K is the basis of ND-Ward-E(KT);
b) for ND.m, function "maxk" may not exist in low-version matlab; in this case,
the following code behind it in ND.m can be used instead (we have highlighted it in ND.m). 

