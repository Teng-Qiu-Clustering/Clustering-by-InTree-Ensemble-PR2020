# Fast run the code with a demo

Run demo.m. This can reproduce the results in Fig.4A for the following TWO clustering methods on 30 test datasets.

1) ND-Ward-E(KT): the proposed clustering method published in Pattern Recognition in 2020 (Title: "Enhancing In-Tree-based Clustering via Distance Ensemble and Kernelization" by Qiu and Li)

2) ND-K: a compared method (Qiu, et al. "Nearest descent, in-tree, and clustering",arXiv:1412.5902v2, 2014.) 

Note:
a) ND-K is the basis of ND-Ward-E(KT);
b) for ND.m, function "maxk" may not exist in low-version Matlab; in this case,
the following code behind it in ND.m can be used instead (we have highlighted it in ND.m). 

# Brief introduction of the proposed method: ND-Ward-E(KT)

Recently, we have proposed a novel physically-inspired method, called
the Nearest Descent (ND), which plays the role of organizing all the
samples into an effective Graph, called the in-tree. Due to its effective
characteristics, this in-tree proves very suitable for data clustering.
Nevertheless, this in-tree-based clustering still has some non-trivial
limitations in terms of robustness, capability, etc. In this study,
we first propose a distance-ensemble-based framework for the in-tree-based
clustering, which proves a very convenient way to overcome the robustness
limitation in our previous in-tree-based clustering. To enhance the
capability of the in-tree-based clustering in handling extremely linearly-inseparable
clusters, we kernelize the proposed ensemble-based clustering via
the so-called kernel trick. As a result, the improved in-tree-based
clustering method achieves high robustness and accuracy on diverse
challenging synthetic and real-world datasets, showing a certain degree
of practical value.

# Figures
## Fig4: Results of the 1st group of experiments. (A) The scores (NMI) of different methods (columns) with fixed empirical parameter values
across all datasets (rows). The methods in bold are the density-peak-based methods; the rest are the level-set-based ones. The highest score
for each row is marked in bold. (B) and (C) show the mean and variance of the scores of each method on all the datasets, respectively.

![Fig.4](https://github.com/Teng-Qiu-Clustering/Code-ClusteringbyInTreeEnsemble-PR2020/blob/main/ImageFolderForReadMe/Fig.4.png)
