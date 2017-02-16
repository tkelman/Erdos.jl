
<a id='Maps-1'></a>

# Maps


Arbitrary values can be associated to a graph's vertices and edges, and handed over to method's that necessitate them, thanks to the edge maps and vertex maps interfaces.


<a id='Edge-Maps-1'></a>

## Edge Maps

<a id='FatGraphs.AEdgeMap' href='#FatGraphs.AEdgeMap'>#</a>
**`FatGraphs.AEdgeMap`** &mdash; *Type*.



```
AEdgeMap{E,T}
```

Type representing an abstract vertex map.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/edgemap.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='FatGraphs.ConstEdgeMap' href='#FatGraphs.ConstEdgeMap'>#</a>
**`FatGraphs.ConstEdgeMap`** &mdash; *Type*.



```
immutable ConstEdgeMap{T} <: SimpleEdgeMap{T}
    val::T
end
```

A type representing a constant vector map. Any attempt to change the internal value, e.g. `emap[u,v] = 4`, will fail silently.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/edgemap.jl#L87-L95' class='documenter-source'>source</a><br>

<a id='FatGraphs.EdgeMap' href='#FatGraphs.EdgeMap'>#</a>
**`FatGraphs.EdgeMap`** &mdash; *Type*.



```
type EdgeMap{E,T,D} <: AEdgeMap{E,T}
    data::D
    etype::Type{E}
    vtype::Type{T}
end
```

Type implementing an edge map. The underlying container `data` can be a `Dict` or an `AbstractMatrix`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/edgemap.jl#L10-L19' class='documenter-source'>source</a><br>

<a id='FatGraphs.EdgeMap-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Type{T}}' href='#FatGraphs.EdgeMap-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Type{T}}'>#</a>
**`FatGraphs.EdgeMap`** &mdash; *Method*.



```
EdgeMap{T}(g, ::Type{T})
```

Returns a map that associates values of type `T` to the vertices of  graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/edgemap.jl#L30-L35' class='documenter-source'>source</a><br>


<a id='Vertex-Maps-1'></a>

## Vertex Maps


Any `AbstractVector{T}` or `Dict{Int,T}` can be used as a vertex map.

<a id='FatGraphs.AVertexMap' href='#FatGraphs.AVertexMap'>#</a>
**`FatGraphs.AVertexMap`** &mdash; *Constant*.



```
typealias AVertexMap{V,T} Union{AbstractVector{T}, Dict{V,T}}
```

Type representing an abstract vertex map.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/vertexmap.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='FatGraphs.ConstVertexMap' href='#FatGraphs.ConstVertexMap'>#</a>
**`FatGraphs.ConstVertexMap`** &mdash; *Type*.



```
immutable ConstVertexMap{T} <: AbstractVector{T}
    val::T
end
```

A type representing a constant vector map. Any attempt to change the internal value, e.g. `vm[1] = 4`, will fail silently.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/vertexmap.jl#L27-L35' class='documenter-source'>source</a><br>

<a id='FatGraphs.VertexMap-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Type{T}}' href='#FatGraphs.VertexMap-Tuple{Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Type{T}}'>#</a>
**`FatGraphs.VertexMap`** &mdash; *Method*.



```
VertexMap{T}(g, ::Type{T})
```

Returns a map that associates values of type `T` to the vertices of  graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/vertexmap.jl#L16-L21' class='documenter-source'>source</a><br>

<a id='FatGraphs.hasindex-Tuple{AbstractArray{T,1},Integer}' href='#FatGraphs.hasindex-Tuple{AbstractArray{T,1},Integer}'>#</a>
**`FatGraphs.hasindex`** &mdash; *Method*.



```
hasindex(v, i::Integer)
```

Check if collection `v` is indexable by `i`


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/3353b9fc4efba2b25b118e823a87d0137eb4f743/docs/../src/maps/vertexmap.jl#L8-L12' class='documenter-source'>source</a><br>

