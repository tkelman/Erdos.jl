
<a id='Community-Structures-1'></a>

# Community Structures


*Erdos.jl* contains many algorithm to detect and analyze community structures in graphs.

<a id='Erdos.global_clustering_coefficient-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.global_clustering_coefficient-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.global_clustering_coefficient`** &mdash; *Method*.



```
global_clustering_coefficient(g)
```

Computes the [global clustering coefficient](https://en.wikipedia.org/wiki/Clustering_coefficient).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/clustering.jl#L75-L79' class='documenter-source'>source</a><br>

<a id='Erdos.local_clustering' href='#Erdos.local_clustering'>#</a>
**`Erdos.local_clustering`** &mdash; *Function*.



```
local_clustering(g, vlist = vertices(g))
```

Returns two vectors, respectively containing  the first and second result of `local_clustering_coefficients(g, v)` for each `v` in `vlist`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/clustering.jl#L50-L55' class='documenter-source'>source</a><br>

<a id='Erdos.local_clustering-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer}' href='#Erdos.local_clustering-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer}'>#</a>
**`Erdos.local_clustering`** &mdash; *Method*.



```
local_clustering(g, v)
```

Returns a tuple `(a,b)`, where `a` is the number of triangles in the neighborhood of `v` and `b` is the maximum number of possible triangles. It is related to the local clustering coefficient  by `r=a/b`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/clustering.jl#L12-L18' class='documenter-source'>source</a><br>

<a id='Erdos.local_clustering_coefficient' href='#Erdos.local_clustering_coefficient'>#</a>
**`Erdos.local_clustering_coefficient`** &mdash; *Function*.



```
local_clustering_coefficient(g, vlist = vertices(g))
```

Returns a vector containing  the [local clustering coefficients](https://en.wikipedia.org/wiki/Clustering_coefficient) for vertices `vlist`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/clustering.jl#L43-L47' class='documenter-source'>source</a><br>

<a id='Erdos.local_clustering_coefficient-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer}' href='#Erdos.local_clustering_coefficient-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer}'>#</a>
**`Erdos.local_clustering_coefficient`** &mdash; *Method*.



```
local_clustering_coefficient(g, v)
```

Computes the [local clustering coefficient](https://en.wikipedia.org/wiki/Clustering_coefficient) for node `v`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/clustering.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='Erdos.triangles' href='#Erdos.triangles'>#</a>
**`Erdos.triangles`** &mdash; *Function*.



```
triangles(g, vlist = vertices(g))
```

Returns a vector containing the number of triangles for vertices `vlist`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/clustering.jl#L67-L71' class='documenter-source'>source</a><br>

<a id='Erdos.triangles-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer}' href='#Erdos.triangles-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer}'>#</a>
**`Erdos.triangles`** &mdash; *Method*.



```
triangles(g, v)
```

Returns the number of triangles in the neighborhood for node `v`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/clustering.jl#L35-L39' class='documenter-source'>source</a><br>

<a id='Erdos.core_periphery_deg-Tuple{Erdos.AGraph}' href='#Erdos.core_periphery_deg-Tuple{Erdos.AGraph}'>#</a>
**`Erdos.core_periphery_deg`** &mdash; *Method*.



```
core_periphery_deg(g)
```

A simple degree-based core-periphery detection algorithm (see [Lip](http://arxiv.org/abs/1102.5511)). Returns the vertex assignments (1 for core and 2 for periphery).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/core-periphery.jl#L1-L6' class='documenter-source'>source</a><br>

<a id='Erdos.modularity-Tuple{Erdos.AGraph,Any}' href='#Erdos.modularity-Tuple{Erdos.AGraph,Any}'>#</a>
**`Erdos.modularity`** &mdash; *Method*.



```
modularity(g, c)
```

Computes Newman's modularity `Q` for graph `g` given the partitioning `c`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/modularity.jl#L1-L6' class='documenter-source'>source</a><br>

<a id='Erdos.maximal_cliques-Tuple{Erdos.AGraph}' href='#Erdos.maximal_cliques-Tuple{Erdos.AGraph}'>#</a>
**`Erdos.maximal_cliques`** &mdash; *Method*.



Finds all maximal cliques of an undirected graph.

```
julia> using Erdos
julia> g = Graph(3)
julia> add_edge!(g, 1, 2)
julia> add_edge!(g, 2, 3)
julia> maximal_cliques(g)
2-element Array{Array{Int64,N},1}:
 [2,3]
 [2,1]
```


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/cliques.jl#L8-L21' class='documenter-source'>source</a><br>

<a id='Erdos.community_detection_bethe' href='#Erdos.community_detection_bethe'>#</a>
**`Erdos.community_detection_bethe`** &mdash; *Function*.



```
community_detection_bethe(g::AGraph, k=-1; kmax=15)
```

Community detection using the spectral properties of the Bethe Hessian matrix associated to `g` (see [Saade et al.](http://papers.nips.cc/paper/5520-spectral-clustering-of-graphs-with-the-bethe-hessian)). `k` is the number of community to detect. If omitted or if `k<1` the optimal number of communities will be automatically selected. In this case the maximum number of detectable communities is given by `kmax`. Returns a vector containing the vertex assignments.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/detection.jl#L64-L73' class='documenter-source'>source</a><br>

<a id='Erdos.community_detection_nback-Tuple{Erdos.AGraph,Int64}' href='#Erdos.community_detection_nback-Tuple{Erdos.AGraph,Int64}'>#</a>
**`Erdos.community_detection_nback`** &mdash; *Method*.



```
community_detection_nback(g::AGraph, k::Int)
```

Community detection using the spectral properties of the non-backtracking matrix of `g` (see [Krzakala et al.](http://www.pnas.org/content/110/52/20935.short)).

`g`: imput Graph `k`: number of communities to detect

return : array containing vertex assignments


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/detection.jl#L1-L11' class='documenter-source'>source</a><br>

<a id='Erdos.label_propagation-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.label_propagation-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.label_propagation`** &mdash; *Method*.



Community detection using the label propagation algorithm (see [Raghavan et al.](http://arxiv.org/abs/0709.2938)). `g`: input Graph `maxiter`: maximum number of iterations return : vertex assignments and the convergence history


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/detection.jl#L92-L97' class='documenter-source'>source</a><br>

<a id='Erdos.nonbacktrack_embedding-Tuple{Erdos.AGraph,Int64}' href='#Erdos.nonbacktrack_embedding-Tuple{Erdos.AGraph,Int64}'>#</a>
**`Erdos.nonbacktrack_embedding`** &mdash; *Method*.



Spectral embedding of the non-backtracking matrix of `g` (see [Krzakala et al.](http://www.pnas.org/content/110/52/20935.short)).

`g`: imput Graph `k`: number of dimensions in which to embed

return : a matrix ϕ where ϕ[:,i] are the coordinates for vertex i.

Note does not explicitly construct the `nonbacktracking_matrix`. See `Nonbacktracking` for details.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/community/detection.jl#L35-L47' class='documenter-source'>source</a><br>

