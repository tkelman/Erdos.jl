
<a id='Linear-Algebra-1'></a>

# Linear Algebra


*Erdos.jl* provides the following matrix operations on both directed and undirected graphs:

<a id='Erdos.adjacency_matrix' href='#Erdos.adjacency_matrix'>#</a>
**`Erdos.adjacency_matrix`** &mdash; *Function*.



```
adjacency_matrix(g, dir=:out, T::DataType=Int)
```

Returns a sparse boolean adjacency matrix for a graph, indexed by `[u, v]` vertices. `true` values indicate an edge between `u` and `v`. Users may specify a direction (`:in`, `:out`, or `:all` are currently supported; `:out` is default for both directed and undirected graphs) and a data type for the matrix (defaults to `Int`).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/linalg/spectral.jl#L9-L17' class='documenter-source'>source</a><br>

<a id='Erdos.incidence_matrix' href='#Erdos.incidence_matrix'>#</a>
**`Erdos.incidence_matrix`** &mdash; *Function*.



```
incidence_matrix(g::ASimpleGraph, T::DataType=Int; oriented=false)
```

Returns a sparse node-arc incidence matrix for a graph, indexed by `[v, i]`, where `i` is in `1:ne(g)`, indexing an edge `e`. For directed graphs, a value of `-1` indicates that `src(e) == v`, while a value of `1` indicates that `dst(e) == v`. Otherwise, the value is `0`.

For undirected graphs, both entries are `1` if `oriented=false`, otherwise `[v, i] -> -1` and `[u, i] -> 1` if `v < u`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/linalg/spectral.jl#L78-L89' class='documenter-source'>source</a><br>

<a id='Erdos.laplacian_matrix' href='#Erdos.laplacian_matrix'>#</a>
**`Erdos.laplacian_matrix`** &mdash; *Function*.



```
laplacian_matrix(g, dir::Symbol=:out, T::DataType=Int)
```

Returns a sparse [Laplacian matrix](https://en.wikipedia.org/wiki/Laplacian_matrix) for a graph `g`, indexed by `[u, v]` vertices. `dir` has to be `:in, :out` or `:all`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/linalg/spectral.jl#L66-L71' class='documenter-source'>source</a><br>

<a id='Erdos.spectral_distance-Tuple{Erdos.AGraph,Erdos.AGraph,Integer}' href='#Erdos.spectral_distance-Tuple{Erdos.AGraph,Erdos.AGraph,Integer}'>#</a>
**`Erdos.spectral_distance`** &mdash; *Method*.



```
spectral_distance(G₁, G₂ [, k])
```

Compute the spectral distance between undirected n-vertex graphs G₁ and G₂ using the top k ≤ n greatest eigenvalues. If k is ommitted, uses full spectrum.

For further details, please refer to:

JOVANOVIC, I.; STANIC, Z., 2014. Spectral Distances of Graphs Based on their Different Matrix Representations


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/linalg/spectral.jl#L117-L128' class='documenter-source'>source</a><br>

<a id='Erdos.Nonbacktracking' href='#Erdos.Nonbacktracking'>#</a>
**`Erdos.Nonbacktracking`** &mdash; *Type*.



Nonbacktracking: a compact representation of the nonbacktracking operator

```
g: the underlying graph
edgeidmap: the association between oriented edges and index into the NBT matrix
```

The Nonbacktracking operator can be used for community detection. This representation is compact in that it uses only ne(g) additional storage and provides an implicit representation of the matrix B_g defined below.

Given two oriented edges i->j and k->l in g, the non-backtraking matrix B is defined as

B[i->j, k->l] = δ(j,k)* (1 - δ(i,l))

This type is in the style of GraphMatrices.jl and supports the necessary operations for computed eigenvectors and conducting linear solves.

Additionally the contract!(vertexspace, nbt, edgespace) method takes vectors represented in the domain of B and represents them in the domain of the adjacency matrix of g.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/linalg/nonbacktracking.jl#L40-L60' class='documenter-source'>source</a><br>

<a id='Erdos.contract-Tuple{Erdos.Nonbacktracking,Array{T,1}}' href='#Erdos.contract-Tuple{Erdos.Nonbacktracking,Array{T,1}}'>#</a>
**`Erdos.contract`** &mdash; *Method*.



contract(nbt, edgespace) Integrates out the edges by summing over the edges incident to each vertex.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/linalg/nonbacktracking.jl#L153-L156' class='documenter-source'>source</a><br>

<a id='Erdos.nonbacktracking_matrix-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.nonbacktracking_matrix-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.nonbacktracking_matrix`** &mdash; *Method*.



Given two oriented edges i->j and k->l in g, the non-backtraking matrix B is defined as

B[i->j, k->l] = δ(j,k)* (1 - δ(i,l))

returns a matrix B, and an edgemap storing the oriented edges' positions in B


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/linalg/nonbacktracking.jl#L1-L8' class='documenter-source'>source</a><br>

