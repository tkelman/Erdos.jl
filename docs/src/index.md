# Erdos
Erdos is a graph library written in Julia. Installation is straightforward:
```julia
julia> Pkg.add("Erdos")
```
Erdos defines two abstract type, `AGraph` and `ADiGraph`, from which all
concrete undirected and directed graph types are derived.

All graphs  in Erdos have `1:n` indexed vertices, where `n` is the number of vertices.
Multi-edges are not allowed. Self-edges are experimentally supported. Provided this constraints, new graph types can be easily introduced, just defining a few basic methods.

## Basic examples
### Constructors
Build your first graph using the basic constructors.
```julia
julia> using Erdos

julia> g = CompleteGraph(100)
Graph{Int64}(100, 4950)

julia> g = Graph{Int32}(100)
Graph{Int32}(100, 0)

julia> g = DiGraph()
DiGraph{Int64}(0, 0)

julia> g = erdos_renyi(10,30)
Graph{Int64}(10, 30)

julia> g = random_regular_graph(10,3,seed=17)
Graph{Int64}(10, 15).
```
The default graph and digraph types are `Graph{Int}` and `DiGraph{Int}`.
Use  the `Graph{Int32}` type to save memory if working with very large graphs.

### Queries
```julia
julia> g = CompleteBipartiteGraph(5,10)
Graph{Int64}(15, 50)

julia> is_bipartite(g)
true

julia> nv(g) # number of vertices
15

julia> ne(g) #number of edges
50

julia> has_edge(g,1,2)
false

julia> has_edge(g,1,6)
true

julia> degree(g,1)
10
```

### Modifiers:
```julia
julia> g=DiGraph(10)
DiGraph{Int64}(10, 0)

julia> add_edge!(g,1,2)
true

julia> g
DiGraph{Int64}(10, 1)

# trying to add an edge between non-existen vertices results in a
# (silent) failure
julia> add_edge!(g,1,11)
false

# has the addition of an already existent edge
julia> add_edge!(g,1,2)
false

julia> add_edge!(g,2,1)
true

julia> rem_edge!(g,2,1)
true

# returns the index of the vertex
julia> add_vertex!(g)
11

# vertex removal will cause the switch of the last index
# with the removed one, to keep the indexes continuity.
julia> rem_vertex!(g,1)
true

julia> rem_vertex!(g,12)
false
```
### Iterators
```julia
julia> g = Graph(10,20) #erdos renyi random graph with 10 vertices and 20 edges
Graph{Int64}(10, 20)

julia> numedges = 0;

# iterate over all edges
julia> for e in edges(g)
           i, j = src(e), dst(e) # source and destination of an edge
           @assert i <= j  # default for undirected graphs
           numedge += 1
       end

julia> ne(g) == numedge
true

julia> k=0;

julia> for i in neighbors(g,1)
           @assert has_edge(g, 1, i);
           k += 1
       end

julia> degree(g, 1) == k
true
```
### I/O
Erdos supports many standard graph formats. Here is an example with Pajek's .net
format:
```julia
julia> g = DiGraph(10,20)
DiGraph{Int64}(10, 20)

julia> writegraph("test.net", g)
1

julia> h = readgraph("test.net")
DiGraph{Int64}(10, 20)

julia> g == h
true
```
## Ready to explore
Refer to the documentation to explore all the features of Erdos:
- **core functions:** vertices and edges addition and removal, degree (in/out/histogram), neighbors (in/out/all/common)

- **distance within graphs:** eccentricity, diameter, periphery, radius, center

- **distance between graphs:** spectral_distance, edit_distance

- **connectivity:** strongly- and weakly-connected components, bipartite checks, condensation, attracting components, neighborhood, k-core

- **operators:** complement, reverse, reverse!, union, join, intersect, difference, symmetric difference, blkdiag, induced subgraphs, products (cartesian/scalar)

- **shortest paths:** Dijkstra, Dijkstra with predecessors, Bellman-Ford, Floyd-Warshall, A*

- **small graph generators:** see [smallgraphs.jl](https://github.com/CarloLucibello/Erdos.jl/blob/master/src/datasets/smallgraphs.jl) for a list

- **random graph generators:** Erdős–Rényi, Watts-Strogatz, random regular, arbitrary degree sequence, stochastic block model

- **centrality:** betweenness, closeness, degree, pagerank, Katz

- **traversal operations:** cycle detection, BFS and DFS DAGs, BFS and DFS traversals with visitors, DFS topological sort, maximum adjacency / minimum cut, multiple random walks

- **flow operations:** maximum flow, minimum s-t cut

- **matching:** maximum weight matching on arbitrary graphs (through BlossomV algorithm)

- **dismantling:** collective influencer heuristic

- **clique enumeration:** maximal cliques

- **linear algebra / spectral graph theory:** adjacency matrix, Laplacian matrix, non-backtracking matrix

- **community:** modularity, community detection, core-periphery, clustering coefficients

- **I/O formats:** [graphml](http://en.wikipedia.org/wiki/GraphML), [gml](https://en.wikipedia.org/wiki/Graph_Modelling_Language), [gexf](http://gexf.net/format), [dot](https://en.wikipedia.org/wiki/DOT_(graph_description_language)), [net](http://gephi.org/users/supported-graph-formats/pajek-net-format/), [gt](https://graph-tool.skewed.de/static/doc/gt_format.html)
