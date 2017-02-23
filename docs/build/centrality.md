
<a id='Centrality-Measures-1'></a>

# Centrality Measures


[Centrality measures](https://en.wikipedia.org/wiki/Centrality) describe the importance of a vertex to the rest of the graph using some set of criteria. Centrality measures implemented in *Erdos.jl* include the following:

- [`Erdos.betweenness_centrality`](centrality.md#Erdos.betweenness_centrality)
- [`Erdos.closeness_centrality`](centrality.md#Erdos.closeness_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.cores`](centrality.md#Erdos.cores-Tuple{Erdos.AGraph})
- [`Erdos.degree_centrality`](centrality.md#Erdos.degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.in_degree_centrality`](centrality.md#Erdos.in_degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.katz_centrality`](centrality.md#Erdos.katz_centrality)
- [`Erdos.kcore`](centrality.md#Erdos.kcore-Tuple{Erdos.AGraph,Integer})
- [`Erdos.out_degree_centrality`](centrality.md#Erdos.out_degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.pagerank`](centrality.md#Erdos.pagerank)

<a id='Erdos.betweenness_centrality' href='#Erdos.betweenness_centrality'>#</a>
**`Erdos.betweenness_centrality`** &mdash; *Function*.



```
betweenness_centrality(g, k=0; normalize=true, endpoints=false)
```

Calculates the [betweenness centrality](https://en.wikipedia.org/wiki/Centrality#Betweenness_centrality) of the graph `g`, or, optionally, of a random subset of `k` vertices. Can optionally include endpoints in the calculations. Normalization is enabled by default.

Betweenness centrality is defined as:

$bc(v) = rac{1}{mathcal{N}} sum_{s  eq t  eq v}         rac{sigma_{st}(v)}{sigma_{st}}$.

**Parameters**

g: ASimpleGraph     A Graph, directed or undirected.

k: Integer, optional     Use `k` nodes sample to estimate the betweenness centrality. If none,     betweenness centrality is computed using the `n` nodes in the graph.

normalize: bool, optional     If true, the betweenness values are normalized by the total number     of possible distinct paths between all pairs in the graphs. For an undirected graph,     this number if `((n-1)*(n-2))/2` and for a directed graph, `(n-1)*(n-2)`     where `n` is the number of nodes in the graph.

endpoints: bool, optional     If true, endpoints are included in the shortest path count.

**Returns**

betweenness: Vector{Float64}     Betweenness centrality value per node id.

**References**

[1] Brandes 2001 & Brandes 2008


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/betweenness.jl#L5-L48' class='documenter-source'>source</a><br>

<a id='Erdos.closeness_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.closeness_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.closeness_centrality`** &mdash; *Method*.



Calculates the [closeness centrality](https://en.wikipedia.org/wiki/Centrality#Closeness_centrality) of the graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/closeness.jl#L1-L4' class='documenter-source'>source</a><br>

<a id='Erdos.degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.degree_centrality`** &mdash; *Method*.



Calculates the [degree centrality](https://en.wikipedia.org/wiki/Centrality#Degree_centrality) of the graph `g`, with optional (default) normalization.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/degree.jl#L19-L21' class='documenter-source'>source</a><br>

<a id='Erdos.in_degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.in_degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.in_degree_centrality`** &mdash; *Method*.



Calculates the [degree centrality](https://en.wikipedia.org/wiki/Centrality#Degree_centrality) of the graph `g`, with optional (default) normalization.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/degree.jl#L22-L24' class='documenter-source'>source</a><br>

<a id='Erdos.out_degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.out_degree_centrality-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.out_degree_centrality`** &mdash; *Method*.



Calculates the [degree centrality](https://en.wikipedia.org/wiki/Centrality#Degree_centrality) of the graph `g`, with optional (default) normalization.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/degree.jl#L25-L27' class='documenter-source'>source</a><br>

<a id='Erdos.katz_centrality' href='#Erdos.katz_centrality'>#</a>
**`Erdos.katz_centrality`** &mdash; *Function*.



Calculates the [Katz centrality](https://en.wikipedia.org/wiki/Katz_centrality) of the graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/katz.jl#L24-L27' class='documenter-source'>source</a><br>

<a id='Erdos.pagerank' href='#Erdos.pagerank'>#</a>
**`Erdos.pagerank`** &mdash; *Function*.



```
pagerank(g::ADiGraph, α=0.85, n=100, ϵ = 1.0e-6)
```

Calculates the [PageRank](https://en.wikipedia.org/wiki/PageRank) of the graph `g`. Can optionally specify a different damping factor (`α`), number of iterations (`n`), and convergence threshold (`ϵ`). If convergence is not reached within `n` iterations, an error will be returned.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/pagerank.jl#L4-L11' class='documenter-source'>source</a><br>

<a id='Erdos.cores-Tuple{Erdos.AGraph}' href='#Erdos.cores-Tuple{Erdos.AGraph}'>#</a>
**`Erdos.cores`** &mdash; *Method*.



```
cores(g)
```

Returns a vector `deg` such that if `deg[v]=k` then the vertex `v` belongs to the `k`-core of `g` and not to the `k+1`-core.

See also [`kcore`](centrality.md#Erdos.kcore-Tuple{Erdos.AGraph,Integer}).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/kcore.jl#L1-L8' class='documenter-source'>source</a><br>

<a id='Erdos.kcore-Tuple{Erdos.AGraph,Integer}' href='#Erdos.kcore-Tuple{Erdos.AGraph,Integer}'>#</a>
**`Erdos.kcore`** &mdash; *Method*.



```
kcore(g, k) -> (gnew, vmap)
```

Returns the `k`-core  of `g` along with and vector that associates the new vertices to the old ones.

See also [`cores`](centrality.md#Erdos.cores-Tuple{Erdos.AGraph})


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/centrality/kcore.jl#L62-L69' class='documenter-source'>source</a><br>

