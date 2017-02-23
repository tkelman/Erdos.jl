
<a id='Shortest-Path-Algorithms-1'></a>

# Shortest-Path Algorithms


<a id='General-properties-of-shortest-path-algorithms-1'></a>

## General properties of shortest path algorithms


  * The distance from a vertex to itself is always `0`.
  * The distance between two vertices with no connecting edge is always `Inf`.


<!–- TODO separate in paragraphs? TODO remove mincut


<a id='Shortest-Path-Algorithms-2'></a>

# Shortest-Path Algorithms

<a id='Erdos.enumerate_paths-Tuple{Erdos.AbstractPathState,Any}' href='#Erdos.enumerate_paths-Tuple{Erdos.AbstractPathState,Any}'>#</a>
**`Erdos.enumerate_paths`** &mdash; *Method*.



```
enumerate_paths(state::AbstractPathState)
enumerate_paths(state::AbstractPathState, dest)
```

Given a path state `state` of type `AbstractPathState` (see below), returns a vector (indexed by vertex) of the paths between the source vertex used to compute the path state and a destination vertex `v`, a set of destination vertices `vs`, or the entire graph. For multiple destination vertices, each path is represented by a vector of vertices on the path between the source and the destination. Nonexistent paths will be indicated by an empty vector. For single destinations, the path is represented by a single vector of vertices, and will be length 0 if the path does not exist.

For Floyd-Warshall path states, please note that the output is a bit different, since this algorithm calculates all shortest paths for all pairs of vertices: `enumerate_paths(state)` will return a vector (indexed by source vertex) of vectors (indexed by destination vertex) of paths. `enumerate_paths(state, v)` will return a vector (indexed by destination vertex) of paths from source `v` to all other vertices. In addition, `enumerate_paths(state, v, d)` will return a vector representing the path from vertex `v` to vertex `d`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/shortestpaths.jl#L16-L36' class='documenter-source'>source</a><br>

<a id='Erdos.shortest_paths-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Vararg{Any,N}}' href='#Erdos.shortest_paths-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Vararg{Any,N}}'>#</a>
**`Erdos.shortest_paths`** &mdash; *Method*.



```
shortest_paths(g, x...; kws...)
```

Computes shortest paths using Dijkstra's algorithm. See [`dijkstra_shortest_paths`](ref).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/shortestpaths.jl#L8-L13' class='documenter-source'>source</a><br>

<a id='Erdos.a_star' href='#Erdos.a_star'>#</a>
**`Erdos.a_star`** &mdash; *Function*.



```
a_star(g, s, t, distmx=ConstEdgeMap(g,1), heuristic = n->0)
```

Computes the shortest path between vertices `s` and `t` using the [A* search algorithm](http://en.wikipedia.org/wiki/A%2A_search_algorithm). An optional heuristic function and edge distance matrix may be supplied. Returns an empty path if there are no such paths.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/astar.jl#L45-L52' class='documenter-source'>source</a><br>

<a id='Erdos.bellman_ford_shortest_paths-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},AbstractArray{Int64,1},Erdos.AEdgeMap{E,T<:Real}}' href='#Erdos.bellman_ford_shortest_paths-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},AbstractArray{Int64,1},Erdos.AEdgeMap{E,T<:Real}}'>#</a>
**`Erdos.bellman_ford_shortest_paths`** &mdash; *Method*.



```
bellman_ford_shortest_paths(g, s, distmx=ConstEdgeMap(g,1))
bellman_ford_shortest_paths(g, sources, distmx=ConstEdgeMap(g,1))
```

Uses the [Bellman-Ford algorithm](http://en.wikipedia.org/wiki/Bellman–Ford_algorithm) to compute shortest paths of all vertices of a `g` from a source vertex `s` (or a set of source vertices `sources`). Returns a `BellmanFordState` with relevant traversal information.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/bellman-ford.jl#L21-L28' class='documenter-source'>source</a><br>

<a id='Erdos.dijkstra_shortest_paths' href='#Erdos.dijkstra_shortest_paths'>#</a>
**`Erdos.dijkstra_shortest_paths`** &mdash; *Function*.



```
dijkstra_shortest_paths(g, s, distmx=ConstEdgeMap(g,1); allpaths=false)
dijkstra_shortest_paths(g, sources, distmx=ConstEdgeMap(g,1); allpaths=false)
```

Performs [Dijkstra's algorithm](http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) on a graph, computing shortest distances between a source vertex `s` (or a vector `sources`)  and all other veritces. Returns a `DijkstraState` that contains various traversal information.

With `allpaths=true`, returns a `DijkstraState` that keeps track of all predecessors of a given vertex.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/dijkstra.jl#L17-L28' class='documenter-source'>source</a><br>

<a id='Erdos.floyd_warshall_shortest_paths' href='#Erdos.floyd_warshall_shortest_paths'>#</a>
**`Erdos.floyd_warshall_shortest_paths`** &mdash; *Function*.



```
floyd_warshall_shortest_paths(g, distmx=ConstEdgeMap(g,1))
```

Uses the [Floyd-Warshall algorithm](http://en.wikipedia.org/wiki/Floyd–Warshall_algorithm) to compute shortest paths between all pairs of vertices in graph `g`. Returns a `FloydWarshallState` with relevant traversal information, each is a vertex-indexed vector of vectors containing the metric for each vertex in the graph.

Note that this algorithm may return a large amount of data (it will allocate on the order of $O(nv^2)$).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/floyd-warshall.jl#L10-L21' class='documenter-source'>source</a><br>


–->

<a id='Erdos.a_star' href='#Erdos.a_star'>#</a>
**`Erdos.a_star`** &mdash; *Function*.



```
a_star(g, s, t, distmx=ConstEdgeMap(g,1), heuristic = n->0)
```

Computes the shortest path between vertices `s` and `t` using the [A* search algorithm](http://en.wikipedia.org/wiki/A%2A_search_algorithm). An optional heuristic function and edge distance matrix may be supplied. Returns an empty path if there are no such paths.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/astar.jl#L45-L52' class='documenter-source'>source</a><br>

<a id='Erdos.dijkstra_shortest_paths' href='#Erdos.dijkstra_shortest_paths'>#</a>
**`Erdos.dijkstra_shortest_paths`** &mdash; *Function*.



```
dijkstra_shortest_paths(g, s, distmx=ConstEdgeMap(g,1); allpaths=false)
dijkstra_shortest_paths(g, sources, distmx=ConstEdgeMap(g,1); allpaths=false)
```

Performs [Dijkstra's algorithm](http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) on a graph, computing shortest distances between a source vertex `s` (or a vector `sources`)  and all other veritces. Returns a `DijkstraState` that contains various traversal information.

With `allpaths=true`, returns a `DijkstraState` that keeps track of all predecessors of a given vertex.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/dijkstra.jl#L17-L28' class='documenter-source'>source</a><br>

<a id='Erdos.bellman_ford_shortest_paths' href='#Erdos.bellman_ford_shortest_paths'>#</a>
**`Erdos.bellman_ford_shortest_paths`** &mdash; *Function*.



```
bellman_ford_shortest_paths(g, s, distmx=ConstEdgeMap(g,1))
bellman_ford_shortest_paths(g, sources, distmx=ConstEdgeMap(g,1))
```

Uses the [Bellman-Ford algorithm](http://en.wikipedia.org/wiki/Bellman–Ford_algorithm) to compute shortest paths of all vertices of a `g` from a source vertex `s` (or a set of source vertices `sources`). Returns a `BellmanFordState` with relevant traversal information.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/bellman-ford.jl#L21-L28' class='documenter-source'>source</a><br>

<a id='Erdos.floyd_warshall_shortest_paths' href='#Erdos.floyd_warshall_shortest_paths'>#</a>
**`Erdos.floyd_warshall_shortest_paths`** &mdash; *Function*.



```
floyd_warshall_shortest_paths(g, distmx=ConstEdgeMap(g,1))
```

Uses the [Floyd-Warshall algorithm](http://en.wikipedia.org/wiki/Floyd–Warshall_algorithm) to compute shortest paths between all pairs of vertices in graph `g`. Returns a `FloydWarshallState` with relevant traversal information, each is a vertex-indexed vector of vectors containing the metric for each vertex in the graph.

Note that this algorithm may return a large amount of data (it will allocate on the order of $O(nv^2)$).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/floyd-warshall.jl#L10-L21' class='documenter-source'>source</a><br>


<a id='Path-discovery-/-enumeration-1'></a>

## Path discovery / enumeration

<a id='Erdos.enumerate_paths' href='#Erdos.enumerate_paths'>#</a>
**`Erdos.enumerate_paths`** &mdash; *Function*.



```
enumerate_paths(state::AbstractPathState)
enumerate_paths(state::AbstractPathState, dest)
```

Given a path state `state` of type `AbstractPathState` (see below), returns a vector (indexed by vertex) of the paths between the source vertex used to compute the path state and a destination vertex `v`, a set of destination vertices `vs`, or the entire graph. For multiple destination vertices, each path is represented by a vector of vertices on the path between the source and the destination. Nonexistent paths will be indicated by an empty vector. For single destinations, the path is represented by a single vector of vertices, and will be length 0 if the path does not exist.

For Floyd-Warshall path states, please note that the output is a bit different, since this algorithm calculates all shortest paths for all pairs of vertices: `enumerate_paths(state)` will return a vector (indexed by source vertex) of vectors (indexed by destination vertex) of paths. `enumerate_paths(state, v)` will return a vector (indexed by destination vertex) of paths from source `v` to all other vertices. In addition, `enumerate_paths(state, v, d)` will return a vector representing the path from vertex `v` to vertex `d`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/shortestpaths/shortestpaths.jl#L16-L36' class='documenter-source'>source</a><br>


For Floyd-Warshall path states, please note that the output is a bit different, since this algorithm calculates all shortest paths for all pairs of vertices: `enumerate_paths(state)` will return a vector (indexed by source vertex) of vectors (indexed by destination vertex) of paths. `enumerate_paths(state, v)` will return a vector (indexed by destination vertex) of paths from source `v` to all other vertices. In addition, `enumerate_paths(state, v, d)` will return a vector representing the path from vertex `v` to vertex `d`.


<a id='Path-States-1'></a>

## Path States


The `floyd_warshall_shortest_paths`, `bellman_ford_shortest_paths`, `dijkstra_shortest_paths`, and `dijkstra_predecessor_and_distance` functions return a state that contains various information about the graph learned during traversal. The three state types have the following common information, accessible via the type:


`.dists` Holds a vector of distances computed, indexed by source vertex.


`.parents` Holds a vector of parents of each source vertex. The parent of a source vertex is always `0`.


In addition, the `dijkstra_predecessor_and_distance` function stores the following information:


`.predecessors` Holds a vector, indexed by vertex, of all the predecessors discovered during shortest-path calculations. This keeps track of all parents when there are multiple shortest paths available from the source.


`.pathcounts` Holds a vector, indexed by vertex, of the path counts discovered during traversal. This equals the length of each subvector in the `.predecessors` output above.

