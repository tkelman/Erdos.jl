
<a id='Basic-Interface-1'></a>

# Basic Interface


*FatGraphs.jl* defines the following basic types and functionalities:


<a id='FatGraphs.ADiGraph' href='#FatGraphs.ADiGraph'>#</a>
**`FatGraphs.ADiGraph`** &mdash; *Type*.



Abstract directed graph type


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L38-L40' class='documenter-source'>source</a><br>

<a id='FatGraphs.AGraph' href='#FatGraphs.AGraph'>#</a>
**`FatGraphs.AGraph`** &mdash; *Type*.



Abstract (undirected) graph type

Guarantees:     vertices are integers in 1:nv(g)

Functions to implement:     basic constructors (e.g. MyGraph(n), MyGraph())     nv(g)     ne(g)     out_neighbors(g, v)     in_neighbors(g, v) #digraph     edge(g, u, v)     add_edge!(g, u, v)     rem_edge!(g, u, v)     add_vertex!(g)     rem_vertex!(g, v)     graphtype(g)     digraphtype(g)     edgetype(g)

Reccomended Overrides:     in_adjlist(g) #digraph     out_adjlist(g)     has_edge(g, u, v)     ==(g, h)     out_edges(g, u)     in_edges(g, u) # digraph     rem_edge!(g, e)     graph(dg)     digraph(g)     reverse!(g) #digraph     unsafe_add_edge!(g, u, v)     rebuild!(g)


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L1-L35' class='documenter-source'>source</a><br>

<a id='Base.reverse-Tuple{FatGraphs.AEdge}' href='#Base.reverse-Tuple{FatGraphs.AEdge}'>#</a>
**`Base.reverse`** &mdash; *Method*.



```
reverse(e::Edge)
```

Swap `e.src` and `e.dst`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L167-L171' class='documenter-source'>source</a><br>

<a id='FatGraphs.add_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}' href='#FatGraphs.add_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}'>#</a>
**`FatGraphs.add_edge!`** &mdash; *Method*.



```
add_edge!(g, e)
```

Add to `g` the edge `e`.

```
add_edge!(g, u, v)
```

Add to `g` an edge from `u` to `v`.

Will return false if add fails (e.g., if vertices are not in the graph or the edge is already present) and true otherwise.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L66-L77' class='documenter-source'>source</a><br>

<a id='FatGraphs.add_vertex!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.add_vertex!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.add_vertex!`** &mdash; *Method*.



```
add_vertex!(g)
```

Add a new vertex to the graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L95-L99' class='documenter-source'>source</a><br>

<a id='FatGraphs.dst-Tuple{FatGraphs.AEdge}' href='#FatGraphs.dst-Tuple{FatGraphs.AEdge}'>#</a>
**`FatGraphs.dst`** &mdash; *Method*.



```
dst(e)
```

Returns the destination of an edge.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L160-L164' class='documenter-source'>source</a><br>

<a id='FatGraphs.edge-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}' href='#FatGraphs.edge-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}'>#</a>
**`FatGraphs.edge`** &mdash; *Method*.



```
edge(g, u, v)
```

Returns an edge from 'u' to 'v'. The edge doesn't necessarily exists in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L131-L136' class='documenter-source'>source</a><br>

<a id='FatGraphs.edgetype-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.edgetype-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.edgetype`** &mdash; *Method*.



```
edgetype(g)
```

Returns the type of edges of graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L139-L143' class='documenter-source'>source</a><br>

<a id='FatGraphs.in_neighbors-Tuple{FatGraphs.ADiGraph,Any}' href='#FatGraphs.in_neighbors-Tuple{FatGraphs.ADiGraph,Any}'>#</a>
**`FatGraphs.in_neighbors`** &mdash; *Method*.



```
in_neighbors(g, v)
```

Returns an iterable to all neighbors connected to vertex `v` by an incoming edge.

NOTE: it may return a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L112-L118' class='documenter-source'>source</a><br>

<a id='FatGraphs.ne-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.ne-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.ne`** &mdash; *Method*.



```
ne(g)
```

The number of edges in `g`.

Time Complexity: O(1)


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L57-L63' class='documenter-source'>source</a><br>

<a id='FatGraphs.nv-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.nv-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.nv`** &mdash; *Method*.



```
nv(g)
```

The number of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L50-L54' class='documenter-source'>source</a><br>

<a id='FatGraphs.out_neighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.out_neighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.out_neighbors`** &mdash; *Method*.



```
out_neighbors(g::ASimpleGraph, v)
```

Returns an iterable to all neighbors connected to vertex `v` by an outgoing edge.

NOTE: it may return a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L122-L128' class='documenter-source'>source</a><br>

<a id='FatGraphs.rem_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}' href='#FatGraphs.rem_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}'>#</a>
**`FatGraphs.rem_edge!`** &mdash; *Method*.



```
rem_edge!(g, e)
```

Remove the edge `e`.

```
rem_edge!(g, u, v)
```

Remove the edge from `u` to `v`.

Returns false if edge removal fails (e.g., if the edge does not exist) and true otherwise.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L81-L91' class='documenter-source'>source</a><br>

<a id='FatGraphs.rem_vertex!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.rem_vertex!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.rem_vertex!`** &mdash; *Method*.



```
rem_vertex!(g, v)
```

Remove the vertex `v` from graph `g`. It may change the index of other vertices (usually of the last one).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L103-L108' class='documenter-source'>source</a><br>

<a id='FatGraphs.src-Tuple{FatGraphs.AEdge}' href='#FatGraphs.src-Tuple{FatGraphs.AEdge}'>#</a>
**`FatGraphs.src`** &mdash; *Method*.



```
src(e)
```

Returns the source of an edge.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/interface.jl#L153-L157' class='documenter-source'>source</a><br>

<a id='Base.reverse!-Tuple{FatGraphs.ADiGraph}' href='#Base.reverse!-Tuple{FatGraphs.ADiGraph}'>#</a>
**`Base.reverse!`** &mdash; *Method*.



```
reverse!(g::DiGraph)
```

In-place reverse (modifies the original graph).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L278-L282' class='documenter-source'>source</a><br>

<a id='Base.reverse-Tuple{G<:FatGraphs.ADiGraph}' href='#Base.reverse-Tuple{G<:FatGraphs.ADiGraph}'>#</a>
**`Base.reverse`** &mdash; *Method*.



```
reverse(g::ADiGraph)
```

Produces a graph where all edges are reversed from the original.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L264-L269' class='documenter-source'>source</a><br>

<a id='FatGraphs.add_vertices!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.add_vertices!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.add_vertices!`** &mdash; *Method*.



```
add_vertices!(g, n)
```

Add `n` new vertices to the graph `g`. Returns the final number of vertices.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L20-L25' class='documenter-source'>source</a><br>

<a id='FatGraphs.adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.adjlist`** &mdash; *Method*.



```
adjlist(g)
```

Returns the adjacency list of a graph (a vector of vector of ints). It is equivalent to  [`out_adjlist(g)`](core.md#FatGraphs.out_adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}).

NOTE: For most graph types it returns a reference, not a copy, therefore the returned object should not be modified.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L8-L16' class='documenter-source'>source</a><br>

<a id='FatGraphs.all_edges-Tuple{FatGraphs.AGraph,Any}' href='#FatGraphs.all_edges-Tuple{FatGraphs.AGraph,Any}'>#</a>
**`FatGraphs.all_edges`** &mdash; *Method*.



```
all_edges(g, v)
```

Iterates over all in and out edges of vertex `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L255-L259' class='documenter-source'>source</a><br>

<a id='FatGraphs.all_neighbors-Tuple{FatGraphs.AGraph,Any}' href='#FatGraphs.all_neighbors-Tuple{FatGraphs.AGraph,Any}'>#</a>
**`FatGraphs.all_neighbors`** &mdash; *Method*.



```
all_neighbors(g, v)
```

Iterates over all distinct in/out neighbors of vertex `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L95-L99' class='documenter-source'>source</a><br>

<a id='FatGraphs.clean_vertex!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.clean_vertex!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.clean_vertex!`** &mdash; *Method*.



```
clean_vertex!(g, v)
```

Remove all incident edges on vertex `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L115-L119' class='documenter-source'>source</a><br>

<a id='FatGraphs.degree-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.degree-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.degree`** &mdash; *Method*.



```
degree(g, v)
```

Return the number of edges  from the vertex `v`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L72-L76' class='documenter-source'>source</a><br>

<a id='FatGraphs.density-Tuple{FatGraphs.AGraph}' href='#FatGraphs.density-Tuple{FatGraphs.AGraph}'>#</a>
**`FatGraphs.density`** &mdash; *Method*.



```
density(g)
```

Density is defined as the ratio of the number of actual edges to the number of possible edges. This is $|v| |v-1|$ for directed graphs and $(|v| |v-1|) / 2$ for undirected graphs.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L105-L111' class='documenter-source'>source</a><br>

<a id='FatGraphs.edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.edges`** &mdash; *Method*.



```
edges(g, v)
```

Returns an iterator to the edges in `g` coming from vertex `v`. `v == src(e)` for each returned edge `e`.

It is equivalent to [`out_edges`](core.md#FatGraphs.out_edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}).

For digraphs, use [`all_edges`](core.md#FatGraphs.all_edges-Tuple{FatGraphs.AGraph,Any}) to iterate over both in and out edges.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L242-L252' class='documenter-source'>source</a><br>

<a id='FatGraphs.has_edge-Tuple{FatGraphs.AGraph,Any,Any}' href='#FatGraphs.has_edge-Tuple{FatGraphs.AGraph,Any,Any}'>#</a>
**`FatGraphs.has_edge`** &mdash; *Method*.



```
has_edge(g, e)
has_edge(g, u, v)
```

Returns true if the graph `g` has an edge `e` (from `u` to `v`).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L203-L208' class='documenter-source'>source</a><br>

<a id='FatGraphs.has_vertex-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.has_vertex-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.has_vertex`** &mdash; *Method*.



```
has_vertex(g, v)
```

Return true if `v` is a vertex of `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L34-L38' class='documenter-source'>source</a><br>

<a id='FatGraphs.in_adjlist-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.in_adjlist-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.in_adjlist`** &mdash; *Method*.



```
in_adjlist(g)
```

Returns the backward adjacency list of a graph. For each vertex the vector of neighbors though incoming edges.

```
in_adjlist(g) == [collect(in_neighbors(i)) for i=1:nv(g)]
```

It is the same as [`adjlist`](core.md#FatGraphs.adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}) and [`out_adjlist`](core.md#FatGraphs.out_adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}) for undirected graphs.

NOTE: returns a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L169-L182' class='documenter-source'>source</a><br>

<a id='FatGraphs.in_degree-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.in_degree-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.in_degree`** &mdash; *Method*.



```
in_degree(g, v)
```

Returns the number of edges which start at vertex `v`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L58-L62' class='documenter-source'>source</a><br>

<a id='FatGraphs.in_edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.in_edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.in_edges`** &mdash; *Method*.



```
in_edges(g, v)
```

Returns an iterator to the edges in `g` going to vertex `v`. `v == dst(e)` for each returned edge `e`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L226-L231' class='documenter-source'>source</a><br>

<a id='FatGraphs.is_directed-Tuple{FatGraphs.AGraph}' href='#FatGraphs.is_directed-Tuple{FatGraphs.AGraph}'>#</a>
**`FatGraphs.is_directed`** &mdash; *Method*.



```
is_directed(g)
```

Check if `g` a graph with directed edges.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L48-L52' class='documenter-source'>source</a><br>

<a id='FatGraphs.neighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.neighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.neighbors`** &mdash; *Method*.



```
neighbors(g, v)
```

Returns a list of all neighbors from vertex `v` in `g`.

For directed graph, this is equivalent to [`out_neighbors`](core.md#FatGraphs.out_neighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any})(g, v).

NOTE: it may return a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L83-L91' class='documenter-source'>source</a><br>

<a id='FatGraphs.out_adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.out_adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.out_adjlist`** &mdash; *Method*.



```
out_adjlist(g)
```

Returns the forward adjacency list of a graph, i.e. a vector of vectors containing for each vertex the neighbors trhough outgoing edges.

```
out_adjlist(g) == [collect(out_neighbors(i)) for i=1:nv(g)]
```

The adjacency list is be pre-calculated for most graph types. It is the same as [`adjlist`](core.md#FatGraphs.adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}) and [`in_adjlist`](core.md#FatGraphs.in_adjlist-Tuple{FatGraphs.ADiGraph}) for undirected graphs and the same as [`adjlist`](core.md#FatGraphs.adjlist-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}) for directed ones.

NOTE: It may return a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L185-L199' class='documenter-source'>source</a><br>

<a id='FatGraphs.out_degree-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.out_degree-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.out_degree`** &mdash; *Method*.



```
out_degree(g, v)
```

Returns the number of edges which end at vertex `v`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L65-L69' class='documenter-source'>source</a><br>

<a id='FatGraphs.out_edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}' href='#FatGraphs.out_edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any}'>#</a>
**`FatGraphs.out_edges`** &mdash; *Method*.



```
out_edges(g, v)
```

Returns an iterator to the edges in `g` coming from vertex `v`. `v == src(e)` for each returned edge `e`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L234-L239' class='documenter-source'>source</a><br>

<a id='FatGraphs.rebuild!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.rebuild!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.rebuild!`** &mdash; *Method*.



```
rebuild!(g)
```

Check and restore the structure of `g`, which could be corrupted by the use of unsafe functions (e. g. [`unsafe_add_edge!`](core.md#FatGraphs.unsafe_add_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}))


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L306-L311' class='documenter-source'>source</a><br>

<a id='FatGraphs.unsafe_add_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}' href='#FatGraphs.unsafe_add_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}'>#</a>
**`FatGraphs.unsafe_add_edge!`** &mdash; *Method*.



```
unsafe_add_edge!(g, u, v)
```

Possibly faster and unsafer version of [`add_edge!`](core.md#FatGraphs.add_edge!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Any,Any}), which doesn't guarantee some graph invariant properties.

For example, some graph types (e.g. `Graph`) assume sorted adjacency lists as members. In this case order is not preserved while inserting new edges, resulting in a faster construction of the graph. As a consequence though, some functions such `has_edge(g, u, v)` could give incorrect results.

To restore the correct behaviour, call [`rebuild!`](core.md#FatGraphs.rebuild!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})(g) after the last call to `unsafe_add_edge!`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L289-L302' class='documenter-source'>source</a><br>

<a id='FatGraphs.vertices-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.vertices-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.vertices`** &mdash; *Method*.



```
vertices(g)
```

Returns an iterator to the vertices of a graph (i.e. 1:nv(g))


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/core.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='FatGraphs.Edge' href='#FatGraphs.Edge'>#</a>
**`FatGraphs.Edge`** &mdash; *Type*.



```
immutable Edge
    src::Int
    dst::Int
end
```

A type representing an edge between two vertices of a graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/edge.jl#L21-L28' class='documenter-source'>source</a><br>

<a id='Base.reverse-Tuple{FatGraphs.Edge}' href='#Base.reverse-Tuple{FatGraphs.Edge}'>#</a>
**`Base.reverse`** &mdash; *Method*.



```
reverse(e::Edge)
```

Swap `e.src` and `e.dst`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/edge.jl#L52-L56' class='documenter-source'>source</a><br>

<a id='FatGraphs.is_ordered-Tuple{FatGraphs.AEdge}' href='#FatGraphs.is_ordered-Tuple{FatGraphs.AEdge}'>#</a>
**`FatGraphs.is_ordered`** &mdash; *Method*.



```
is_ordered(e)
```

Returns  `src(e) <= dst(e)`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/edge.jl#L4-L8' class='documenter-source'>source</a><br>

<a id='FatGraphs.edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.edges-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.edges`** &mdash; *Method*.



```
edges(g)
```

Returns an iterator to the edges of a graph `g`. The returned iterator is invalidated by changes to `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/edgeiter.jl#L69-L74' class='documenter-source'>source</a><br>

<a id='FatGraphs.common_inneighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}' href='#FatGraphs.common_inneighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}'>#</a>
**`FatGraphs.common_inneighbors`** &mdash; *Method*.



```
common_inneighbors(g, u, v)
```

Returns the inneighbors common to vertices `u` and `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L57-L61' class='documenter-source'>source</a><br>

<a id='FatGraphs.common_neighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}' href='#FatGraphs.common_neighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}'>#</a>
**`FatGraphs.common_neighbors`** &mdash; *Method*.



```
common_neighbors(g, u, v)
```

Returns the neighbors common to vertices `u` and `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L51-L55' class='documenter-source'>source</a><br>

<a id='FatGraphs.common_outneighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}' href='#FatGraphs.common_outneighbors-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}'>#</a>
**`FatGraphs.common_outneighbors`** &mdash; *Method*.



```
common_outneighbors(g, u, v)
```

Returns the outneighbors common to vertices `u` and `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L63-L67' class='documenter-source'>source</a><br>

<a id='FatGraphs.degree_histogram-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.degree_histogram-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.degree_histogram`** &mdash; *Method*.



```
degree_histogram(g)
```

Returns a `StatsBase.Histogram` of the degrees of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L44-L48' class='documenter-source'>source</a><br>

<a id='FatGraphs.has_self_loops-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.has_self_loops-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.has_self_loops`** &mdash; *Method*.



```
has_self_loops(g)
```

Returns true if `g` has any self loops.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L70-L74' class='documenter-source'>source</a><br>

<a id='FatGraphs.isgraphical-Tuple{Array{Int64,1}}' href='#FatGraphs.isgraphical-Tuple{Array{Int64,1}}'>#</a>
**`FatGraphs.isgraphical`** &mdash; *Method*.



```
isgraphical(degs::Vector{Int})
```

Check whether the degree sequence `degs` is graphical, according to [Erdös-Gallai condition](http://mathworld.wolfram.com/GraphicSequence.html).

Time complexity: O(length(degs)^2)


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L1-L8' class='documenter-source'>source</a><br>

<a id='FatGraphs.num_self_loops-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.num_self_loops-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.num_self_loops`** &mdash; *Method*.



```
num_self_loops(g)
```

Returns the number of self loops in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L77-L81' class='documenter-source'>source</a><br>

<a id='FatGraphs.Δ-Tuple{Any}' href='#FatGraphs.Δ-Tuple{Any}'>#</a>
**`FatGraphs.Δ`** &mdash; *Method*.



Return the maximum `degree` of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L29' class='documenter-source'>source</a><br>

<a id='FatGraphs.Δin-Tuple{Any}' href='#FatGraphs.Δin-Tuple{Any}'>#</a>
**`FatGraphs.Δin`** &mdash; *Method*.



Return the minimum `in_degree` of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L25' class='documenter-source'>source</a><br>

<a id='FatGraphs.Δout-Tuple{Any}' href='#FatGraphs.Δout-Tuple{Any}'>#</a>
**`FatGraphs.Δout`** &mdash; *Method*.



Return the maximum `out_degree` of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L19' class='documenter-source'>source</a><br>

<a id='FatGraphs.δ-Tuple{Any}' href='#FatGraphs.δ-Tuple{Any}'>#</a>
**`FatGraphs.δ`** &mdash; *Method*.



Return the minimum `degree` of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L27' class='documenter-source'>source</a><br>

<a id='FatGraphs.δin-Tuple{Any}' href='#FatGraphs.δin-Tuple{Any}'>#</a>
**`FatGraphs.δin`** &mdash; *Method*.



Return the maximum `in_degree` of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L23' class='documenter-source'>source</a><br>

<a id='FatGraphs.δout-Tuple{Any}' href='#FatGraphs.δout-Tuple{Any}'>#</a>
**`FatGraphs.δout`** &mdash; *Method*.



Return the minimum `out_degree` of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/core/misc.jl#L21' class='documenter-source'>source</a><br>

