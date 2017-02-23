
<a id='Distance-1'></a>

# Distance


*Erdos.jl* includes the following distance measurements:

<a id='Erdos.center-Tuple{Array{T,1}}' href='#Erdos.center-Tuple{Array{T,1}}'>#</a>
**`Erdos.center`** &mdash; *Method*.



```
center(g, distmx=ConstEdgeMap(g,1))
center(all_ecc)
```

Returns the set of all vertices whose eccentricity is equal to the graph's radius (that is, the set of vertices with the smallest eccentricity).

Eventually a vector `all_ecc` contain the eccentricity of each node can be passed as argument.

See [`eccentricities`](distance.md#Erdos.eccentricities).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/distance.jl#L94-L105' class='documenter-source'>source</a><br>

<a id='Erdos.diameter' href='#Erdos.diameter'>#</a>
**`Erdos.diameter`** &mdash; *Function*.



```
diameter(g, distmx=ConstEdgeMap(g,1))
```

Returns the maximum distance between any two vertices in `g`. Distances  between two adjacent nodes are given by `distmx`.

See also [`eccentricities`](distance.md#Erdos.eccentricities), [`radius`](distance.md#Erdos.radius).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/distance.jl#L51-L58' class='documenter-source'>source</a><br>

<a id='Erdos.eccentricities' href='#Erdos.eccentricities'>#</a>
**`Erdos.eccentricities`** &mdash; *Function*.



```
eccentricities(g, distmx=ConstEdgeMap(g,1))
eccentricities(g, vs, distmx=ConstEdgeMap(g,1))
```

Returns `[eccentricity(g,v,distmx) for v in vs]`. When `vs` it is not supplied, considers all node in the graph.

See also [`eccentricity`](distance.md#Erdos.eccentricity).

Note: the eccentricity vector returned by `eccentricity` may be eventually used as input in some eccentricity related measures ([`periphery`](distance.md#Erdos.periphery-Tuple{Array{T,1}}), [`center`](distance.md#Erdos.center-Tuple{Array{T,1}})).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/distance.jl#L25-L37' class='documenter-source'>source</a><br>

<a id='Erdos.eccentricity' href='#Erdos.eccentricity'>#</a>
**`Erdos.eccentricity`** &mdash; *Function*.



```
eccentricity(g, v, distmx=ConstEdgeMap(g,1))
```

Calculates the eccentricity[ies] of a vertex `v`, An optional matrix of edge distances may be supplied.

The eccentricity of a vertex is the maximum shortest-path distance between it and all other vertices in the graph.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/distance.jl#L5-L13' class='documenter-source'>source</a><br>

<a id='Erdos.periphery-Tuple{Array{T,1}}' href='#Erdos.periphery-Tuple{Array{T,1}}'>#</a>
**`Erdos.periphery`** &mdash; *Method*.



```
periphery(g, distmx=ConstEdgeMap(g,1))
periphery(all_ecc)
```

Returns the set of all vertices whose eccentricity is equal to the graph's diameter (that is, the set of vertices with the largest eccentricity).

Eventually a vector `all_ecc` contain the eccentricity of each node can be passed as argument.

See [`eccentricities`](distance.md#Erdos.eccentricities).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/distance.jl#L74-L85' class='documenter-source'>source</a><br>

<a id='Erdos.radius' href='#Erdos.radius'>#</a>
**`Erdos.radius`** &mdash; *Function*.



```
radius(g, distmx=ConstEdgeMap(g,1))
```

Returns the minimum distance between any two vertices in `g`. Distances  between two adjacent nodes are given by `distmx`.

See [`eccentricities`](distance.md#Erdos.eccentricities), [`diameter`](distance.md#Erdos.diameter).


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/distance.jl#L63-L70' class='documenter-source'>source</a><br>

<a id='Erdos.BoundedMinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}' href='#Erdos.BoundedMinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}'>#</a>
**`Erdos.BoundedMinkowskiCost`** &mdash; *Method*.



Similar to MinkowskiCost, but ensures costs smaller than 2τ.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/edit_distance.jl#L122-L124' class='documenter-source'>source</a><br>

<a id='Erdos.MinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}' href='#Erdos.MinkowskiCost-Tuple{AbstractArray{T,1},AbstractArray{T,1}}'>#</a>
**`Erdos.MinkowskiCost`** &mdash; *Method*.



For labels μ₁ on the vertices of graph G₁ and labels μ₂ on the vertices of graph G₂, compute the p-norm cost of substituting vertex u ∈ G₁ by vertex v ∈ G₂.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/edit_distance.jl#L113-L117' class='documenter-source'>source</a><br>

<a id='Erdos.edit_distance-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Union{Erdos.ADiGraph,Erdos.AGraph}}' href='#Erdos.edit_distance-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Union{Erdos.ADiGraph,Erdos.AGraph}}'>#</a>
**`Erdos.edit_distance`** &mdash; *Method*.



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


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/distances/edit_distance.jl#L1-L42' class='documenter-source'>source</a><br>

