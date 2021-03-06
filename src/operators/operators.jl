"""
    complete(g::ADiGraph)

Returns a digraph containing both the edges `(u,v)`
of `g` and their reverse `(v,u)`.
"""
function complete(g::ADiGraph)
    h = copy(g)
    complete!(h)
    return h
end

"""
    complete!(g::ADiGraph)

Returns a digraph containing both the edges `(u,v)`
of `g` and their reverse `(v,u)`.
"""
function complete!(g::ADiGraph)
    edgs  = collect(edges(g))
    for e in edgs
        if !has_edge(g, dst(e), src(e))
            add_edge!(g, dst(e), src(e))
        end
    end
    return g
end

"""
    complement(g)

Produces the [graph complement](https://en.wikipedia.org/wiki/Complement_graph)
of a graph.
"""
function complement{T<:AGraph}(g::T)
    gnv = nv(g)
    h = T(gnv)
    for i=1:gnv
        for j=i+1:gnv
            if !has_edge(g, i, j)
                add_edge!(h,i,j)
            end
        end
    end
    return h
end

function complement{T<:ADiGraph}(g::T)
    gnv = nv(g)
    h = T(gnv)
    for i=1:gnv
        for j=1:gnv
            if i != j && !has_edge(g,i,j)
                add_edge!(h,i,j)
            end
        end
    end
    return h
end

"""
    union(g, h)

Merges graphs `g` and `h` by taking the set union of all vertices and edges.
"""
function union{T<:ASimpleGraph}(g::T, h::T)
    gnv = nv(g)
    hnv = nv(h)

    r = copy(g)
    add_vertices!(r, max(gnv, hnv) - gnv)
    for e in edges(h)
        add_edge!(r, e)
    end
    return r
end


"""
    blkdiag(g, h)

Produces a graph with ``|V(g)| + |V(h)|`` vertices and ``|E(g)| + |E(h)|``
edges.

Put simply, the vertices and edges from graph `h` are appended to graph `g`.
"""
function blkdiag{T<:ASimpleGraph}(g::T, h::T)
    gnv = nv(g)
    r = T(gnv + nv(h))
    for e in edges(g)
        add_edge!(r, e)
    end
    for e in edges(h)
        add_edge!(r, gnv+src(e), gnv+dst(e))
    end
    return r
end

"""
    intersect(g, h)

Produces a graph with edges that are only in both graph `g` and graph `h`.

Note that this function may produce a graph with 0-degree vertices.
"""
function intersect{T<:ASimpleGraph}(g::T, h::T)
    gnv = nv(g)
    hnv = nv(h)

    r = T(min(gnv, hnv))
    for e in intersect(edges(g),edges(h))
        add_edge!(r,e)
    end
    return r
end

"""
    difference(g, h)

Produces a graph with edges in graph `g` that are not in graph `h`.

Note that this function may produce a graph with 0-degree vertices.
"""
function difference{T<:ASimpleGraph}(g::T, h::T)
    gnv = nv(g)
    hnv = nv(h)

    r = T(gnv)
    for e in edges(g)
        !has_edge(h, e) && add_edge!(r,e)
    end
    return r
end

"""
    symmetric_difference(g, h)

Produces a graph with edges from graph `g` that do not exist in graph `h`,
and vice versa.

Note that this function may produce a graph with 0-degree vertices.
"""
function symmetric_difference{T<:ASimpleGraph}(g::T, h::T)
    gnv = nv(g)
    hnv = nv(h)

    r = T(max(gnv, hnv))
    for e in edges(g)
        !has_edge(h, e) && add_edge!(r, e)
    end
    for e in edges(h)
        !has_edge(g, e) && add_edge!(r, e)
    end
    return r
end

"""
    join(g, h)

Merges graphs `g` and `h` using `blkdiag` and then adds all the edges between
 the vertices in `g` and those in `h`.
"""
function join(g::AGraph, h::AGraph)
    r = blkdiag(g, h)
    for i=1:nv(g)
        for j=nv(g)+1:nv(g)+nv(h)
            add_edge!(r, i, j)
        end
    end
    return r
end


"""
    crosspath(len::Integer, g::AGraph)

Replicate `len` times `h` and connect each vertex with its copies in a path
"""
crosspath{G<:AGraph}(len::Integer, g::G) =
                cartesian_product(PathGraph(len, G), g)

"""
    cartesian_product(g, h)

Returns the (cartesian product)[https://en.wikipedia.org/wiki/Tensor_product_of_graphs] of `g` and `h`
"""
function cartesian_product{G<:ASimpleGraph}(g::G, h::G)
    z = G(nv(g)*nv(h))
    id(i, j) = (i-1)*nv(h) + j
    for (i1, i2) in edges(g)
        for j=1:nv(h)
            add_edge!(z, id(i1,j), id(i2,j))
        end
    end

    for (j1, j2) in edges(h)
        for i=1:nv(g)
            add_edge!(z, id(i,j1), id(i,j2))
        end
    end
    return z
end

"""
    tensor_product(g, h)

Returns the (tensor product)[https://en.wikipedia.org/wiki/Tensor_product_of_graphs] of `g` and `h`
"""
function tensor_product{G<:ASimpleGraph}(g::G, h::G)
    z = G(nv(g)*nv(h))
    id(i, j) = (i-1)*nv(h) + j
    for (i1, i2) in edges(g)
        for (j1, j2) in edges(h)
            add_edge!(z, id(i1, j1), id(i2, j2))
        end
    end
    return z
end


## subgraphs ###

"""
    subgraph(g, vlist)

Returns the subgraph of `g` induced by the vertices in  `vlist`.

The returned graph has `length(vlist)` vertices, with the new vertex `i`
corresponding to the vertex of the original graph in the `i`-th position
of `vlist`.

Returns  also a vector `vmap` mapping the new vertices to the
old ones: the  vertex `i` in the subgraph corresponds to
the vertex `vmap[i]` in `g`.

    subgraph(g, elist)

Returns the subgraph of `g` induced by the edges in `elist`, along with
the associated vector `vmap` mapping new vertices to the old ones.


### Usage Examples:
```julia
g = CompleteGraph(10)
sg, vmap = subgraph(g, 5:8)
@assert g[5:8] == sg
@assert nv(sg) == 4
@assert ne(sg) == 6
@assert vm[4] == 8

sg, vmap = subgraph(g, [2,8,3,4])
@asssert sg == g[[2,8,3,4]]

elist = [Edge(1,2), Edge(3,4), Edge(4,8)]
sg, vmap = subgraph(g, elist)
@asssert sg == g[elist]
```
"""
function subgraph{G<:ASimpleGraph,V<:Integer}(g::G, vlist::AbstractVector{V})
    allunique(vlist) || error("Vertices in subgraph list must be unique")
    h = G(length(vlist))
    newvid = Dict{V, V}()
    vmap =Vector{V}(length(vlist))
    for (i,v) in enumerate(vlist)
        newvid[v] = i
        vmap[i] = v
    end

    vset = Set(vlist)
    for s in vlist
        for d in out_neighbors(g, s)
            if d in vset && has_edge(g, s, d)
                add_edge!(h, newvid[s], newvid[d])
            end
        end
    end
    return h, vmap
end


function subgraph{G<:ASimpleGraph}(g::G, elist)
    h = G()
    V = vertextype(h)
    newvid = Dict{V, V}()
    vmap = Vector{V}()

    for e in elist
        u, v = src(e), dst(e)
        for i in (u,v)
            if !haskey(newvid, i)
                add_vertex!(h)
                newvid[i] = nv(h)
                push!(vmap, i)
            end
        end
        add_edge!(h, newvid[u], newvid[v])
    end
    return h, vmap
end


"""
    g[iter]

Returns the subgraph induced by `iter`. Equivalent to [`subgraph`](@ref)`(g, iter)[1]`.
"""
getindex(g::ASimpleGraph, iter) = subgraph(g, iter)[1]


"""
    egonet(g, v::Int, d::Int; dir=:out)

Returns the subgraph of `g` induced by the neighbors of `v` up to distance
`d`. If `g` is a `DiGraph` the `dir` optional argument specifies
the edge direction the edge direction with respect to `v` (i.e. `:in` or `:out`)
to be considered. This is equivalent to [`subgraph`](@ref)`(g, neighborhood(g, v, d, dir=dir))[1].`
"""
egonet(g::ASimpleGraph, v::Integer, d::Integer; dir=:out) =  g[neighborhood(g, v, d, dir=dir)]


# The following operators allow one to use a Erdos.Graph as a matrix in
# eigensolvers for spectral ranking and partitioning.
# """Provides multiplication of a graph `g` by a vector `v` such that spectral
# graph functions in [GraphMatrices.jl](https://github.com/jpfairbanks/GraphMatrices.jl) can utilize Erdos natively.
# """
function *{T<:Number}(g::AGraph, v::Vector{T})
    length(v) == nv(g) || error("Vector size must equal number of vertices")
    y = zeros(T, nv(g))
    for e in edges(g)
        i = src(e)
        j = dst(e)
        y[i] += v[j]
        y[j] += v[i]
    end
    return y
end

function *{T<:Number}(g::ADiGraph, v::Vector{T})
    length(v) == nv(g) || error("Vector size must equal number of vertices")
    y = zeros(T, nv(g))
    for e in edges(g)
        i = src(e)
        j = dst(e)
        y[i] += v[j]
    end
    return y
end

"""sum(g,i) provides 1:in_degree or 2:out_degree vectors"""
function sum(g::ASimpleGraph, dim::Int)
    dim == 1 && return in_degree(g, vertices(g))
    dim == 2 && return out_degree(g, vertices(g))
    error("Graphs are only two dimensional")
end


size(g::ASimpleGraph) = (nv(g), nv(g))
"""size(g,i) provides 1:nv or 2:nv else 1 """
size(g::AGraph,dim::Int) = (dim == 1 || dim == 2)? nv(g) : 1

"""sum(g) provides the number of edges in the graph"""
sum(g::ASimpleGraph) = ne(g)

"""sparse(g) is the adjacency_matrix of g"""
sparse(g::ASimpleGraph) = adjacency_matrix(g)

#arrayfunctions = (:eltype, :length, :ndims, :size, :strides, :issymmetric)
eltype(g::ASimpleGraph) = Float64
length(g::ASimpleGraph) = nv(g)*nv(g)
ndims(g::ASimpleGraph) = 2
issymmetric(g::ASimpleGraph) = !is_directed(g)
