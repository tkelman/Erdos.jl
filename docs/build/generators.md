
<a id='Generators-1'></a>

# Generators


<a id='Random-Graphs-1'></a>

## Random Graphs


*Erdos.jl* implements some common random graph generators:

<a id='Erdos.barabasi_albert' href='#Erdos.barabasi_albert'>#</a>
**`Erdos.barabasi_albert`** &mdash; *Function*.



```
barabasi_albert(n, k, G=Graph; seed=-1)
barabasi_albert(n, n0, k, G=Graph; seed=-1)
```

Creates a random graph of type `G` with `n` vertices according to [Barabási–Albert model](https://en.wikipedia.org/wiki/Barab%C3%A1si%E2%80%93Albert_model). It is grown by adding new vertices to an initial graph with `n0` vertices (`n0=k` if not specified). Each new vertex is attached with `k` edges to `k` different vertices already present in the system by preferential attachment. The initial graph is empty by default.

Undirected graphs are created by default. Directed graphs can be created passing a directed graph type as last argument (e.g. `DiGraph`).

See also [`barabasi_albert!`](generators.md#Erdos.barabasi_albert!-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Int64,Int64}) for growing a given graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L137-L150' class='documenter-source'>source</a><br>

<a id='Erdos.barabasi_albert!-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Int64,Int64}' href='#Erdos.barabasi_albert!-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Int64,Int64}'>#</a>
**`Erdos.barabasi_albert!`** &mdash; *Method*.



```
barabasi_albert!(g, n::Int, k::Int; seed::Int = -1)
```

Grows the graph `g` according to [Barabási–Albert](https://en.wikipedia.org/wiki/Barab%C3%A1si%E2%80%93Albert_model) process into a graph with `n` vertices. At each step a new vertex is attached by preferential attachment to `k` different vertices already present in the graph.

See also [`barabasi_albert`](generators.md#Erdos.barabasi_albert).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L161-L170' class='documenter-source'>source</a><br>

<a id='Erdos.erdos_renyi' href='#Erdos.erdos_renyi'>#</a>
**`Erdos.erdos_renyi`** &mdash; *Function*.



```
erdos_renyi(n::Int, p::Real, G=Graph; seed=-1)
erdos_renyi(n::Int, m::Int, G=Graph; seed=-1)
```

Creates an [Erdős–Rényi](http://en.wikipedia.org/wiki/Erdős–Rényi_model) random graph of type `G` with `n` vertices. Edges are added between pairs of vertices with probability `p` in the first method. In the second method `m` edges are randomly chosen insted.

Undirected graphs are created by default. Directed graphs can be created passing a directed graph type as last argument (e.g. `DiGraph`)

Note also that Erdős–Rényi graphs may be generated quickly using `erdos_renyi(n, ne)` or the  `Graph(nv, ne)` constructor, which randomly select `ne` edges among all the potential edges.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L1-L16' class='documenter-source'>source</a><br>

<a id='Erdos.random_configuration_model' href='#Erdos.random_configuration_model'>#</a>
**`Erdos.random_configuration_model`** &mdash; *Function*.



```
random_configuration_model(n::Int, k::Vector{Int}; seed=-1, check_graphical=false)
```

Creates a random undirected graph according to the [configuraton model](http://tuvalu.santafe.edu/~aaronc/courses/5352/fall2013/csci5352_2013_L11.pdf). It contains `n` vertices, the vertex `i` having degree `k[i]`.

Defining `c = mean(k)`, it allocates an array of `nc` `Int`s, and takes approximately $nc^2$ time.

If `check_graphical=true` makes sure that `k` is a graphical sequence (see `is_graphical`).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L411-L423' class='documenter-source'>source</a><br>

<a id='Erdos.random_regular_digraph' href='#Erdos.random_regular_digraph'>#</a>
**`Erdos.random_regular_digraph`** &mdash; *Function*.



```
random_regular_digraph(n::Int, k::Int; dir::Symbol=:out, seed=-1)
```

Creates a random directed [regular graph](https://en.wikipedia.org/wiki/Regular_graph) with `n` vertices, each with degree `k`. The degree (in or out) can be specified using `dir=:in` or `dir=:out`. The default is `dir=:out`.

For directed graphs, allocates an $n 	imes n$ sparse matrix of boolean as an adjacency matrix and uses that to generate the directed graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L448-L458' class='documenter-source'>source</a><br>

<a id='Erdos.random_regular_graph' href='#Erdos.random_regular_graph'>#</a>
**`Erdos.random_regular_graph`** &mdash; *Function*.



```
random_regular_graph(n::Int, k::Int; seed=-1)
```

Creates a random undirected [regular graph](https://en.wikipedia.org/wiki/Regular_graph) with `n` vertices, each with degree `k`.

For undirected graphs, allocates an array of `nk` `Int`s, and takes approximately $nk^2$ time. For $k > n/2$, generates a graph of degree `n-k-1` and returns its complement.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L373-L383' class='documenter-source'>source</a><br>

<a id='Erdos.static_fitness_model' href='#Erdos.static_fitness_model'>#</a>
**`Erdos.static_fitness_model`** &mdash; *Function*.



```
static_fitness_model(m, fitness, G=Graph; seed=-1)
static_fitness_model(m, fitness_out, fitness_in, G=DiGraph; seed=-1)
```

Generates a random graph with `length(fitness)` nodes and `m` edges, in which the probability of the existence of edge `(i, j)` is proportional to `fitness[i]*fitness[j]`. Time complexity is O(|V| + |E| log |E|).

In and out fitness have to be supplied for generating directed graphs.

Reference:

  * Goh K-I, Kahng B, Kim D: Universal behaviour of load distribution

in scale-free networks. Phys Rev Lett 87(27):278701, 2001.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L236-L250' class='documenter-source'>source</a><br>

<a id='Erdos.static_scale_free' href='#Erdos.static_scale_free'>#</a>
**`Erdos.static_scale_free`** &mdash; *Function*.



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


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L313-L335' class='documenter-source'>source</a><br>

<a id='Erdos.stochastic_block_model' href='#Erdos.stochastic_block_model'>#</a>
**`Erdos.stochastic_block_model`** &mdash; *Function*.



```
stochastic_block_model(c::Matrix{Float64}, n::Vector{Int}; seed::Int = -1)
stochastic_block_model(cin::Float64, coff::Float64, n::Vector{Int}; seed::Int = -1)
```

Returns a Graph generated according to the Stochastic Block Model (SBM).

`c[a,b]` : Mean number of neighbors of a vertex in block `a` belonging to block `b`.            Only the upper triangular part is considered, since the lower traingular is            determined by $c[b,a] = c[a,b] * n[a]/n[b]$. `n[a]` : Number of vertices in block `a`

The second form samples from a SBM with `c[a,a]=cin`, and `c[a,b]=coff`.

For a dynamic version of the SBM see the `StochasticBlockModel` type and related functions.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L490-L505' class='documenter-source'>source</a><br>

<a id='Erdos.watts_strogatz' href='#Erdos.watts_strogatz'>#</a>
**`Erdos.watts_strogatz`** &mdash; *Function*.



```
watts_strogatz(n, k, β, G=Graph; seed=-1)
```

Creates a [Watts-Strogatz](https://en.wikipedia.org/wiki/Watts_and_Strogatz_model) small model random graph with `n` vertices, each with degree `k`. Edges are randomized per the model based on probability `β`.

Undirected graphs are created by default. Directed graphs can be created passing a directed graph type as last argument (e.g. `DiGraph`).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/randgraphs.jl#L44-L53' class='documenter-source'>source</a><br>


<a id='Static-Graphs-1'></a>

## Static Graphs


*Erdos.jl* also implements a collection of classic graph generators:

<a id='Erdos.BinaryTree' href='#Erdos.BinaryTree'>#</a>
**`Erdos.BinaryTree`** &mdash; *Function*.



```
BinaryTree(levels, G=Graph)
```

Creates a binary tree with k-levels vertices are numbered 1:2^levels-1


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L179-L183' class='documenter-source'>source</a><br>

<a id='Erdos.CliqueGraph' href='#Erdos.CliqueGraph'>#</a>
**`Erdos.CliqueGraph`** &mdash; *Function*.



```
CliqueGraph(k, n, G=Graph)
```

This function generates a graph with `n` `k`-cliques connected circularly by `n` edges.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L223-L227' class='documenter-source'>source</a><br>

<a id='Erdos.CompleteBipartiteGraph' href='#Erdos.CompleteBipartiteGraph'>#</a>
**`Erdos.CompleteBipartiteGraph`** &mdash; *Function*.



```
CompleteBipartiteGraph(n1, n2, G = Graph)
```

Creates a complete bipartite graph with `n1+n2` vertices. It has edges connecting each pair of vertices in the two sets.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L20-L25' class='documenter-source'>source</a><br>

<a id='Erdos.CompleteDiGraph' href='#Erdos.CompleteDiGraph'>#</a>
**`Erdos.CompleteDiGraph`** &mdash; *Function*.



```
CompleteDiGraph(n, G = DiGraph)
```

Creates a complete digraph with `n` vertices. A complete digraph has edges connecting each pair of vertices (both an ingoing and outgoing edge).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L35-L40' class='documenter-source'>source</a><br>

<a id='Erdos.CompleteGraph' href='#Erdos.CompleteGraph'>#</a>
**`Erdos.CompleteGraph`** &mdash; *Function*.



```
CompleteGraph(n, G = Graph)
```

Creates a complete graph of type `G` with `n` vertices. A complete graph has edges connecting each pair of vertices.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L4-L9' class='documenter-source'>source</a><br>

<a id='Erdos.CycleDiGraph' href='#Erdos.CycleDiGraph'>#</a>
**`Erdos.CycleDiGraph`** &mdash; *Function*.



Creates a cycle digraph with `n` vertices. A cycle digraph is a closed path digraph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L120-L122' class='documenter-source'>source</a><br>

<a id='Erdos.CycleGraph' href='#Erdos.CycleGraph'>#</a>
**`Erdos.CycleGraph`** &mdash; *Function*.



```
CycleGraph(n, G=Graph)
```

Creates a cycle graph with `n` vertices. A cycle graph is a closed path graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L106-L110' class='documenter-source'>source</a><br>

<a id='Erdos.DoubleBinaryTree' href='#Erdos.DoubleBinaryTree'>#</a>
**`Erdos.DoubleBinaryTree`** &mdash; *Function*.



```
DoubleBinaryTree(levels, G=Graph)
```

Create a double complete binary tree with k-levels used as an example for spectral clustering by Guattery and Miller 1998.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L195-L200' class='documenter-source'>source</a><br>

<a id='Erdos.Grid' href='#Erdos.Grid'>#</a>
**`Erdos.Grid`** &mdash; *Function*.



```
Grid{T<:Integer}(dims::AbstractVector{T}; periodic=false)
```

Creates a `d`-dimensional cubic lattice, with `d=length(dims)` and length  `dims[i]` in dimension `i`. If `periodic=true` the resulting lattice will have periodic boundary condition in each dimension.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L163-L168' class='documenter-source'>source</a><br>

<a id='Erdos.PathDiGraph' href='#Erdos.PathDiGraph'>#</a>
**`Erdos.PathDiGraph`** &mdash; *Function*.



```
PathDiGraph(n, G = DiGraph)
```

Creates a path digraph with `n` vertices. A path graph connects each successive vertex by a single directed edge.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L92-L97' class='documenter-source'>source</a><br>

<a id='Erdos.PathGraph' href='#Erdos.PathGraph'>#</a>
**`Erdos.PathGraph`** &mdash; *Function*.



```
PathGraph(n, G = Graph)
```

Creates a path graph with `n` vertices. A path graph connects each successive vertex by a single edge.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L78-L83' class='documenter-source'>source</a><br>

<a id='Erdos.RoachGraph' href='#Erdos.RoachGraph'>#</a>
**`Erdos.RoachGraph`** &mdash; *Function*.



The Roach Graph from Guattery and Miller 1998


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L210' class='documenter-source'>source</a><br>

<a id='Erdos.StarDiGraph' href='#Erdos.StarDiGraph'>#</a>
**`Erdos.StarDiGraph`** &mdash; *Function*.



Creates a star digraph with `n` vertices. A star digraph has a central vertex with directed edges to every other vertex.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L67-L70' class='documenter-source'>source</a><br>

<a id='Erdos.StarGraph' href='#Erdos.StarGraph'>#</a>
**`Erdos.StarGraph`** &mdash; *Function*.



```
StarGraph(n, G = Graph)
```

Creates a star graph with `n` vertices. A star graph has a central vertex with edges to each other vertex.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L53-L58' class='documenter-source'>source</a><br>

<a id='Erdos.WheelDiGraph' href='#Erdos.WheelDiGraph'>#</a>
**`Erdos.WheelDiGraph`** &mdash; *Function*.



Creates a wheel digraph with `n` vertices. A wheel graph is a star digraph with the outer vertices connected via a closed path graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L149-L152' class='documenter-source'>source</a><br>

<a id='Erdos.WheelGraph' href='#Erdos.WheelGraph'>#</a>
**`Erdos.WheelGraph`** &mdash; *Function*.



```
WheelGraph(n, G=Graph)
```

Creates a wheel graph with `n` vertices. A wheel graph is a star graph with the outer vertices connected via a closed path graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/staticgraphs.jl#L132-L137' class='documenter-source'>source</a><br>


<a id='Small-Graphs-1'></a>

## Small Graphs


Other classical graphs can be generated by the following function:

<a id='Erdos.digraph' href='#Erdos.digraph'>#</a>
**`Erdos.digraph`** &mdash; *Function*.



```
digraph{G<:AGraph}(n, edgelist::Vector{Tuple{Int,Int}},
    G = Graph)
```

Build a digraph with `n` vertices, type `G`, and given `edgelist`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/smallgraphs.jl#L20-L25' class='documenter-source'>source</a><br>

<a id='Erdos.digraph' href='#Erdos.digraph'>#</a>
**`Erdos.digraph`** &mdash; *Function*.



```
digraph(s::Symbol, G = DiGraph)
```

Creates a notorious digraph `s` of type `G`. Admissible values for `s` are:

| `s`                   | graph type                                                                                              |
|:--------------------- |:------------------------------------------------------------------------------------------------------- |
| :truncatedtetrahedron | A skeleton of the [truncated tetrahedron digraph](https://en.wikipedia.org/wiki/Truncated_tetrahedron). |


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/smallgraphs.jl#L98-L107' class='documenter-source'>source</a><br>

<a id='Erdos.graph' href='#Erdos.graph'>#</a>
**`Erdos.graph`** &mdash; *Function*.



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


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/smallgraphs.jl#L35-L65' class='documenter-source'>source</a><br>

<a id='Erdos.graph' href='#Erdos.graph'>#</a>
**`Erdos.graph`** &mdash; *Function*.



```
graph{G<:AGraph}(n, edgelist::Vector{Tuple{Int,Int}},
    G = Graph)
```

Build a graph with `n` vertices, type `G`, and given `edgelist`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/smallgraphs.jl#L4-L9' class='documenter-source'>source</a><br>


<a id='Euclidean-Graphs-1'></a>

## Euclidean Graphs


Generation of random and static graphs embedded in Euclidean space.

<a id='Erdos.euclidean_graph' href='#Erdos.euclidean_graph'>#</a>
**`Erdos.euclidean_graph`** &mdash; *Function*.



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


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/euclideangraphs.jl#L1-L23' class='documenter-source'>source</a><br>

