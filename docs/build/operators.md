
<a id='Operators-1'></a>

# Operators


*FatGraphs.jl* implements the following graph operators:

- [`Base.SparseArrays.blkdiag`](operators.md#Base.SparseArrays.blkdiag-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})
- [`Base.intersect`](operators.md#Base.intersect-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})
- [`Base.join`](operators.md#Base.join-Tuple{FatGraphs.AGraph,FatGraphs.AGraph})
- [`Base.union`](operators.md#Base.union-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})
- [`FatGraphs.cartesian_product`](operators.md#FatGraphs.cartesian_product-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})
- [`FatGraphs.complement`](operators.md#FatGraphs.complement-Tuple{T<:FatGraphs.AGraph})
- [`FatGraphs.complete`](operators.md#FatGraphs.complete-Tuple{FatGraphs.ADiGraph})
- [`FatGraphs.complete!`](operators.md#FatGraphs.complete!-Tuple{FatGraphs.ADiGraph})
- [`FatGraphs.crosspath`](operators.md#FatGraphs.crosspath-Tuple{Integer,G<:FatGraphs.AGraph})
- [`FatGraphs.difference`](operators.md#FatGraphs.difference-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})
- [`FatGraphs.egonet`](operators.md#FatGraphs.egonet-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64})
- [`FatGraphs.subgraph`](operators.md#FatGraphs.subgraph-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{Int64,1}})
- [`FatGraphs.symmetric_difference`](operators.md#FatGraphs.symmetric_difference-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})
- [`FatGraphs.tensor_product`](operators.md#FatGraphs.tensor_product-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}})

<a id='Base.SparseArrays.blkdiag-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#Base.SparseArrays.blkdiag-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`Base.SparseArrays.blkdiag`** &mdash; *Method*.



```
blkdiag(g, h)
```

Produces a graph with $|V(g)| + |V(h)|$ vertices and $|E(g)| + |E(h)|$ edges.

Put simply, the vertices and edges from graph `h` are appended to graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L88-L95' class='documenter-source'>source</a><br>

<a id='Base.intersect-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#Base.intersect-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`Base.intersect`** &mdash; *Method*.



```
intersect(g, h)
```

Produces a graph with edges that are only in both graph `g` and graph `h`.

Note that this function may produce a graph with 0-degree vertices.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L108-L114' class='documenter-source'>source</a><br>

<a id='Base.join-Tuple{FatGraphs.AGraph,FatGraphs.AGraph}' href='#Base.join-Tuple{FatGraphs.AGraph,FatGraphs.AGraph}'>#</a>
**`Base.join`** &mdash; *Method*.



```
join(g, h)
```

Merges graphs `g` and `h` using `blkdiag` and then adds all the edges between  the vertices in `g` and those in `h`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L166-L171' class='documenter-source'>source</a><br>

<a id='Base.union-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#Base.union-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`Base.union`** &mdash; *Method*.



```
union(g, h)
```

Merges graphs `g` and `h` by taking the set union of all vertices and edges.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L70-L74' class='documenter-source'>source</a><br>

<a id='FatGraphs.cartesian_product-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.cartesian_product-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.cartesian_product`** &mdash; *Method*.



```
cartesian_product(g, h)
```

Returns the (cartesian product)[https://en.wikipedia.org/wiki/Tensor_product_of_graphs] of `g` and `h`


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L191-L195' class='documenter-source'>source</a><br>

<a id='FatGraphs.complement-Tuple{T<:FatGraphs.AGraph}' href='#FatGraphs.complement-Tuple{T<:FatGraphs.AGraph}'>#</a>
**`FatGraphs.complement`** &mdash; *Method*.



```
complement(g)
```

Produces the [graph complement](https://en.wikipedia.org/wiki/Complement_graph) of a graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L38-L43' class='documenter-source'>source</a><br>

<a id='FatGraphs.complete!-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.complete!-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.complete!`** &mdash; *Method*.



```
complete(g::ADiGraph)
```

Returns a digraph containing both the edges `(u,v)` of `g` and their reverse `(v,u)`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L13-L18' class='documenter-source'>source</a><br>

<a id='FatGraphs.complete-Tuple{FatGraphs.ADiGraph}' href='#FatGraphs.complete-Tuple{FatGraphs.ADiGraph}'>#</a>
**`FatGraphs.complete`** &mdash; *Method*.



```
complete(g::ADiGraph)
```

Returns a digraph containing both the edges `(u,v)` of `g` and their reverse `(v,u)`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L1-L6' class='documenter-source'>source</a><br>

<a id='FatGraphs.crosspath-Tuple{Integer,G<:FatGraphs.AGraph}' href='#FatGraphs.crosspath-Tuple{Integer,G<:FatGraphs.AGraph}'>#</a>
**`FatGraphs.crosspath`** &mdash; *Method*.



```
crosspath(len::Integer, g::AGraph)
```

Replicate `len` times `h` and connect each vertex with its copies in a path


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L183-L187' class='documenter-source'>source</a><br>

<a id='FatGraphs.difference-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.difference-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.difference`** &mdash; *Method*.



```
difference(g, h)
```

Produces a graph with edges in graph `g` that are not in graph `h`.

Note that this function may produce a graph with 0-degree vertices.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L126-L132' class='documenter-source'>source</a><br>

<a id='FatGraphs.egonet-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}' href='#FatGraphs.egonet-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}'>#</a>
**`FatGraphs.egonet`** &mdash; *Method*.



```
egonet(g, v::Int, d::Int; dir=:out)
```

Returns the subgraph of `g` induced by the neighbors of `v` up to distance `d`. If `g` is a `DiGraph` the `dir` optional argument specifies the edge direction the edge direction with respect to `v` (i.e. `:in` or `:out`) to be considered. This is equivalent to [`subgraph`](operators.md#FatGraphs.subgraph-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{Int64,1}})`(g, neighborhood(g, v, d, dir=dir))[1].`


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L318-L325' class='documenter-source'>source</a><br>

<a id='FatGraphs.subgraph-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{Int64,1}}' href='#FatGraphs.subgraph-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},AbstractArray{Int64,1}}'>#</a>
**`FatGraphs.subgraph`** &mdash; *Method*.



```
subgraph(g, vlist)
```

Returns the subgraph of `g` induced by the vertices in  `vlist`.

The returned graph has `length(vlist)` vertices, with the new vertex `i` corresponding to the vertex of the original graph in the `i`-th position of `vlist`.

Returns  also a vector `vmap` mapping the new vertices to the old ones: the  vertex `i` in the subgraph corresponds to the vertex `vmap[i]` in `g`.

```
subgraph(g, elist)
```

Returns the subgraph of `g` induced by the edges in `elist`, along with the associated vector `vmap` mapping new vertices to the old ones.

**Usage Examples:**

```julia
g = CompleteGraph(10)
sg, vmap = subgraph(g, 5:8)
@assert g[5:8] == sg
@assert nv(sg) == 4
@assert ne(sg) == 6
@assert vm[4] == 8

sg, vmap = subgraph(g, [2,8,3,4])
@asssert sg == g[[2,8,3,4]]

elist = [Edge(1,2), Edge(3,4), Edge(4,8)]
sg, vmap = subgraph(g, elist)
@asssert sg == g[elist]
```


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L232-L267' class='documenter-source'>source</a><br>

<a id='FatGraphs.symmetric_difference-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.symmetric_difference-Tuple{T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},T<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.symmetric_difference`** &mdash; *Method*.



```
symmetric_difference(g, h)
```

Produces a graph with edges from graph `g` that do not exist in graph `h`, and vice versa.

Note that this function may produce a graph with 0-degree vertices.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L144-L151' class='documenter-source'>source</a><br>

<a id='FatGraphs.tensor_product-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.tensor_product-Tuple{G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph},G<:Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.tensor_product`** &mdash; *Method*.



```
tensor_product(g, h)
```

Returns the (tensor product)[https://en.wikipedia.org/wiki/Tensor_product_of_graphs] of `g` and `h`


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/operators/operators.jl#L213-L217' class='documenter-source'>source</a><br>

