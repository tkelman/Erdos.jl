
<a id='Matching-1'></a>

# Matching


Algorithms for the [optimal matching problem](<https://en.wikipedia.org/wiki/Matching_(graph_theory)>).

<a id='FatGraphs.minimum_weight_perfect_matching' href='#FatGraphs.minimum_weight_perfect_matching'>#</a>
**`FatGraphs.minimum_weight_perfect_matching`** &mdash; *Function*.



```
minimum_weight_perfect_matching{T<:Real, E}(g, w::Dict{E,T} [,cutoff])
```

Given a graph `g` and an edgemap `w` containing weights associated to edges, returns a matching with the mimimum total weight among the ones containing exactly `nv(g)/2` edges.

Edges in `g` not present in `w` will not be considered for the matching.

This function relies on the BlossomV.jl package, a julia wrapper around Kolmogorov's BlossomV algorithm.

Eventually a `cutoff` argument can be given, to the reduce computational time excluding edges with weights higher than the cutoff.

The returned object is of type `MatchingResult`.

In case of error try to change the optional argument `tmaxscale` (default is `tmaxscale=10`).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/matching/blossomv.jl#L1-L19' class='documenter-source'>source</a><br>

