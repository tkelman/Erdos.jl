
<a id='Path-and-Traversal-1'></a>

# Path and Traversal


*FatGraphs.jl* provides several traversal and shortest-path algorithms, along with various utility functions. Where appropriate, edge distances may be passed in as a matrix of real number values.


Edge distances for most traversals may be passed in as a sparse or dense matrix of  values, indexed by `[src,dst]` vertices. That is, `distmx[2,4] = 2.5` assigns the distance `2.5` to the (directed) edge connecting vertex 2 and vertex 4. Note that also for undirected graphs `distmx[4,2]` has to be set.


Any graph traversal  will traverse an edge only if it is present in the graph. When a distance matrix is passed in,


1. distance values for undefined edges will be ignored, and
2. any unassigned values (in sparse distance matrices), for edges that are present in the graph, will be assumed to take the default value of 1.0.
3. any zero values (in sparse/dense distance matrices), for edges that are present in the graph, will instead have an implicit edge cost of 1.0.


<a id='Graph-Traversal-1'></a>

## Graph Traversal


*Graph traversal* refers to a process that traverses vertices of a graph following certain order (starting from user-input sources). This package implements three traversal schemes:


  * `BreadthFirst`,
  * `DepthFirst`, and
  * `MaximumAdjacency`.


<!–- TODO separate the 3 in different paragraphs? –>

<a id='FatGraphs.BreadthFirst' href='#FatGraphs.BreadthFirst'>#</a>
**`FatGraphs.BreadthFirst`** &mdash; *Type*.



**Conventions in Breadth First Search and Depth First Search** VertexColorMap :

  * color == 0    => unseen
  * color < 0     => examined but not closed
  * color > 0     => examined and closed

EdgeColorMap :

  * color == 0    => unseen
  * color == 1     => examined


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/bfs.jl#L11-L21' class='documenter-source'>source</a><br>

<a id='FatGraphs.bfs_tree-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.bfs_tree-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.bfs_tree`** &mdash; *Method*.



```
bfs_tree(g, s)
```

Provides a breadth-first traversal of the graph `g` starting with source vertex `s`, and returns a directed acyclic graph of vertices in the order they were discovered.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/bfs.jl#L171-L176' class='documenter-source'>source</a><br>

<a id='FatGraphs.bipartite_map-Tuple{FatGraphs.AGraph}' href='#FatGraphs.bipartite_map-Tuple{FatGraphs.AGraph}'>#</a>
**`FatGraphs.bipartite_map`** &mdash; *Method*.



```
bipartite_map(g)
```

If the graph is bipartite returns a vector `c`  of size `nv(g)` containing the assignment of each vertex to one of the two sets (`c[i] == 1` or `c[i]==2`). If `g` is not bipartite returns an empty vector.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/bfs.jl#L252-L258' class='documenter-source'>source</a><br>

<a id='FatGraphs.gdistances!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}' href='#FatGraphs.gdistances!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}'>#</a>
**`FatGraphs.gdistances!`** &mdash; *Method*.



```
gdistances!(g, source, dists) -> dists
```

Fills `dists` with the geodesic distances of vertices in  `g` from vertex/vertices `source`. `dists` can be either a vector or a dictionary.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/bfs.jl#L91-L96' class='documenter-source'>source</a><br>

<a id='FatGraphs.gdistances-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.gdistances-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.gdistances`** &mdash; *Method*.



```
gdistances(g, source) -> dists
```

Returns a vector filled with the geodesic distances of vertices in  `g` from vertex/vertices `source`. For vertices in disconnected components the default distance is -1.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/bfs.jl#L107-L112' class='documenter-source'>source</a><br>

<a id='FatGraphs.is_bipartite-Tuple{FatGraphs.AGraph}' href='#FatGraphs.is_bipartite-Tuple{FatGraphs.AGraph}'>#</a>
**`FatGraphs.is_bipartite`** &mdash; *Method*.



```
is_bipartite(g)
is_bipartite(g, v)
```

Will return `true` if graph `g` is [bipartite](https://en.wikipedia.org/wiki/Bipartite_graph). If a node `v` is specified, only the connected component to which it belongs is considered.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/bfs.jl#L222-L228' class='documenter-source'>source</a><br>

<a id='FatGraphs.DepthFirst' href='#FatGraphs.DepthFirst'>#</a>
**`FatGraphs.DepthFirst`** &mdash; *Type*.



**Conventions in Breadth First Search and Depth First Search** VertexColorMap :

  * color == 0    => unseen
  * color < 0     => examined but not closed
  * color > 0     => examined and closed

EdgeColorMap :

  * color == 0    => unseen
  * color == 1     => examined


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/dfs.jl#L12-L22' class='documenter-source'>source</a><br>

<a id='FatGraphs.dfs_tree-Tuple{G,Any}' href='#FatGraphs.dfs_tree-Tuple{G,Any}'>#</a>
**`FatGraphs.dfs_tree`** &mdash; *Method*.



```
dfs_tree(g, s)
```

Provides a depth-first traversal of the graph `g` starting with source vertex `s`, and returns a directed acyclic graph of vertices in the order they were discovered.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/dfs.jl#L184-L189' class='documenter-source'>source</a><br>

<a id='FatGraphs.is_cyclic-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.is_cyclic-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.is_cyclic`** &mdash; *Method*.



```
is_cyclic(g)
```

Tests whether a graph contains a cycle through depth-first search. It returns `true` when it finds a cycle, otherwise `false`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/dfs.jl#L115-L120' class='documenter-source'>source</a><br>

<a id='FatGraphs.maximum_adjacency_visit-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{T,2},Bool,IO}' href='#FatGraphs.maximum_adjacency_visit-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{T,2},Bool,IO}'>#</a>
**`FatGraphs.maximum_adjacency_visit`** &mdash; *Method*.



Returns the vertices in `g` traversed by maximum adjacency search. An optional `distmx` matrix may be specified; if omitted, edge distances are assumed to be 1. If `log` (default `false`) is `true`, visitor events will be printed to `io`, which defaults to `STDOUT`; otherwise, no event information will be displayed.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/maxadjvisit.jl#L207-L213' class='documenter-source'>source</a><br>

<a id='FatGraphs.minimum_cut-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{T,2}}' href='#FatGraphs.minimum_cut-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{T,2}}'>#</a>
**`FatGraphs.minimum_cut`** &mdash; *Method*.



```
minimum_cut(g, dist_matrix=DefaultDistance())
```

Finds the `cut` of minimum total weight.

Returns a tuple `(f, cut, labels)`, where `f` is the weight of the cut, `cut` is a vector of the edges in the cut, and `labels` gives a partitioning of the vertices in two sets, according to the cut. An optional `dist_matrix` matrix maybe specified; if omitted, edge distances are assumed to be 1.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/maxadjvisit.jl#L177-L186' class='documenter-source'>source</a><br>


<a id='Random-walks-1'></a>

## Random walks


*FatGraphs* includes uniform random walks and self avoiding walks:

<a id='FatGraphs.non_backtracking_randomwalk-Tuple{FatGraphs.AGraph,Integer,Integer}' href='#FatGraphs.non_backtracking_randomwalk-Tuple{FatGraphs.AGraph,Integer,Integer}'>#</a>
**`FatGraphs.non_backtracking_randomwalk`** &mdash; *Method*.



```
non_backtracking_randomwalk(g, s, niter)
```

Performs a non-backtracking random walk on graph `g` starting at vertex `s` and continuing for a maximum of `niter` steps. Returns a vector of vertices visited in order.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/randomwalks.jl#L23-L28' class='documenter-source'>source</a><br>

<a id='FatGraphs.randomwalk-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Integer,Integer}' href='#FatGraphs.randomwalk-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Integer,Integer}'>#</a>
**`FatGraphs.randomwalk`** &mdash; *Method*.



```
randomwalk(g, s, niter)
```

Performs a random walk on graph `g` starting at vertex `s` and continuing for a maximum of `niter` steps. Returns a vector of vertices visited in order.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/randomwalks.jl#L1-L6' class='documenter-source'>source</a><br>

<a id='FatGraphs.self_avoiding_randomwalk-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Integer,Integer}' href='#FatGraphs.self_avoiding_randomwalk-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Integer,Integer}'>#</a>
**`FatGraphs.self_avoiding_randomwalk`** &mdash; *Method*.



```
self_avoiding_randomwalk(g, s, niter)
```

Performs a [self-avoiding walk](https://en.wikipedia.org/wiki/Self-avoiding_walk) on graph `g` starting at vertex `s` and continuing for a maximum of `niter` steps. Returns a vector of vertices visited in order.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/randomwalks.jl#L88-L94' class='documenter-source'>source</a><br>


<a id='Connectivity-/-Bipartiteness-1'></a>

## Connectivity / Bipartiteness


`Graph connectivity` functions are defined on both undirected and directed graphs:

<a id='FatGraphs.attracting_components-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.attracting_components-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.attracting_components`** &mdash; *Method*.



```
attracting_components(g::ADiGraph)
```

Returns a vector of vectors of integers representing lists of attracting components in `g`. The attracting components are a subset of the strongly connected components in which the components do not have any leaving edges.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L261-L267' class='documenter-source'>source</a><br>

<a id='FatGraphs.condensation-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.condensation-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.condensation`** &mdash; *Method*.



```
condensation(g::ADiGraph)
```

Returns the condensation graph associated with `g`. The condensation `h` of a graph `g` is the directed graph where every node in `h` represents a strongly connected component in `g`, and the presence of an edge between between nodes in `h` indicates that there is at least one edge between the associated strongly connected components in `g`. The node numbering in `h` corresponds to the ordering of the components output from [`strongly_connected_components`](traversals.md#FatGraphs.strongly_connected_components-Tuple{FatGraphs.ADiGraph}).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L249-L258' class='documenter-source'>source</a><br>

<a id='FatGraphs.connected_components-Tuple{FatGraphs.AGraph}' href='#FatGraphs.connected_components-Tuple{FatGraphs.AGraph}'>#</a>
**`FatGraphs.connected_components`** &mdash; *Method*.



```
connected_components(g::AGraph)
```

Returns the [connected components](https://en.wikipedia.org/wiki/Connectivity_(graph_theory)) of `g` as a vector of components, each represented by a vector of vertices belonging to the component.

See also [`weakly_connected_components`](traversals.md#FatGraphs.weakly_connected_components-Tuple{FatGraphs.ADiGraph}) and [`strongly_connected_components`](traversals.md#FatGraphs.strongly_connected_components-Tuple{FatGraphs.ADiGraph}) for directed graphs.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L84-L93' class='documenter-source'>source</a><br>

<a id='FatGraphs.is_connected-Tuple{FatGraphs.AGraph}' href='#FatGraphs.is_connected-Tuple{FatGraphs.AGraph}'>#</a>
**`FatGraphs.is_connected`** &mdash; *Method*.



```
is_connected(g)
```

Returns `true` if `g` is connected. For DiGraphs, this is equivalent to a test of weak connectivity.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L102-L107' class='documenter-source'>source</a><br>

<a id='FatGraphs.is_strongly_connected-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.is_strongly_connected-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.is_strongly_connected`** &mdash; *Method*.



```
is_strongly_connected(g::ADiGraph)
```

Returns `true` if `g` is strongly connected.

See also [`strongly_connected_components`](traversals.md#FatGraphs.strongly_connected_components-Tuple{FatGraphs.ADiGraph})


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L195-L201' class='documenter-source'>source</a><br>

<a id='FatGraphs.is_weakly_connected-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.is_weakly_connected-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.is_weakly_connected`** &mdash; *Method*.



```
is_weakly_connected(g::ADiGraph)
```

Returns `true` if the undirected graph `g` is weakly connected.

See also [`weakly_connected_components`](traversals.md#FatGraphs.weakly_connected_components-Tuple{FatGraphs.ADiGraph}).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L119-L125' class='documenter-source'>source</a><br>

<a id='FatGraphs.neighborhood-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}' href='#FatGraphs.neighborhood-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}'>#</a>
**`FatGraphs.neighborhood`** &mdash; *Method*.



```
neighborhood(g, v::Int, d::Int; dir=:out)
```

Returns a vector of the vertices in `g` at distance less or equal to `d` from `v`. If `g` is a `DiGraph` the `dir` optional argument specifies the edge direction the edge direction with respect to `v` (i.e. `:in` or `:out`) to be considered.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L298-L304' class='documenter-source'>source</a><br>

<a id='FatGraphs.period-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.period-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.period`** &mdash; *Method*.



```
period(g::ADiGraph)
```

Computes the common period for all nodes in a strongly connected graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L204-L208' class='documenter-source'>source</a><br>

<a id='FatGraphs.strongly_connected_components-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.strongly_connected_components-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.strongly_connected_components`** &mdash; *Method*.



```
strongly_connected_components(g::ADiGraph)
```

Computes the strongly connected components of a directed graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L172-L176' class='documenter-source'>source</a><br>

<a id='FatGraphs.weakly_connected_components-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.weakly_connected_components-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.weakly_connected_components`** &mdash; *Method*.



```
weakly_connected_components(g::ADiGraph)
```

Returns the weakly connected components of undirected graph `g`. It is equivalent to the connected components of the corresponding undirected graph, i.e. `connected_components(graph(g))`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/traversals/connectivity.jl#L110-L116' class='documenter-source'>source</a><br>

