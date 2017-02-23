
<a id='Basic-Interface-1'></a>

# Basic Interface


*Erdos.jl* defines the following basic  functionalities:

<a id='Erdos.nv' href='#Erdos.nv'>#</a>
**`Erdos.nv`** &mdash; *Function*.



```
nv(g)
```

The number of vertices in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L24-L28' class='documenter-source'>source</a><br>

<a id='Erdos.ne' href='#Erdos.ne'>#</a>
**`Erdos.ne`** &mdash; *Function*.



```
ne(g)
```

The number of edges in `g`.

Time Complexity: O(1)


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L31-L37' class='documenter-source'>source</a><br>

<a id='Erdos.add_vertex!' href='#Erdos.add_vertex!'>#</a>
**`Erdos.add_vertex!`** &mdash; *Function*.



```
add_vertex!(g)
```

Add a new vertex to the graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L69-L73' class='documenter-source'>source</a><br>

<a id='Erdos.add_vertices!' href='#Erdos.add_vertices!'>#</a>
**`Erdos.add_vertices!`** &mdash; *Function*.



```
add_vertices!(g, n)
```

Add `n` new vertices to the graph `g`. Returns the final number of vertices.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L29-L34' class='documenter-source'>source</a><br>

<a id='Erdos.rem_vertex!' href='#Erdos.rem_vertex!'>#</a>
**`Erdos.rem_vertex!`** &mdash; *Function*.



```
rem_vertex!(g, v)
```

Remove the vertex `v` from graph `g`. It will change the label of the last vertex of the old graph to `v`.

See also [`rem_vertices!`](core.md#Erdos.rem_vertices!)


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L331-L338' class='documenter-source'>source</a><br>

<a id='Erdos.pop_vertex!' href='#Erdos.pop_vertex!'>#</a>
**`Erdos.pop_vertex!`** &mdash; *Function*.



```
pop_vertex!(g)
```

Remove the last vertex of `g`. Equivalent to rem_vertex!(g, nv(g)).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L167-L171' class='documenter-source'>source</a><br>

<a id='Erdos.rem_vertices!' href='#Erdos.rem_vertices!'>#</a>
**`Erdos.rem_vertices!`** &mdash; *Function*.



```
rem_vertex!(g, vs)
```

Remove the vertices in `vs` from graph `g`. Returns a vector mapping the vertices in the new graph to the old ones.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L348-L354' class='documenter-source'>source</a><br>

<a id='Erdos.has_edge' href='#Erdos.has_edge'>#</a>
**`Erdos.has_edge`** &mdash; *Function*.



```
has_edge(g, e)
has_edge(g, u, v)
```

Returns true if the graph `g` has an edge `e` (from `u` to `v`).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L220-L225' class='documenter-source'>source</a><br>

<a id='Erdos.src' href='#Erdos.src'>#</a>
**`Erdos.src`** &mdash; *Function*.



```
src(e)
```

Returns the source of an edge.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L146-L150' class='documenter-source'>source</a><br>

<a id='Erdos.dst' href='#Erdos.dst'>#</a>
**`Erdos.dst`** &mdash; *Function*.



```
dst(e)
```

Returns the destination of an edge.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L153-L157' class='documenter-source'>source</a><br>

<a id='Erdos.edge' href='#Erdos.edge'>#</a>
**`Erdos.edge`** &mdash; *Function*.



```
edge(g, u, v)
```

Returns an edge from 'u' to 'v'. The edge doesn't necessarily exists in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L96-L101' class='documenter-source'>source</a><br>

<a id='Erdos.add_edge!' href='#Erdos.add_edge!'>#</a>
**`Erdos.add_edge!`** &mdash; *Function*.



```
add_edge!(g, e)
```

Add to `g` the edge `e`.

```
add_edge!(g, u, v)
```

Add to `g` an edge from `u` to `v`.

Will return false if add fails (e.g., if vertices are not in the graph or the edge is already present) and true otherwise.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L40-L51' class='documenter-source'>source</a><br>

<a id='Erdos.unsafe_add_edge!' href='#Erdos.unsafe_add_edge!'>#</a>
**`Erdos.unsafe_add_edge!`** &mdash; *Function*.



```
unsafe_add_edge!(g, u, v)
```

Possibly faster and unsafer version of [`add_edge!`](core.md#Erdos.add_edge!), which doesn't guarantee some graph invariant properties.

For example, some graph types (e.g. `Graph`) assume sorted adjacency lists as members. In this case order is not preserved while inserting new edges, resulting in a faster construction of the graph. As a consequence though, some functions such `has_edge(g, u, v)` could give incorrect results.

To restore the correct behaviour, call [`rebuild!`](core.md#Erdos.rebuild!)(g) after the last call to `unsafe_add_edge!`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L306-L319' class='documenter-source'>source</a><br>

<a id='Erdos.rebuild!' href='#Erdos.rebuild!'>#</a>
**`Erdos.rebuild!`** &mdash; *Function*.



```
rebuild!(g)
```

Check and restore the structure of `g`, which could be corrupted by the use of unsafe functions (e. g. [`unsafe_add_edge!`](core.md#Erdos.unsafe_add_edge!))


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L323-L328' class='documenter-source'>source</a><br>

<a id='Erdos.rem_edge!' href='#Erdos.rem_edge!'>#</a>
**`Erdos.rem_edge!`** &mdash; *Function*.



```
rem_edge!(g, e)
```

Remove the edge `e`.

```
rem_edge!(g, u, v)
```

Remove the edge from `u` to `v`.

Returns false if edge removal fails (e.g., if the edge does not exist) and true otherwise.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L55-L65' class='documenter-source'>source</a><br>

<a id='Erdos.degree' href='#Erdos.degree'>#</a>
**`Erdos.degree`** &mdash; *Function*.



```
degree(g, v)
```

Return the number of edges  from the vertex `v`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L81-L85' class='documenter-source'>source</a><br>

<a id='Erdos.in_degree' href='#Erdos.in_degree'>#</a>
**`Erdos.in_degree`** &mdash; *Function*.



```
in_degree(g, v)
```

Returns the number of edges which start at vertex `v`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L67-L71' class='documenter-source'>source</a><br>

<a id='Erdos.out_degree' href='#Erdos.out_degree'>#</a>
**`Erdos.out_degree`** &mdash; *Function*.



```
out_degree(g, v)
```

Returns the number of edges which end at vertex `v`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L74-L78' class='documenter-source'>source</a><br>

<a id='Erdos.neighbors' href='#Erdos.neighbors'>#</a>
**`Erdos.neighbors`** &mdash; *Function*.



```
neighbors(g, v)
```

Returns a list of all neighbors from vertex `v` in `g`.

For directed graph, this is equivalent to [`out_neighbors`](core.md#Erdos.out_neighbors)(g, v).

NOTE: it may return a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L92-L100' class='documenter-source'>source</a><br>

<a id='Erdos.in_neighbors' href='#Erdos.in_neighbors'>#</a>
**`Erdos.in_neighbors`** &mdash; *Function*.



```
in_neighbors(g, v)
```

Returns an iterable to all neighbors connected to vertex `v` by an incoming edge.

NOTE: it may return a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L77-L83' class='documenter-source'>source</a><br>

<a id='Erdos.out_neighbors' href='#Erdos.out_neighbors'>#</a>
**`Erdos.out_neighbors`** &mdash; *Function*.



```
out_neighbors(g::ASimpleGraph, v)
```

Returns an iterable to all neighbors connected to vertex `v` by an outgoing edge.

NOTE: it may return a reference, not a copy. Do not modify result.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L87-L93' class='documenter-source'>source</a><br>

<a id='Erdos.all_neighbors' href='#Erdos.all_neighbors'>#</a>
**`Erdos.all_neighbors`** &mdash; *Function*.



```
all_neighbors(g, v)
```

Iterates over all distinct in/out neighbors of vertex `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L104-L108' class='documenter-source'>source</a><br>

<a id='Erdos.edges' href='#Erdos.edges'>#</a>
**`Erdos.edges`** &mdash; *Function*.



```
edges(g, v)
```

Returns an iterator to the edges in `g` coming from vertex `v`. `v == src(e)` for each returned edge `e`.

It is equivalent to [`out_edges`](core.md#Erdos.out_edges).

For digraphs, use [`all_edges`](core.md#Erdos.all_edges) to iterate over both in and out edges.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L259-L269' class='documenter-source'>source</a><br>


```
edges(g)
```

Returns an iterator to the edges of a graph `g`. The returned iterator is invalidated by changes to `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/edgeiter.jl#L69-L74' class='documenter-source'>source</a><br>

<a id='Erdos.in_edges' href='#Erdos.in_edges'>#</a>
**`Erdos.in_edges`** &mdash; *Function*.



```
in_edges(g, v)
```

Returns an iterator to the edges in `g` going to vertex `v`. `v == dst(e)` for each returned edge `e`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L243-L248' class='documenter-source'>source</a><br>

<a id='Erdos.out_edges' href='#Erdos.out_edges'>#</a>
**`Erdos.out_edges`** &mdash; *Function*.



```
out_edges(g, v)
```

Returns an iterator to the edges in `g` coming from vertex `v`. `v == src(e)` for each returned edge `e`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L251-L256' class='documenter-source'>source</a><br>

<a id='Erdos.all_edges' href='#Erdos.all_edges'>#</a>
**`Erdos.all_edges`** &mdash; *Function*.



```
all_edges(g, v)
```

Iterates over all in and out edges of vertex `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L272-L276' class='documenter-source'>source</a><br>

<a id='Erdos.swap_vertices!' href='#Erdos.swap_vertices!'>#</a>
**`Erdos.swap_vertices!`** &mdash; *Function*.



```
swap_vertices!(g, u, v)
```

Swap the labels of vertices `u` and `v` In the new graph all old neighbors of vertex `n` will be neighbors of `v` and viceversa.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L385-L391' class='documenter-source'>source</a><br>

<a id='Erdos.has_vertex' href='#Erdos.has_vertex'>#</a>
**`Erdos.has_vertex`** &mdash; *Function*.



```
has_vertex(g, v)
```

Return true if `v` is a vertex of `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L43-L47' class='documenter-source'>source</a><br>

<a id='Erdos.is_directed' href='#Erdos.is_directed'>#</a>
**`Erdos.is_directed`** &mdash; *Function*.



```
is_directed(g)
```

Check if `g` a graph with directed edges.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L57-L61' class='documenter-source'>source</a><br>

<a id='Base.reverse' href='#Base.reverse'>#</a>
**`Base.reverse`** &mdash; *Function*.



```
reverse(e)
```

Returns an edge with swapped `src(e)` and `dst(e)`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L160-L164' class='documenter-source'>source</a><br>


```
reverse(g::ADiGraph)
```

Produces a graph where all edges are reversed from the original.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L281-L286' class='documenter-source'>source</a><br>


```
reverse(e::Edge)
```

Swap `e.src` and `e.dst`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/edge.jl#L52-L56' class='documenter-source'>source</a><br>

<a id='Base.reverse!' href='#Base.reverse!'>#</a>
**`Base.reverse!`** &mdash; *Function*.



```
reverse!(g::DiGraph)
```

In-place reverse (modifies the original graph).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L295-L299' class='documenter-source'>source</a><br>

<a id='Erdos.is_ordered' href='#Erdos.is_ordered'>#</a>
**`Erdos.is_ordered`** &mdash; *Function*.



```
is_ordered(e)
```

Returns  `src(e) <= dst(e)`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/edge.jl#L4-L8' class='documenter-source'>source</a><br>

<a id='Erdos.adjacency_list' href='#Erdos.adjacency_list'>#</a>
**`Erdos.adjacency_list`** &mdash; *Function*.



```
adjacency_list(g::AGraph)
adjacency_list(g::ADiGraph, dir=:out)
```

Returns the adjacency list `a` of a graph (a vector of vector of ints). The `i`-th element of the adjacency list is a vector containing the neighbors of `i` in `g`.

For directed graphs a second optional argument can be specified (`:out` or `:in`). The neighbors in the returned adjacency list are considered accordingly as those related through outgoing or incoming edges.

The elements of  `a[i]` have the same order as in the iterator `(out_/in_)neighbors(g,i)`.

*Attention*: For some graph types it returns a reference, not a copy, therefore the returned object should not be modified.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L8-L23' class='documenter-source'>source</a><br>

<a id='Erdos.clean_vertex!' href='#Erdos.clean_vertex!'>#</a>
**`Erdos.clean_vertex!`** &mdash; *Function*.



```
clean_vertex!(g, v)
```

Remove all incident edges on vertex `v` in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L124-L128' class='documenter-source'>source</a><br>

<a id='Erdos.density' href='#Erdos.density'>#</a>
**`Erdos.density`** &mdash; *Function*.



```
density(g)
```

Density is defined as the ratio of the number of actual edges to the number of possible edges. This is $|v| |v-1|$ for directed graphs and $(|v| |v-1|) / 2$ for undirected graphs.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L114-L120' class='documenter-source'>source</a><br>

<a id='Erdos.vertices' href='#Erdos.vertices'>#</a>
**`Erdos.vertices`** &mdash; *Function*.



```
vertices(g)
```

Returns an iterator to the vertices of a graph (i.e. 1:nv(g))


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/core.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='Erdos.has_self_loops' href='#Erdos.has_self_loops'>#</a>
**`Erdos.has_self_loops`** &mdash; *Function*.



```
has_self_loops(g)
```

Returns true if `g` has any self loops.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/misc.jl#L19-L23' class='documenter-source'>source</a><br>

<a id='Erdos.num_self_loops' href='#Erdos.num_self_loops'>#</a>
**`Erdos.num_self_loops`** &mdash; *Function*.



```
num_self_loops(g)
```

Returns the number of self loops in `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/misc.jl#L26-L30' class='documenter-source'>source</a><br>

<a id='Erdos.is_graphical' href='#Erdos.is_graphical'>#</a>
**`Erdos.is_graphical`** &mdash; *Function*.



```
is_graphical(degs::Vector{Int})
```

Check whether the degree sequence `degs` is graphical, according to [Erdös-Gallai condition](http://mathworld.wolfram.com/GraphicSequence.html).

Time complexity: O(length(degs)^2)


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/misc.jl#L1-L8' class='documenter-source'>source</a><br>

<a id='Erdos.graph' href='#Erdos.graph'>#</a>
**`Erdos.graph`** &mdash; *Function*.



```
graph{G<:AGraph}(n, edgelist::Vector{Tuple{Int,Int}},
    G = Graph)
```

Build a graph with `n` vertices, type `G`, and given `edgelist`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/smallgraphs.jl#L4-L9' class='documenter-source'>source</a><br>


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

<a id='Erdos.digraph' href='#Erdos.digraph'>#</a>
**`Erdos.digraph`** &mdash; *Function*.



```
digraph{G<:AGraph}(n, edgelist::Vector{Tuple{Int,Int}},
    G = Graph)
```

Build a digraph with `n` vertices, type `G`, and given `edgelist`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/smallgraphs.jl#L20-L25' class='documenter-source'>source</a><br>


```
digraph(s::Symbol, G = DiGraph)
```

Creates a notorious digraph `s` of type `G`. Admissible values for `s` are:

| `s`                   | graph type                                                                                              |
|:--------------------- |:------------------------------------------------------------------------------------------------------- |
| :truncatedtetrahedron | A skeleton of the [truncated tetrahedron digraph](https://en.wikipedia.org/wiki/Truncated_tetrahedron). |


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/generators/smallgraphs.jl#L98-L107' class='documenter-source'>source</a><br>

<a id='Erdos.edgetype' href='#Erdos.edgetype'>#</a>
**`Erdos.edgetype`** &mdash; *Function*.



```
edgetype(g)
edgetype(G)
```

Returns the type of edges of graph `g` (or graph type `G`), i. e. the element type returned of the iterator `edges(g)`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L105-L111' class='documenter-source'>source</a><br>

<a id='Erdos.vertextype' href='#Erdos.vertextype'>#</a>
**`Erdos.vertextype`** &mdash; *Function*.



```
vertextype(g)
vertextype(G)
```

Returns the integer type of vertices of graph `g` (or graph type `G`).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L115-L120' class='documenter-source'>source</a><br>

<a id='Erdos.graphtype' href='#Erdos.graphtype'>#</a>
**`Erdos.graphtype`** &mdash; *Function*.



```
graphtype{G<:ASimpleGraph}(::Type{G})
```

The graph type corresponding to `G`. If `G<:AGraph` returns `G`, if `G<:ADiGraph` returns a type `H<:AGraph`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L123-L128' class='documenter-source'>source</a><br>

<a id='Erdos.digraphtype' href='#Erdos.digraphtype'>#</a>
**`Erdos.digraphtype`** &mdash; *Function*.



```
digraphtype{G<:ASimpleGraph}(::Type{G})
```

The digraph type corresponding to `G`. If `G<:ADiGraph` returns `G`, if `G<:AGraph` returns a type `H<:ADiGraph`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/core/interface.jl#L131-L136' class='documenter-source'>source</a><br>

