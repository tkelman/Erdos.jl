
<a id='Spanning-Trees-1'></a>

# Spanning Trees

<a id='Erdos.count_spanning_trees-Tuple{Erdos.AGraph}' href='#Erdos.count_spanning_trees-Tuple{Erdos.AGraph}'>#</a>
**`Erdos.count_spanning_trees`** &mdash; *Method*.



```
count_spanning_trees(g::AGraph)
```

Returns the number of spanning trees of `g`, computed through [Kirchhoff's theorem](https://en.wikipedia.org/wiki/Kirchhoff%27s_theorem). The return type is a float, since the number can be very large.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/spanningtrees/spanningtrees.jl#L3-L9' class='documenter-source'>source</a><br>

<a id='Erdos.minimum_spanning_tree' href='#Erdos.minimum_spanning_tree'>#</a>
**`Erdos.minimum_spanning_tree`** &mdash; *Function*.



```
minimum_spanning_tree{T<:Real}(
    g, distmx::AbstractMatrix{T} = ConstEdgeMap(g,1)
)
```

Performs [Kruskal's algorithm](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm) on a connected, undirected graph `g`, having adjacency matrix `distmx`, and computes minimum spanning tree. Returns a `Vector{KruskalHeapEntry}`, that contains the containing edges and its weights.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/spanningtrees/kruskal.jl#L22-L31' class='documenter-source'>source</a><br>

