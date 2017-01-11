
<a id='Linear-Algebra-1'></a>

# Linear Algebra


*FatGraphs.jl* provides the following matrix operations on both directed and undirected graphs:

<a id='FatGraphs.adjacency_matrix' href='#FatGraphs.adjacency_matrix'>#</a>
**`FatGraphs.adjacency_matrix`** &mdash; *Function*.



```
adjacency_matrix(g, dir=:out, T::DataType=Int)
```

Returns a sparse boolean adjacency matrix for a graph, indexed by `[u, v]` vertices. `true` values indicate an edge between `u` and `v`. Users may specify a direction (`:in`, `:out`, or `:all` are currently supported; `:out` is default for both directed and undirected graphs) and a data type for the matrix (defaults to `Int`).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/linalg/spectral.jl#L9-L17' class='documenter-source'>source</a><br>

<a id='FatGraphs.adjacency_spectrum' href='#FatGraphs.adjacency_spectrum'>#</a>
**`FatGraphs.adjacency_spectrum`** &mdash; *Function*.



Returns the eigenvalues of the adjacency matrix for a graph `g`, indexed by vertex. Warning: Converts the matrix to dense with $nv^2$ memory usage. Use `eigs(adjacency_matrix(g);kwargs...)` to compute some of the eigenvalues/eigenvectors. Default values for `dir` and `T` are the same as `adjacency_matrix`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/linalg/spectral.jl#L89-L95' class='documenter-source'>source</a><br>

<a id='FatGraphs.incidence_matrix' href='#FatGraphs.incidence_matrix'>#</a>
**`FatGraphs.incidence_matrix`** &mdash; *Function*.



```
incidence_matrix(g::ASimpleGraph, T::DataType=Int; oriented=false)
```

Returns a sparse node-arc incidence matrix for a graph, indexed by `[v, i]`, where `i` is in `1:ne(g)`, indexing an edge `e`. For directed graphs, a value of `-1` indicates that `src(e) == v`, while a value of `1` indicates that `dst(e) == v`. Otherwise, the value is `0`.

For undirected graphs, both entries are `1` if `oriented=false`, otherwise `[v, i] -> -1` and `[u, i] -> 1` if `v < u`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/linalg/spectral.jl#L100-L111' class='documenter-source'>source</a><br>

<a id='FatGraphs.laplacian_matrix' href='#FatGraphs.laplacian_matrix'>#</a>
**`FatGraphs.laplacian_matrix`** &mdash; *Function*.



```
laplacian_matrix(g, dir::Symbol=:out, T::DataType=Int)
```

Returns a sparse [Laplacian matrix](https://en.wikipedia.org/wiki/Laplacian_matrix) for a graph `g`, indexed by `[u, v]` vertices. `dir` has to be `:in, :out` or `:all`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/linalg/spectral.jl#L66-L71' class='documenter-source'>source</a><br>

<a id='FatGraphs.laplacian_spectrum' href='#FatGraphs.laplacian_spectrum'>#</a>
**`FatGraphs.laplacian_spectrum`** &mdash; *Function*.



```
laplacian_spectrum(g, dir::Symbol=:out, T::DataType=Int)
```

Returns the eigenvalues of the Laplacian matrix for a graph `g`, indexed by vertex. Warning: Converts the matrix to dense with $nv^2$ memory usage. Use `eigs(laplacian_matrix(g);  kwargs...)` to compute some of the eigenvalues/eigenvectors. Default values for `dir` and `T` are the same as `laplacian_matrix`. `dir` has to be `:in, :out` or `:all`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/linalg/spectral.jl#L78-L86' class='documenter-source'>source</a><br>

<a id='FatGraphs.spectral_distance-Tuple{FatGraphs.AGraph,FatGraphs.AGraph,Integer}' href='#FatGraphs.spectral_distance-Tuple{FatGraphs.AGraph,FatGraphs.AGraph,Integer}'>#</a>
**`FatGraphs.spectral_distance`** &mdash; *Method*.



```
spectral_distance(G₁, G₂ [, k])
```

Compute the spectral distance between undirected n-vertex graphs G₁ and G₂ using the top k ≤ n greatest eigenvalues. If k is ommitted, uses full spectrum.

For further details, please refer to:

JOVANOVIC, I.; STANIC, Z., 2014. Spectral Distances of Graphs Based on their Different Matrix Representations


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/linalg/spectral.jl#L139-L150' class='documenter-source'>source</a><br>

