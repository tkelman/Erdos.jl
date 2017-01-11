
<a id='Generators-1'></a>

# Generators


<a id='Random-Graphs-1'></a>

## Random Graphs


*FatGraphs.jl* implements some common random graph generators:

<a id='FatGraphs.barabasi_albert' href='#FatGraphs.barabasi_albert'>#</a>
**`FatGraphs.barabasi_albert`** &mdash; *Function*.



```
barabasi_albert(n, k, G=Graph; seed=-1)
barabasi_albert(n, n0, k, G=Graph; seed=-1)
```

Creates a random graph of type `G` with `n` vertices according to [Barabási–Albert model](https://en.wikipedia.org/wiki/Barab%C3%A1si%E2%80%93Albert_model). It is grown by adding new vertices to an initial graph with `n0` vertices (`n0=k` if not specified). Each new vertex is attached with `k` edges to `k` different vertices already present in the system by preferential attachment. The initial graph is empty by default.

Undirected graphs are created by default. Directed graphs can be created passing a directed graph type as last argument (e.g. `DiGraph`).

See also [`barabasi_albert!`](generators.md#FatGraphs.barabasi_albert!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}) for growing a given graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L138-L151' class='documenter-source'>source</a><br>

<a id='FatGraphs.barabasi_albert!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}' href='#FatGraphs.barabasi_albert!-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Int64,Int64}'>#</a>
**`FatGraphs.barabasi_albert!`** &mdash; *Method*.



```
barabasi_albert!(g, n::Int, k::Int; seed::Int = -1)
```

Grows the graph `g` according to [Barabási–Albert](https://en.wikipedia.org/wiki/Barab%C3%A1si%E2%80%93Albert_model) process into a graph with `n` vertices. At each step a new vertex is attached by preferential attachment to `k` different vertices already present in the graph.

See also [`barabasi_albert`](generators.md#FatGraphs.barabasi_albert).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L162-L171' class='documenter-source'>source</a><br>

<a id='FatGraphs.erdos_renyi' href='#FatGraphs.erdos_renyi'>#</a>
**`FatGraphs.erdos_renyi`** &mdash; *Function*.



```
erdos_renyi(n::Int, p::Real, G=Graph; seed=-1)
erdos_renyi(n::Int, m::Int, G=Graph; seed=-1)
```

Creates an [Erdős–Rényi](http://en.wikipedia.org/wiki/Erdős–Rényi_model) random graph of type `G` with `n` vertices. Edges are added between pairs of vertices with probability `p` in the first method. In the second method `m` edges are randomly chosen insted.

Undirected graphs are created by default. Directed graphs can be created passing a directed graph type as last argument (e.g. `DiGraph`)

Note also that Erdős–Rényi graphs may be generated quickly using `erdos_renyi(n, ne)` or the  `Graph(nv, ne)` constructor, which randomly select `ne` edges among all the potential edges.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L1-L16' class='documenter-source'>source</a><br>

<a id='FatGraphs.random_configuration_model' href='#FatGraphs.random_configuration_model'>#</a>
**`FatGraphs.random_configuration_model`** &mdash; *Function*.



```
random_configuration_model(n::Int, k::Array{Int}; seed=-1, check_graphical=false)
```

Creates a random undirected graph according to the [configuraton model](http://tuvalu.santafe.edu/~aaronc/courses/5352/fall2013/csci5352_2013_L11.pdf). It contains `n` vertices, the vertex `i` having degree `k[i]`.

Defining `c = mean(k)`, it allocates an array of `nc` `Int`s, and takes approximately $nc^2$ time.

If `check_graphical=true` makes sure that `k` is a graphical sequence (see `isgraphical`).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L412-L424' class='documenter-source'>source</a><br>

<a id='FatGraphs.random_regular_digraph' href='#FatGraphs.random_regular_digraph'>#</a>
**`FatGraphs.random_regular_digraph`** &mdash; *Function*.



```
random_regular_digraph(n::Int, k::Int; dir::Symbol=:out, seed=-1)
```

Creates a random directed [regular graph](https://en.wikipedia.org/wiki/Regular_graph) with `n` vertices, each with degree `k`. The degree (in or out) can be specified using `dir=:in` or `dir=:out`. The default is `dir=:out`.

For directed graphs, allocates an $n 	imes n$ sparse matrix of boolean as an adjacency matrix and uses that to generate the directed graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L449-L459' class='documenter-source'>source</a><br>

<a id='FatGraphs.random_regular_graph' href='#FatGraphs.random_regular_graph'>#</a>
**`FatGraphs.random_regular_graph`** &mdash; *Function*.



```
random_regular_graph(n::Int, k::Int; seed=-1)
```

Creates a random undirected [regular graph](https://en.wikipedia.org/wiki/Regular_graph) with `n` vertices, each with degree `k`.

For undirected graphs, allocates an array of `nk` `Int`s, and takes approximately $nk^2$ time. For $k > n/2$, generates a graph of degree `n-k-1` and returns its complement.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L374-L384' class='documenter-source'>source</a><br>

<a id='FatGraphs.static_fitness_model' href='#FatGraphs.static_fitness_model'>#</a>
**`FatGraphs.static_fitness_model`** &mdash; *Function*.



```
static_fitness_model(m, fitness, G=Graph; seed=-1)
static_fitness_model(m, fitness_out, fitness_in, G=DiGraph; seed=-1)
```

Generates a random graph with `length(fitness)` nodes and `m` edges, in which the probability of the existence of edge `(i, j)` is proportional to `fitness[i]*fitness[j]`. Time complexity is O(|V| + |E| log |E|).

In and out fitness have to be supplied for generating directed graphs.

Reference:

  * Goh K-I, Kahng B, Kim D: Universal behaviour of load distribution

in scale-free networks. Phys Rev Lett 87(27):278701, 2001.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L237-L251' class='documenter-source'>source</a><br>

<a id='FatGraphs.static_scale_free' href='#FatGraphs.static_scale_free'>#</a>
**`FatGraphs.static_scale_free`** &mdash; *Function*.



```
function static_scale_free(n, m, α, G=Graph;
        seed=-1, finite_size_correction=true)
```

Generates a random graph with `n` vertices, `m` edges and expected power-law degree distribution with exponent `α`. `finite_size_correction` determines whether to use the finite size correction proposed by Cho et al. This generator calls internally the `static_fitness_model function`. Time complexity is O(|V| + |E| log |E|).

```
function static_scale_free(n, m, α_out, α_in, G=DiGraph;
        seed=-1, finite_size_correction=true)
```

Generates a random digraph

References:

  * Goh K-I, Kahng B, Kim D: Universal behaviour of load distribution in scale-free networks. Phys Rev Lett 87(27):278701, 2001.
  * Chung F and Lu L: Connected components in a random graph with given degree sequences. Annals of Combinatorics 6, 125-145, 2002.
  * Cho YS, Kim JS, Park J, Kahng B, Kim D: Percolation transitions in scale-free networks under the Achlioptas process. Phys Rev Lett 103:135702, 2009.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L314-L336' class='documenter-source'>source</a><br>

<a id='FatGraphs.stochastic_block_model' href='#FatGraphs.stochastic_block_model'>#</a>
**`FatGraphs.stochastic_block_model`** &mdash; *Function*.



```
stochastic_block_model(c::Matrix{Float64}, n::Vector{Int}; seed::Int = -1)
stochastic_block_model(cin::Float64, coff::Float64, n::Vector{Int}; seed::Int = -1)
```

Returns a Graph generated according to the Stochastic Block Model (SBM).

`c[a,b]` : Mean number of neighbors of a vertex in block `a` belonging to block `b`.            Only the upper triangular part is considered, since the lower traingular is            determined by $c[b,a] = c[a,b] * n[a]/n[b]$. `n[a]` : Number of vertices in block `a`

The second form samples from a SBM with `c[a,a]=cin`, and `c[a,b]=coff`.

For a dynamic version of the SBM see the `StochasticBlockModel` type and related functions.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L491-L506' class='documenter-source'>source</a><br>

<a id='FatGraphs.watts_strogatz' href='#FatGraphs.watts_strogatz'>#</a>
**`FatGraphs.watts_strogatz`** &mdash; *Function*.



```
watts_strogatz(n, k, β, G=Graph; seed=-1)
```

Creates a [Watts-Strogatz](https://en.wikipedia.org/wiki/Watts_and_Strogatz_model) small model random graph with `n` vertices, each with degree `k`. Edges are randomized per the model based on probability `β`.

Undirected graphs are created by default. Directed graphs can be created passing a directed graph type as last argument (e.g. `DiGraph`).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/randgraphs.jl#L46-L55' class='documenter-source'>source</a><br>


<a id='Static-Graphs-1'></a>

## Static Graphs


*FatGraphs.jl* also implements a collection of classic graph generators:

<a id='FatGraphs.BinaryTree' href='#FatGraphs.BinaryTree'>#</a>
**`FatGraphs.BinaryTree`** &mdash; *Function*.



```
BinaryTree(levels, G=Graph)
```

Creates a binary tree with k-levels vertices are numbered 1:2^levels-1


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L177-L181' class='documenter-source'>source</a><br>

<a id='FatGraphs.CliqueGraph' href='#FatGraphs.CliqueGraph'>#</a>
**`FatGraphs.CliqueGraph`** &mdash; *Function*.



```
CliqueGraph(k, n, G=Graph)
```

This function generates a graph with `n` `k`-cliques connected circularly by `n` edges.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L221-L225' class='documenter-source'>source</a><br>

<a id='FatGraphs.CompleteBipartiteGraph' href='#FatGraphs.CompleteBipartiteGraph'>#</a>
**`FatGraphs.CompleteBipartiteGraph`** &mdash; *Function*.



```
CompleteBipartiteGraph(n1, n2, G = Graph)
```

Creates a complete bipartite graph with `n1+n2` vertices. It has edges connecting each pair of vertices in the two sets.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L21-L26' class='documenter-source'>source</a><br>

<a id='FatGraphs.CompleteDiGraph' href='#FatGraphs.CompleteDiGraph'>#</a>
**`FatGraphs.CompleteDiGraph`** &mdash; *Function*.



```
CompleteDiGraph(n, G = DiGraph)
```

Creates a complete digraph with `n` vertices. A complete digraph has edges connecting each pair of vertices (both an ingoing and outgoing edge).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L35-L40' class='documenter-source'>source</a><br>

<a id='FatGraphs.CompleteGraph' href='#FatGraphs.CompleteGraph'>#</a>
**`FatGraphs.CompleteGraph`** &mdash; *Function*.



```
CompleteGraph(n, G = Graph)
```

Creates a complete graph of type `G` with `n` vertices. A complete graph has edges connecting each pair of vertices.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L4-L9' class='documenter-source'>source</a><br>

<a id='FatGraphs.CycleDiGraph' href='#FatGraphs.CycleDiGraph'>#</a>
**`FatGraphs.CycleDiGraph`** &mdash; *Function*.



Creates a cycle digraph with `n` vertices. A cycle digraph is a closed path digraph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L118-L120' class='documenter-source'>source</a><br>

<a id='FatGraphs.CycleGraph' href='#FatGraphs.CycleGraph'>#</a>
**`FatGraphs.CycleGraph`** &mdash; *Function*.



```
CycleGraph(n, G=Graph)
```

Creates a cycle graph with `n` vertices. A cycle graph is a closed path graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L104-L108' class='documenter-source'>source</a><br>

<a id='FatGraphs.DoubleBinaryTree' href='#FatGraphs.DoubleBinaryTree'>#</a>
**`FatGraphs.DoubleBinaryTree`** &mdash; *Function*.



```
DoubleBinaryTree(levels, G=Graph)
```

Create a double complete binary tree with k-levels used as an example for spectral clustering by Guattery and Miller 1998.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L193-L198' class='documenter-source'>source</a><br>

<a id='FatGraphs.Grid' href='#FatGraphs.Grid'>#</a>
**`FatGraphs.Grid`** &mdash; *Function*.



```
Grid{T<:Integer}(dims::AbstractVector{T}; periodic=false)
```

Creates a `d`-dimensional cubic lattice, with `d=length(dims)` and length  `dims[i]` in dimension `i`. If `periodic=true` the resulting lattice will have periodic boundary condition in each dimension.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L161-L166' class='documenter-source'>source</a><br>

<a id='FatGraphs.PathDiGraph' href='#FatGraphs.PathDiGraph'>#</a>
**`FatGraphs.PathDiGraph`** &mdash; *Function*.



```
PathDiGraph(n, G = DiGraph)
```

Creates a path digraph with `n` vertices. A path graph connects each successive vertex by a single directed edge.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L90-L95' class='documenter-source'>source</a><br>

<a id='FatGraphs.PathGraph' href='#FatGraphs.PathGraph'>#</a>
**`FatGraphs.PathGraph`** &mdash; *Function*.



```
PathGraph(n, G = Graph)
```

Creates a path graph with `n` vertices. A path graph connects each successive vertex by a single edge.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L76-L81' class='documenter-source'>source</a><br>

<a id='FatGraphs.RoachGraph' href='#FatGraphs.RoachGraph'>#</a>
**`FatGraphs.RoachGraph`** &mdash; *Function*.



The Roach Graph from Guattery and Miller 1998


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L208' class='documenter-source'>source</a><br>

<a id='FatGraphs.StarDiGraph' href='#FatGraphs.StarDiGraph'>#</a>
**`FatGraphs.StarDiGraph`** &mdash; *Function*.



Creates a star digraph with `n` vertices. A star digraph has a central vertex with directed edges to every other vertex.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L65-L68' class='documenter-source'>source</a><br>

<a id='FatGraphs.StarGraph' href='#FatGraphs.StarGraph'>#</a>
**`FatGraphs.StarGraph`** &mdash; *Function*.



```
StarGraph(n, G = Graph)
```

Creates a star graph with `n` vertices. A star graph has a central vertex with edges to each other vertex.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L51-L56' class='documenter-source'>source</a><br>

<a id='FatGraphs.WheelDiGraph' href='#FatGraphs.WheelDiGraph'>#</a>
**`FatGraphs.WheelDiGraph`** &mdash; *Function*.



Creates a wheel digraph with `n` vertices. A wheel graph is a star digraph with the outer vertices connected via a closed path graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L147-L150' class='documenter-source'>source</a><br>

<a id='FatGraphs.WheelGraph' href='#FatGraphs.WheelGraph'>#</a>
**`FatGraphs.WheelGraph`** &mdash; *Function*.



```
WheelGraph(n, G=Graph)
```

Creates a wheel graph with `n` vertices. A wheel graph is a star graph with the outer vertices connected via a closed path graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/staticgraphs.jl#L130-L135' class='documenter-source'>source</a><br>


<a id='Small-Graphs-1'></a>

## Small Graphs


Other classical graphs can be generated by the following function:

<a id='FatGraphs.digraph' href='#FatGraphs.digraph'>#</a>
**`FatGraphs.digraph`** &mdash; *Function*.



```
digraph(s::Symbol, G = DiGraph)
```

Creates a notorious digraph `s` of type `G`. Admissible values for `s` are:

| `s`                   | graph type                                                                                              |
|:--------------------- |:------------------------------------------------------------------------------------------------------- |
| :truncatedtetrahedron | A skeleton of the [truncated tetrahedron digraph](https://en.wikipedia.org/wiki/Truncated_tetrahedron). |


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/smallgraphs.jl#L98-L107' class='documenter-source'>source</a><br>

<a id='FatGraphs.digraph' href='#FatGraphs.digraph'>#</a>
**`FatGraphs.digraph`** &mdash; *Function*.



```
digraph{G<:AGraph}(n, edgelist::Vector{Tuple{Int,Int}},
    G = Graph)
```

Build a digraph with `n` vertices, type `G`, and given `edgelist`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/smallgraphs.jl#L20-L25' class='documenter-source'>source</a><br>

<a id='FatGraphs.graph' href='#FatGraphs.graph'>#</a>
**`FatGraphs.graph`** &mdash; *Function*.



```
graph{G<:AGraph}(n, edgelist::Vector{Tuple{Int,Int}},
    G = Graph)
```

Build a graph with `n` vertices, type `G`, and given `edgelist`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/smallgraphs.jl#L4-L9' class='documenter-source'>source</a><br>

<a id='FatGraphs.graph' href='#FatGraphs.graph'>#</a>
**`FatGraphs.graph`** &mdash; *Function*.



```
graph(s::Symbol, G = Graph)
```

Creates a notorious graph `s` of type `G`. Admissible values for `s` are:

| `s`                       | graph type                                                                                              |
|:------------------------- |:------------------------------------------------------------------------------------------------------- |
| :bull                     | A [bull graph](https://en.wikipedia.org/wiki/Bull_graph).                                               |
| :chvatal                  | A [Chvátal graph](https://en.wikipedia.org/wiki/Chvátal_graph).                                         |
| :cubical                  | A [Platonic cubical graph](https://en.wikipedia.org/wiki/Platonic_graph).                               |
| :desargues                | A [Desarguesgraph](https://en.wikipedia.org/wiki/Desargues_graph).                                      |
| :diamond                  | A [diamond graph](http://en.wikipedia.org/wiki/Diamond_graph).                                          |
| :dodecahedral             | A [Platonic dodecahedral  graph](https://en.wikipedia.org/wiki/Platonic_graph).                         |
| :frucht                   | A [Frucht graph](https://en.wikipedia.org/wiki/Frucht_graph).                                           |
| :heawood                  | A [Heawood graph](https://en.wikipedia.org/wiki/Heawood_graph).                                         |
| :house                    | A graph mimicing the classic outline of a house.                                                        |
| :housex                   | A house graph, with two edges crossing the bottom square.                                               |
| :icosahedral              | A [Platonic icosahedral   graph](https://en.wikipedia.org/wiki/Platonic_graph).                         |
| :krackhardtkite           | A [Krackhardt-Kite social network  graph](http://mathworld.wolfram.com/KrackhardtKite.html).            |
| :moebiuskantor            | A [Möbius-Kantor graph](http://en.wikipedia.org/wiki/Möbius–Kantor_graph).                              |
| :octahedral               | A [Platonic octahedral graph](https://en.wikipedia.org/wiki/Platonic_graph).                            |
| :pappus                   | A [Pappus graph](http://en.wikipedia.org/wiki/Pappus_graph).                                            |
| :petersen                 | A [Petersen graph](http://en.wikipedia.org/wiki/Petersen_graph).                                        |
| :sedgewickmaze            | A simple maze graph used in Sedgewick's *Algorithms in C++: Graph  Algorithms (3rd ed.)*                |
| :tetrahedral              | A [Platonic tetrahedral  graph](https://en.wikipedia.org/wiki/Platonic_graph).                          |
| :truncatedcube            | A skeleton of the [truncated cube graph](https://en.wikipedia.org/wiki/Truncated_cube).                 |
| :truncatedtetrahedron     | A skeleton of the [truncated tetrahedron  graph](https://en.wikipedia.org/wiki/Truncated_tetrahedron).  |
| :truncatedtetrahedron_dir | A skeleton of the [truncated tetrahedron digraph](https://en.wikipedia.org/wiki/Truncated_tetrahedron). |
| :tutte                    | A [Tutte graph](https://en.wikipedia.org/wiki/Tutte_graph).                                             |


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/smallgraphs.jl#L35-L65' class='documenter-source'>source</a><br>


<a id='Euclidean-Graphs-1'></a>

## Euclidean Graphs


Generation of random and static graphs embedded in Euclidean space.

<a id='FatGraphs.euclidean_graph' href='#FatGraphs.euclidean_graph'>#</a>
**`FatGraphs.euclidean_graph`** &mdash; *Function*.



```
euclidean_graph(points::Matrix G=Graph; L=1., p=2., cutoff=-1., bc=:open)
```

Given the `d×N` matrix `points` builds an Euclidean graph of `N` vertices according to the following procedure.

Defining the `d`-dimensional vectors `x[i] = points[:,i]`, an edge between vertices `i` and `j` is inserted if `norm(x[i]-x[j], p) < cutoff`. In case of negative `cutoff` instead every edge is inserted. For `p=2` we have the standard Euclidean distance. Set `bc=:periodic` to impose periodic boundary conditions in the box $[0,L]^d$.

Returns a graph and Dict containing the distance on each edge.

```
euclidean_graph(N, d, G=Graph; seed = -1, L=1., p=2., cutoff=-1., bc=:open)
```

Generates `N` uniformly distributed points in the box $[0,L]^d$ and builds and Euclidean graph.

Returns a graph, a Dict containing the distance on each edge and a matrix with the points' positions.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/generators/euclideangraphs.jl#L1-L23' class='documenter-source'>source</a><br>


<a id='MatrixDepot-1'></a>

## MatrixDepot


Other notorious graphs are available through integration with the `MatrixDepot.jl` package.

