
<a id='Types-and-Constructors-1'></a>

# Types and Constructors


*Erdos.jl* defines the following basic types and functionalities.


<a id='Abstract-Types-1'></a>

## Abstract Types

<a id='Erdos.AGraph' href='#Erdos.AGraph'>#</a>
**`Erdos.AGraph`** &mdash; *Type*.



```
abstract AGraph
```

Abstract undirected graph type


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='Erdos.ADiGraph' href='#Erdos.ADiGraph'>#</a>
**`Erdos.ADiGraph`** &mdash; *Type*.



```
abstract ADiGraph
```

Abstract directed graph type


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L8-L12' class='documenter-source'>source</a><br>

<a id='Erdos.ASimpleGraph' href='#Erdos.ASimpleGraph'>#</a>
**`Erdos.ASimpleGraph`** &mdash; *Constant*.



```
typealias ASimpleGraph Union{AGraph, ADiGraph}
```

Union of [`AGraph`](types.md#Erdos.AGraph) and [`ADiGraph`](types.md#Erdos.ADiGraph).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L15-L19' class='documenter-source'>source</a><br>

<a id='Erdos.AEdge' href='#Erdos.AEdge'>#</a>
**`Erdos.AEdge`** &mdash; *Type*.



```
abstract AEdge
```

An abstract edge type.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L139-L143' class='documenter-source'>source</a><br>


<a id='Graph-/-DiGraph-/-Edge-1'></a>

## Graph / DiGraph / Edge

<a id='Erdos.Graph' href='#Erdos.Graph'>#</a>
**`Erdos.Graph`** &mdash; *Type*.



```
type Graph{T<:Integer} <: AGraph
    ne::Int
    fadjlist::Vector{Vector{T}}
end
```

A simple graph type based on an adjacency list.

```
Graph{T}(n=0)
Graph(n=0) = Graph{Int}(n)
```

Construct a `Graph` with `n` vertices and no edges.

```
Graph{T}(adjmx::AbstractMatrix)
Graph(adjmx::AbstractMatrix) = Graph{Int}(adjmx)
```

Construct a `Graph{T}` from the adjacency matrix `adjmx`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/factory/graph.jl#L2-L19' class='documenter-source'>source</a><br>

<a id='Erdos.DiGraph' href='#Erdos.DiGraph'>#</a>
**`Erdos.DiGraph`** &mdash; *Type*.



```
type DiGraph{T<:Integer} <: ADiGraph
    ne::Int
    fadjlist::Vector{Vector{T}}
    badjlist::Vector{Vector{T}}
end
```

A simple digraph type based on two adjacency lists (forward and backward).

```
DiGraph{T}(n=0)
DiGraph(n=0) = DiGraph{Int}(n)
```

Construct a `DiGraph` with `n` vertices and no edges.

```
DiGraph{T}(adjmx::AbstractMatrix)
DiGraph(adjmx::AbstractMatrix) = DiGraph{Int}(adjmx)
```

Construct a `DiGraph` from the adjacency matrix `adjmx`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/factory/graph.jl#L52-L70' class='documenter-source'>source</a><br>

<a id='Erdos.Edge' href='#Erdos.Edge'>#</a>
**`Erdos.Edge`** &mdash; *Type*.



```
immutable Edge
    src::Int
    dst::Int
end
```

A type representing an edge between two vertices of a graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/edge.jl#L21-L28' class='documenter-source'>source</a><br>


<a id='GTGraph-/-GTDiGraph-/-GTEdge-1'></a>

## GTGraph / GTDiGraph / GTEdge

<a id='Erdos.GTGraph' href='#Erdos.GTGraph'>#</a>
**`Erdos.GTGraph`** &mdash; *Type*.



```
type GTGraph <: AGraph
    ne::Int
    edge_index_range::Int
    out_edges::Vector{Vector{Pair{Int,Int}}}  #unordered adjlist
    keep_epos::Bool                # keep updated epos
    epos::Vector{Pair{Int,Int}}    # position of the edge in out_edges
    free_indexes::Vector{Int}       # indexes of deleted edges to be used up
                                    # for new edges to avoid very large
                                    # indexes, and unnecessary property map
                                    # memory use
end
```

A type representing an directed graph with indexed edges.

```
GTDiGraph(n=0)
```

Construct a `GTDiGraph` with `n` vertices and no edges.

```
GTDiGraph(adjmx::AbstractMatrix)
```

Construct a `GTDiGraph` from the adjacency matrix `adjmx`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/factory/gtgraph.jl#L28-L50' class='documenter-source'>source</a><br>

<a id='Erdos.GTDiGraph' href='#Erdos.GTDiGraph'>#</a>
**`Erdos.GTDiGraph`** &mdash; *Type*.



```
type GTDiGraph <: ADiGraph
    ne::Int
    edge_index_range::Int
    out_edges::Vector{Vector{Pair{Int,Int}}}  #unordered out_adjlist
    in_edges::Vector{Vector{Pair{Int,Int}}}  #unordered in_adjlist
    keep_epos::Bool               # keep updated epos
    epos::Vector{Pair{Int,Int}}    # position of the edge in out_edges
    free_indexes::Vector{Int}       # indexes of deleted edges to be used up
                                    # for new edges to avoid very large
                                    # indexes, and unnecessary property map
                                    # memory use
end
```

A type representing an directed graph with indexed edges.

```
GTDiGraph(n=0)
```

Construct a `GTDiGraph` with `n` vertices and no edges.

```
GTDiGraph(adjmx::AbstractMatrix)
```

Construct a `GTDiGraph` from the adjacency matrix `adjmx`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/factory/gtgraph.jl#L63-L87' class='documenter-source'>source</a><br>

<a id='Erdos.GTEdge' href='#Erdos.GTEdge'>#</a>
**`Erdos.GTEdge`** &mdash; *Type*.



```
immutable GTEdge <: AEdge
    src::Int
    dst::Int
    idx::Int
end
```

An indexed edge type

```
GTEdge(u, v) = GTEdge(u,v,-1)
```

Creates an edge with unvalid index.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/factory/gtgraph.jl#L1-L13' class='documenter-source'>source</a><br>


<a id='Defining-new-types-1'></a>

## Defining new types


In order to define a custom graph type, e.g. `MyGraph <: AGraph`, some guarantee have to be respected and some method have to be exposed. Take a look to the files in `src/factory/` for some examples. Custom edges, e.g. `MyEdge <: AEdge`,  have to expose `src(e)` and `dst(e)` methods.


**Guarantees**:


  * vertices are integers in 1:nv(g)


**Mandatory methods**:


  * basic constructors (e.g. MyGraph(n), MyGraph())
  * nv(g)
  * ne(g)
  * out_neighbors(g, v)
  * in_neighbors(g, v) #digraph
  * edge(g, u, v)
  * add_edge!(g, u, v)
  * rem_edge!(g, u, v)
  * add_vertex!(g)
  * pop_vertex!(g)
  * graphtype(g)
  * digraphtype(g)
  * edgetype(g)
  * vertextype(g)


Some methods have general fallbacks relying on the more foundamental API described above, but could probably made more efficient knowing the internal implementation of the graph.


**Reccomended overrides**:


  * in_adjlist(g) #digraph
  * out_adjlist(g)
  * has_edge(g, u, v)
  * ==(g, h)
  * out_edges(g, u)
  * in_edges(g, u) # digraph
  * rem_edge!(g, e)
  * graph(dg)
  * digraph(g)
  * reverse!(g) #digraph
  * unsafe_add_edge!(g, u, v)
  * rebuild!(g)
  * rem_vertex!(g, v)

