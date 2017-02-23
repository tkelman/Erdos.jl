
<a id='Matching-1'></a>

# Matching


Algorithms for optimal network problems.

<a id='Erdos.dismantle_ci-Tuple{Erdos.AGraph,Integer,Integer}' href='#Erdos.dismantle_ci-Tuple{Erdos.AGraph,Integer,Integer}'>#</a>
**`Erdos.dismantle_ci`** &mdash; *Method*.



```
dismantle_ci(g::AGraph, l::Integer, nrem; verbose=false)
```

Applies the Collective Influence (CI) heuristic of Ref. [1]  with distance parameter `l` (tipically `l=3,4`). Removes a maximum of `nrem` vertices from `g`, trying to minimize the size of the maximum connected component of the resulting graph. It stops earlier if the maximum CI goes to zero.

Set `verbose` to `true` for info printing in each iteration.

Returns `(gnew, vmap, remlist)`, where `gnew` is the reduced graph, `vmap` is a vector mapping the vertices of `g` to the old ones (see also [`rem_vertices!`](core.md#Erdos.rem_vertices!)) and `remlist` contains the removed vertices by removal order.

For more fine grained control see [`dismantle_ci_init`](dismantling.md#Erdos.dismantle_ci_init-Tuple{Erdos.AGraph,Integer}) and [`dismantle_ci_oneiter!`](dismantling.md#Erdos.dismantle_ci_oneiter!-Tuple{Erdos.AGraph,Any,Array{Array{T,1},1},Integer}).

**Usage**

```julia
g = Graph(100, 1000)
l=3
nrem=10
gnew, vmap, remlist = dismantle_ci(g, l, nrem)

# or equivalently
gnew, heap, lneigs = dismantle_ci_init(g, l)

for it=1:nrem
    irem = dismantle_ci_oneiter!(gnew, heap, lneigs, l)
    irem <= 0 && break
    push!(remlist, irem)
    println("Size Max Component: ", maximum(length, connected_components(g)))
end
vmap = rem_vertices!(gnew, remlist)
```

[1] Morone F., Makse H. Influence maximization in complex networks through optimal percolation. Nature (2015)


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/dismantling/ci.jl#L1-L40' class='documenter-source'>source</a><br>

<a id='Erdos.dismantle_ci_init-Tuple{Erdos.AGraph,Integer}' href='#Erdos.dismantle_ci_init-Tuple{Erdos.AGraph,Integer}'>#</a>
**`Erdos.dismantle_ci_init`** &mdash; *Method*.



```
dismantle_ci_init(g, l)
```

Initialization part of [`dismantle_ci`](dismantling.md#Erdos.dismantle_ci-Tuple{Erdos.AGraph,Integer,Integer}) algorithm. Returns `(gnew, heap, lneigs)`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/dismantling/ci.jl#L55-L60' class='documenter-source'>source</a><br>

<a id='Erdos.dismantle_ci_oneiter!-Tuple{Erdos.AGraph,Any,Array{Array{T,1},1},Integer}' href='#Erdos.dismantle_ci_oneiter!-Tuple{Erdos.AGraph,Any,Array{Array{T,1},1},Integer}'>#</a>
**`Erdos.dismantle_ci_oneiter!`** &mdash; *Method*.



```
dismantle_ci_oneiter!(g, heap, lneigs, l)
```

One step of [`dismantle_ci`](dismantling.md#Erdos.dismantle_ci-Tuple{Erdos.AGraph,Integer,Integer}) algorithm. To be called after [`dismantle_ci_init`](dismantling.md#Erdos.dismantle_ci_init-Tuple{Erdos.AGraph,Integer}) Returns the cleaned vertex if any (see [`clean_vertex!`](core.md#Erdos.clean_vertex!)), -1 otherwise.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/dismantling/ci.jl#L70-L76' class='documenter-source'>source</a><br>

