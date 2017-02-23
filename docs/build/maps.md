
<a id='Maps-1'></a>

# Maps


Arbitrary values can be associated to a graph's vertices and edges, and handed over to method's that necessitate them, thanks to the edge maps and vertex maps interfaces.


<a id='Edge-Maps-1'></a>

## Edge Maps

<a id='Erdos.AEdgeMap' href='#Erdos.AEdgeMap'>#</a>
**`Erdos.AEdgeMap`** &mdash; *Type*.



```
AEdgeMap{E,T}
```

Type representing an abstract vertex map.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/edgemap.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='Erdos.ConstEdgeMap' href='#Erdos.ConstEdgeMap'>#</a>
**`Erdos.ConstEdgeMap`** &mdash; *Type*.



```
immutable ConstEdgeMap{T} <: SimpleEdgeMap{T}
    val::T
end
```

A type representing a constant vector map. Any attempt to change the internal value, e.g. `emap[u,v] = 4`, will fail silently.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/edgemap.jl#L87-L95' class='documenter-source'>source</a><br>

<a id='Erdos.EdgeMap' href='#Erdos.EdgeMap'>#</a>
**`Erdos.EdgeMap`** &mdash; *Type*.



```
type EdgeMap{E,T,D} <: AEdgeMap{E,T}
    data::D
    etype::Type{E}
    vtype::Type{T}
end
```

Type implementing an edge map. The underlying container `data` can be a `Dict` or an `AbstractMatrix`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/edgemap.jl#L10-L19' class='documenter-source'>source</a><br>

<a id='Erdos.EdgeMap-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Type{T}}' href='#Erdos.EdgeMap-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Type{T}}'>#</a>
**`Erdos.EdgeMap`** &mdash; *Method*.



```
EdgeMap{T}(g, ::Type{T})
```

Returns a map that associates values of type `T` to the vertices of  graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/edgemap.jl#L30-L35' class='documenter-source'>source</a><br>


<a id='Vertex-Maps-1'></a>

## Vertex Maps


Any `AbstractVector{T}` or `Dict{Int,T}` can be used as a vertex map.

<a id='Erdos.AVertexMap' href='#Erdos.AVertexMap'>#</a>
**`Erdos.AVertexMap`** &mdash; *Constant*.



```
typealias AVertexMap{V,T} Union{AbstractVector{T}, Dict{V,T}}
```

Type representing an abstract vertex map.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/vertexmap.jl#L1-L5' class='documenter-source'>source</a><br>

<a id='Erdos.ConstVertexMap' href='#Erdos.ConstVertexMap'>#</a>
**`Erdos.ConstVertexMap`** &mdash; *Type*.



```
immutable ConstVertexMap{T} <: AbstractVector{T}
    val::T
end
```

A type representing a constant vector map. Any attempt to change the internal value, e.g. `vm[1] = 4`, will fail silently.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/vertexmap.jl#L27-L35' class='documenter-source'>source</a><br>

<a id='Erdos.VertexMap-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Type{T}}' href='#Erdos.VertexMap-Tuple{Union{Erdos.ADiGraph,Erdos.AGraph},Type{T}}'>#</a>
**`Erdos.VertexMap`** &mdash; *Method*.



```
VertexMap{T}(g, ::Type{T})
```

Returns a map that associates values of type `T` to the vertices of  graph `g`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/vertexmap.jl#L16-L21' class='documenter-source'>source</a><br>

<a id='Erdos.hasindex-Tuple{AbstractArray{T,1},Integer}' href='#Erdos.hasindex-Tuple{AbstractArray{T,1},Integer}'>#</a>
**`Erdos.hasindex`** &mdash; *Method*.



```
hasindex(v, i::Integer)
```

Check if collection `v` is indexable by `i`


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/maps/vertexmap.jl#L8-L12' class='documenter-source'>source</a><br>

