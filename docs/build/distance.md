
<a id='Distance-1'></a>

# Distance


*FatGraphs.jl* includes the following distance measurements:

<a id='FatGraphs.center-Tuple{Array{T,1}}' href='#FatGraphs.center-Tuple{Array{T,1}}'>#</a>
**`FatGraphs.center`** &mdash; *Method*.



Returns the set of all vertices whose eccentricity is equal to the graph's radius (that is, the set of vertices with the smallest eccentricity).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/distance.jl#L79-L82' class='documenter-source'>source</a><br>

<a id='FatGraphs.diameter-Tuple{Array{T,1}}' href='#FatGraphs.diameter-Tuple{Array{T,1}}'>#</a>
**`FatGraphs.diameter`** &mdash; *Method*.



Returns the maximum eccentricity of the graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/distance.jl#L57' class='documenter-source'>source</a><br>

<a id='FatGraphs.eccentricity' href='#FatGraphs.eccentricity'>#</a>
**`FatGraphs.eccentricity`** &mdash; *Function*.



Calculates the eccentricity[ies] of a vertex `v`, vertex vector `vs`, or the entire graph. An optional matrix of edge distances may be supplied.

The eccentricity of a vertex is the maximum shortest-path distance between it and all other vertices in the graph.

Because this function must calculate shortest paths for all vertices supplied in the argument list, it may take a long time.

The output is either a single float (when a single vertex is provided) or a vector of floats corresponding to the vertex vector. If no vertex vector is provided, the vector returned corresponds to each vertex in the graph.

Note: the eccentricity vector returned by `eccentricity()` may be used as input for the rest of the distance measures below. If an eccentricity vector is provided, it will be used. Otherwise, an eccentricity vector will be calculated for each call to the function. It may therefore be more efficient to calculate, store, and pass the eccentricities if multiple distance measures are desired.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/distance.jl#L16-L35' class='documenter-source'>source</a><br>

<a id='FatGraphs.periphery-Tuple{Array{T,1}}' href='#FatGraphs.periphery-Tuple{Array{T,1}}'>#</a>
**`FatGraphs.periphery`** &mdash; *Method*.



Returns the set of all vertices whose eccentricity is equal to the graph's diameter (that is, the set of vertices with the largest eccentricity).


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/distance.jl#L62-L65' class='documenter-source'>source</a><br>

<a id='FatGraphs.radius-Tuple{Array{T,1}}' href='#FatGraphs.radius-Tuple{Array{T,1}}'>#</a>
**`FatGraphs.radius`** &mdash; *Method*.



Returns the minimum eccentricity of the graph.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/distance.jl#L74' class='documenter-source'>source</a><br>

<a id='FatGraphs.BoundedMinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}' href='#FatGraphs.BoundedMinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}'>#</a>
**`FatGraphs.BoundedMinkowskiCost`** &mdash; *Method*.



Similar to MinkowskiCost, but ensures costs smaller than 2τ.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/edit_distance.jl#L122-L124' class='documenter-source'>source</a><br>

<a id='FatGraphs.MinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}' href='#FatGraphs.MinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}'>#</a>
**`FatGraphs.MinkowskiCost`** &mdash; *Method*.



For labels μ₁ on the vertices of graph G₁ and labels μ₂ on the vertices of graph G₂, compute the p-norm cost of substituting vertex u ∈ G₁ by vertex v ∈ G₂.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/edit_distance.jl#L113-L117' class='documenter-source'>source</a><br>

<a id='FatGraphs.edit_distance-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}' href='#FatGraphs.edit_distance-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Union{FatGraphs.ADiGraph,FatGraphs.AGraph}}'>#</a>
**`FatGraphs.edit_distance`** &mdash; *Method*.



```
edit_distance(G₁, G₂;
       insert_cost::Function=v->1.0,
       delete_cost::Function=u->1.0,
       subst_cost::Function=(u,v)->0.5,
       heuristic::Function=DefaultEditHeuristic)
```

Computes the edit distance between graphs G₁ and G₂.

Returns the minimum edit cost and edit path to transform graph G₁ into graph G₂. An edit path consists of a sequence of pairs of vertices (u,v) ∈ [0,|G₁|] × [0,|G₂|] representing vertex operations:

  * (0,v): insertion of vertex v ∈ G₂
  * (u,0): deletion of vertex u ∈ G₁
  * (u>0,v>0): substitution of vertex u ∈ G₁ by vertex v ∈ G₂

By default, the algorithm uses constant operation costs. The user can provide classical Minkowski costs computed from vertex labels μ₁ (for G₁) and μ₂ (for G₂) in order to further guide the search, for example:

```
edit_distance(G₁, G₂, subst_cost=MinkowskiCost(μ₁, μ₂))
```

A custom heuristic can be provided to the A* search in case the default heuristic is not satisfactory. Performance tips: ––––––––-

  * Given two graphs $|G₁| < |G₂|$, `edit_distance(G₁, G₂)` is faster to

compute than `edit_distance(G₂, G₁)`. Consider swapping the arguments if involved costs are `symmetric`.

  * The use of simple Minkowski costs can improve performance considerably.
  * Exploit vertex attributes when designing operation costs.

For further details, please refer to:

RIESEN, K., 2015. Structural Pattern Recognition with Graph Edit Distance: Approximation Algorithms and Applications. (Chapter 2)

Author: Júlio Hoffimann Mendes (juliohm@stanford.edu)


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/distances/edit_distance.jl#L1-L42' class='documenter-source'>source</a><br>

