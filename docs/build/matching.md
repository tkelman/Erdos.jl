
<a id='Matching-1'></a>

# Matching


Algorithms for the [optimal matching problem](<https://en.wikipedia.org/wiki/Matching_(graph_theory)>).

<a id='Erdos.minimum_weight_perfect_matching' href='#Erdos.minimum_weight_perfect_matching'>#</a>
**`Erdos.minimum_weight_perfect_matching`** &mdash; *Function*.



```
minimum_weight_perfect_matching{T}(g, w::AEdgeMap{T},cutoff=typemax{T})
```

Given a graph `g` and an edgemap `w` containing weights associated to edges, returns a matching with the mimimum total weight among the ones containing exactly `nv(g)/2` edges. Edges in `g` not present in `w` will not be considered for the matching. The returned object is of type `MatchingResult`.

To reduce computational time, a `cutoff` argument can be given. Only edges with weight lower than `cutoff` will be considered for the matching.

This function relies on the BlossomV.jl package, a julia wrapper around Kolmogorov's BlossomV algorithm.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/matching/blossomv.jl#L1-L14' class='documenter-source'>source</a><br>

