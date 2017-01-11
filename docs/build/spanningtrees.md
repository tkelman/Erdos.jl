
<a id='Spanning-Trees-1'></a>

# Spanning Trees

<a id='FatGraphs.count_spanning_trees-Tuple{FatGraphs.AGraph}' href='#FatGraphs.count_spanning_trees-Tuple{FatGraphs.AGraph}'>#</a>
**`FatGraphs.count_spanning_trees`** &mdash; *Method*.



```
count_spanning_trees(g::AGraph)
```

Returns the number of spanning trees of `g`, computed through [Kirchhoff's theorem](https://en.wikipedia.org/wiki/Kirchhoff%27s_theorem). The return type is a float, since the number can be very large.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/spanningtrees/spanningtrees.jl#L3-L9' class='documenter-source'>source</a><br>

<a id='FatGraphs.minimum_spanning_tree' href='#FatGraphs.minimum_spanning_tree'>#</a>
**`FatGraphs.minimum_spanning_tree`** &mdash; *Function*.



```
minimum_spanning_tree{T<:Real}(
    g, distmx::AbstractArray{T, 2} = DefaultDistance()
)
```

Performs [Kruskal's algorithm](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm) on a connected, undirected graph `g`, having adjacency matrix `distmx`, and computes minimum spanning tree. Returns a `Vector{KruskalHeapEntry}`, that contains the containing edges and its weights.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/spanningtrees/kruskal.jl#L22-L31' class='documenter-source'>source</a><br>

