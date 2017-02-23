
<a id='Operators-1'></a>

# Operators


*Erdos.jl* implements the following graph operators:

- [`Base.SparseArrays.blkdiag`](operators.md#Base.SparseArrays.blkdiag-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Base.intersect`](operators.md#Base.intersect-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Base.join`](operators.md#Base.join-Tuple{Erdos.AGraph,Erdos.AGraph})
- [`Base.union`](operators.md#Base.union-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.cartesian_product`](operators.md#Erdos.cartesian_product-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},G<:Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.complement`](operators.md#Erdos.complement-Tuple{T<:Erdos.AGraph})
- [`Erdos.complete`](operators.md#Erdos.complete-Tuple{Erdos.ADiGraph})
- [`Erdos.complete!`](operators.md#Erdos.complete!-Tuple{Erdos.ADiGraph})
- [`Erdos.crosspath`](operators.md#Erdos.crosspath-Tuple{Integer,G<:Erdos.AGraph})
- [`Erdos.difference`](operators.md#Erdos.difference-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.egonet`](operators.md#Erdos.egonet-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer,Integer})
- [`Erdos.subgraph`](operators.md#Erdos.subgraph-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},AbstractArray{V<:Integer,1}})
- [`Erdos.symmetric_difference`](operators.md#Erdos.symmetric_difference-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}})
- [`Erdos.tensor_product`](operators.md#Erdos.tensor_product-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},G<:Union{Erdos.ADiGraph,Erdos.AGraph}})

<a id='Base.SparseArrays.blkdiag-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Base.SparseArrays.blkdiag-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Base.SparseArrays.blkdiag`** &mdash; *Method*.



```
blkdiag(g, h)
```

Produces a graph with $|V(g)| + |V(h)|$ vertices and $|E(g)| + |E(h)|$ edges.

Put simply, the vertices and edges from graph `h` are appended to graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L79-L86' class='documenter-source'>source</a><br>

<a id='Base.intersect-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Base.intersect-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Base.intersect`** &mdash; *Method*.



```
intersect(g, h)
```

Produces a graph with edges that are only in both graph `g` and graph `h`.

Note that this function may produce a graph with 0-degree vertices.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L99-L105' class='documenter-source'>source</a><br>

<a id='Base.join-Tuple{Erdos.AGraph,Erdos.AGraph}' href='#Base.join-Tuple{Erdos.AGraph,Erdos.AGraph}'>#</a>
**`Base.join`** &mdash; *Method*.



```
join(g, h)
```

Merges graphs `g` and `h` using `blkdiag` and then adds all the edges between  the vertices in `g` and those in `h`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L157-L162' class='documenter-source'>source</a><br>

<a id='Base.union-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Base.union-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Base.union`** &mdash; *Method*.



```
union(g, h)
```

Merges graphs `g` and `h` by taking the set union of all vertices and edges.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L61-L65' class='documenter-source'>source</a><br>

<a id='Erdos.cartesian_product-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},G<:Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.cartesian_product-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},G<:Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.cartesian_product`** &mdash; *Method*.



```
cartesian_product(g, h)
```

Returns the (cartesian product)[https://en.wikipedia.org/wiki/Tensor_product_of_graphs] of `g` and `h`


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L182-L186' class='documenter-source'>source</a><br>

<a id='Erdos.complement-Tuple{T<:Erdos.AGraph}' href='#Erdos.complement-Tuple{T<:Erdos.AGraph}'>#</a>
**`Erdos.complement`** &mdash; *Method*.



```
complement(g)
```

Produces the [graph complement](https://en.wikipedia.org/wiki/Complement_graph) of a graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L29-L34' class='documenter-source'>source</a><br>

<a id='Erdos.complete!-Tuple{Erdos.ADiGraph}' href='#Erdos.complete!-Tuple{Erdos.ADiGraph}'>#</a>
**`Erdos.complete!`** &mdash; *Method*.



```
complete!(g::ADiGraph)
```

Returns a digraph containing both the edges `(u,v)` of `g` and their reverse `(v,u)`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L13-L18' class='documenter-source'>source</a><br>

<a id='Erdos.complete-Tuple{Erdos.ADiGraph}' href='#Erdos.complete-Tuple{Erdos.ADiGraph}'>#</a>
**`Erdos.complete`** &mdash; *Method*.



```
complete(g::ADiGraph)
```

Returns a digraph containing both the edges `(u,v)` of `g` and their reverse `(v,u)`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L1-L6' class='documenter-source'>source</a><br>

<a id='Erdos.crosspath-Tuple{Integer,G<:Erdos.AGraph}' href='#Erdos.crosspath-Tuple{Integer,G<:Erdos.AGraph}'>#</a>
**`Erdos.crosspath`** &mdash; *Method*.



```
crosspath(len::Integer, g::AGraph)
```

Replicate `len` times `h` and connect each vertex with its copies in a path


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L174-L178' class='documenter-source'>source</a><br>

<a id='Erdos.difference-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.difference-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.difference`** &mdash; *Method*.



```
difference(g, h)
```

Produces a graph with edges in graph `g` that are not in graph `h`.

Note that this function may produce a graph with 0-degree vertices.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L117-L123' class='documenter-source'>source</a><br>

<a id='Erdos.egonet-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer,Integer}' href='#Erdos.egonet-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Integer,Integer}'>#</a>
**`Erdos.egonet`** &mdash; *Method*.



```
egonet(g, v::Int, d::Int; dir=:out)
```

Returns the subgraph of `g` induced by the neighbors of `v` up to distance `d`. If `g` is a `DiGraph` the `dir` optional argument specifies the edge direction the edge direction with respect to `v` (i.e. `:in` or `:out`) to be considered. This is equivalent to [`subgraph`](operators.md#Erdos.subgraph-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},AbstractArray{V<:Integer,1}})`(g, neighborhood(g, v, d, dir=dir))[1].`


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L310-L317' class='documenter-source'>source</a><br>

<a id='Erdos.subgraph-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},AbstractArray{V<:Integer,1}}' href='#Erdos.subgraph-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},AbstractArray{V<:Integer,1}}'>#</a>
**`Erdos.subgraph`** &mdash; *Method*.



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


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L223-L258' class='documenter-source'>source</a><br>

<a id='Erdos.symmetric_difference-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.symmetric_difference-Tuple{T<:Union{Erdos.ADiGraph,Erdos.AGraph},T<:Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.symmetric_difference`** &mdash; *Method*.



```
symmetric_difference(g, h)
```

Produces a graph with edges from graph `g` that do not exist in graph `h`, and vice versa.

Note that this function may produce a graph with 0-degree vertices.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L135-L142' class='documenter-source'>source</a><br>

<a id='Erdos.tensor_product-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},G<:Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.tensor_product-Tuple{G<:Union{Erdos.ADiGraph,Erdos.AGraph},G<:Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.tensor_product`** &mdash; *Method*.



```
tensor_product(g, h)
```

Returns the (tensor product)[https://en.wikipedia.org/wiki/Tensor_product_of_graphs] of `g` and `h`


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/operators/operators.jl#L204-L208' class='documenter-source'>source</a><br>

