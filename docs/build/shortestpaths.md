
<a id='Shortest-Path-Algorithms-1'></a>

# Shortest-Path Algorithms


<a id='General-properties-of-shortest-path-algorithms-1'></a>

## General properties of shortest path algorithms


  * The distance from a vertex to itself is always `0`.
  * The distance between two vertices with no connecting edge is always `Inf`.


<!–- TODO separate in paragraphs? TODO remove mincut


<a id='Shortest-Path-Algorithms-2'></a>

# Shortest-Path Algorithms

<a id='FatGraphs.a_star' href='#FatGraphs.a_star'>#</a>
**`FatGraphs.a_star`** &mdash; *Function*.



```
a_star(g, s, t, distmx=DefaultDistance(), heuristic = n->0)
```

Computes the shortest path between vertices `s` and `t` using the [A* search algorithm](http://en.wikipedia.org/wiki/A%2A_search_algorithm). An optional heuristic function and edge distance matrix may be supplied.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/astar.jl#L39-L45' class='documenter-source'>source</a><br>

<a id='FatGraphs.bellman_ford_shortest_paths' href='#FatGraphs.bellman_ford_shortest_paths'>#</a>
**`FatGraphs.bellman_ford_shortest_paths`** &mdash; *Function*.



```
bellman_ford_shortest_paths(g, s, distmx=DefaultDistance())
bellman_ford_shortest_paths(g, sources, distmx=DefaultDistance())
```

Uses the [Bellman-Ford algorithm](http://en.wikipedia.org/wiki/Bellman–Ford_algorithm) to compute shortest paths of all vertices of a `g` from a source vertex `s` (or a set of source vertices `sources`). Returns a `BellmanFordState` with relevant traversal information (see below).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/bellman-ford.jl#L57-L65' class='documenter-source'>source</a><br>

<a id='FatGraphs.enumerate_paths-Tuple{FatGraphs.AbstractPathState,Any}' href='#FatGraphs.enumerate_paths-Tuple{FatGraphs.AbstractPathState,Any}'>#</a>
**`FatGraphs.enumerate_paths`** &mdash; *Method*.



```
enumerate_paths(state::AbstractPathState)
enumerate_paths(state::AbstractPathState, dest)
```

Given a path state `state` of type `AbstractPathState` (see below), returns a vector (indexed by vertex) of the paths between the source vertex used to compute the path state and a destination vertex `v`, a set of destination vertices `vs`, or the entire graph. For multiple destination vertices, each path is represented by a vector of vertices on the path between the source and the destination. Nonexistent paths will be indicated by an empty vector. For single destinations, the path is represented by a single vector of vertices, and will be length 0 if the path does not exist.

For Floyd-Warshall path states, please note that the output is a bit different, since this algorithm calculates all shortest paths for all pairs of vertices: `enumerate_paths(state)` will return a vector (indexed by source vertex) of vectors (indexed by destination vertex) of paths. `enumerate_paths(state, v)` will return a vector (indexed by destination vertex) of paths from source `v` to all other vertices. In addition, `enumerate_paths(state, v, d)` will return a vector representing the path from vertex `v` to vertex `d`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/bellman-ford.jl#L112-L132' class='documenter-source'>source</a><br>

<a id='FatGraphs.dijkstra_shortest_paths' href='#FatGraphs.dijkstra_shortest_paths'>#</a>
**`FatGraphs.dijkstra_shortest_paths`** &mdash; *Function*.



```
dijkstra_shortest_paths(g, s, distmx=DefaultDistance(); allpaths=false)
dijkstra_shortest_paths(g, sources, distmx=DefaultDistance(); allpaths=false)
```

Performs [Dijkstra's algorithm](http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) on a graph, computing shortest distances between a source vertex `s` (or a vector `sources`)  and all other veritces. Returns a `DijkstraState` that contains various traversal information.

With `allpaths=true`, returns a `DijkstraState` that keeps track of all predecessors of a given vertex.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/dijkstra.jl#L17-L28' class='documenter-source'>source</a><br>

<a id='FatGraphs.floyd_warshall_shortest_paths' href='#FatGraphs.floyd_warshall_shortest_paths'>#</a>
**`FatGraphs.floyd_warshall_shortest_paths`** &mdash; *Function*.



```
floyd_warshall_shortest_paths(g, distmx=DefaultDistance())
```

Uses the [Floyd-Warshall algorithm](http://en.wikipedia.org/wiki/Floyd–Warshall_algorithm) to compute shortest paths between all pairs of vertices in graph `g`. Returns a `FloydWarshallState` with relevant traversal information, each is a vertex-indexed vector of vectors containing the metric for each vertex in the graph.

Note that this algorithm may return a large amount of data (it will allocate on the order of $O(nv^2)$).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/floyd-warshall.jl#L10-L21' class='documenter-source'>source</a><br>


–->

<a id='FatGraphs.a_star' href='#FatGraphs.a_star'>#</a>
**`FatGraphs.a_star`** &mdash; *Function*.



```
a_star(g, s, t, distmx=DefaultDistance(), heuristic = n->0)
```

Computes the shortest path between vertices `s` and `t` using the [A* search algorithm](http://en.wikipedia.org/wiki/A%2A_search_algorithm). An optional heuristic function and edge distance matrix may be supplied.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/astar.jl#L39-L45' class='documenter-source'>source</a><br>

<a id='FatGraphs.dijkstra_shortest_paths' href='#FatGraphs.dijkstra_shortest_paths'>#</a>
**`FatGraphs.dijkstra_shortest_paths`** &mdash; *Function*.



```
dijkstra_shortest_paths(g, s, distmx=DefaultDistance(); allpaths=false)
dijkstra_shortest_paths(g, sources, distmx=DefaultDistance(); allpaths=false)
```

Performs [Dijkstra's algorithm](http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) on a graph, computing shortest distances between a source vertex `s` (or a vector `sources`)  and all other veritces. Returns a `DijkstraState` that contains various traversal information.

With `allpaths=true`, returns a `DijkstraState` that keeps track of all predecessors of a given vertex.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/dijkstra.jl#L17-L28' class='documenter-source'>source</a><br>

<a id='FatGraphs.bellman_ford_shortest_paths' href='#FatGraphs.bellman_ford_shortest_paths'>#</a>
**`FatGraphs.bellman_ford_shortest_paths`** &mdash; *Function*.



```
bellman_ford_shortest_paths(g, s, distmx=DefaultDistance())
bellman_ford_shortest_paths(g, sources, distmx=DefaultDistance())
```

Uses the [Bellman-Ford algorithm](http://en.wikipedia.org/wiki/Bellman–Ford_algorithm) to compute shortest paths of all vertices of a `g` from a source vertex `s` (or a set of source vertices `sources`). Returns a `BellmanFordState` with relevant traversal information (see below).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/bellman-ford.jl#L57-L65' class='documenter-source'>source</a><br>

<a id='FatGraphs.floyd_warshall_shortest_paths' href='#FatGraphs.floyd_warshall_shortest_paths'>#</a>
**`FatGraphs.floyd_warshall_shortest_paths`** &mdash; *Function*.



```
floyd_warshall_shortest_paths(g, distmx=DefaultDistance())
```

Uses the [Floyd-Warshall algorithm](http://en.wikipedia.org/wiki/Floyd–Warshall_algorithm) to compute shortest paths between all pairs of vertices in graph `g`. Returns a `FloydWarshallState` with relevant traversal information, each is a vertex-indexed vector of vectors containing the metric for each vertex in the graph.

Note that this algorithm may return a large amount of data (it will allocate on the order of $O(nv^2)$).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/floyd-warshall.jl#L10-L21' class='documenter-source'>source</a><br>


<a id='Path-discovery-/-enumeration-1'></a>

## Path discovery / enumeration

<a id='FatGraphs.enumerate_paths' href='#FatGraphs.enumerate_paths'>#</a>
**`FatGraphs.enumerate_paths`** &mdash; *Function*.



```
enumerate_paths(state::AbstractPathState)
enumerate_paths(state::AbstractPathState, dest)
```

Given a path state `state` of type `AbstractPathState` (see below), returns a vector (indexed by vertex) of the paths between the source vertex used to compute the path state and a destination vertex `v`, a set of destination vertices `vs`, or the entire graph. For multiple destination vertices, each path is represented by a vector of vertices on the path between the source and the destination. Nonexistent paths will be indicated by an empty vector. For single destinations, the path is represented by a single vector of vertices, and will be length 0 if the path does not exist.

For Floyd-Warshall path states, please note that the output is a bit different, since this algorithm calculates all shortest paths for all pairs of vertices: `enumerate_paths(state)` will return a vector (indexed by source vertex) of vectors (indexed by destination vertex) of paths. `enumerate_paths(state, v)` will return a vector (indexed by destination vertex) of paths from source `v` to all other vertices. In addition, `enumerate_paths(state, v, d)` will return a vector representing the path from vertex `v` to vertex `d`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/shortestpaths/bellman-ford.jl#L112-L132' class='documenter-source'>source</a><br>


For Floyd-Warshall path states, please note that the output is a bit different, since this algorithm calculates all shortest paths for all pairs of vertices: `enumerate_paths(state)` will return a vector (indexed by source vertex) of vectors (indexed by destination vertex) of paths. `enumerate_paths(state, v)` will return a vector (indexed by destination vertex) of paths from source `v` to all other vertices. In addition, `enumerate_paths(state, v, d)` will return a vector representing the path from vertex `v` to vertex `d`.


<a id='Path-States-1'></a>

## Path States


The `floyd_warshall_shortest_paths`, `bellman_ford_shortest_paths`, `dijkstra_shortest_paths`, and `dijkstra_predecessor_and_distance` functions return a state that contains various information about the graph learned during traversal. The three state types have the following common information, accessible via the type:


`.dists` Holds a vector of distances computed, indexed by source vertex.


`.parents` Holds a vector of parents of each source vertex. The parent of a source vertex is always `0`.


In addition, the `dijkstra_predecessor_and_distance` function stores the following information:


`.predecessors` Holds a vector, indexed by vertex, of all the predecessors discovered during shortest-path calculations. This keeps track of all parents when there are multiple shortest paths available from the source.


`.pathcounts` Holds a vector, indexed by vertex, of the path counts discovered during traversal. This equals the length of each subvector in the `.predecessors` output above.

