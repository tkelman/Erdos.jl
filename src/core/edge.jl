
show(io::IO, e::AEdge) = print(io, "$(src(e))=>$(dst(e))")

"""
    is_ordered(e)

Returns  `src(e) <= dst(e)`.
"""
is_ordered(e::AEdge) = src(e) <= dst(e)


"""
    sort(e::Edge)

Swap `src` and `dst` if `src > dst`.
"""
sort(e::AEdge) = src(e) > dst(e) ? reverse(e) : e

==(e1::AEdge, e2::AEdge) = (src(e1) == src(e2) && dst(e1) == dst(e2))

"""
    immutable Edge
        src::Int
        dst::Int
    end

A type representing an edge between two vertices of a graph.
"""

# concrete Edge

immutable Edge{T} <: AEdge
    src::T
    dst::T
end

function Edge{T,S}(u::T, v::S)
    V = promote_type(T,S)
    return Edge{V}(promote(u, v)...)
end

Edge(g::ASimpleGraph, u, v) = Edge(u, v)

src(e::Edge) = e.src
dst(e::Edge) = e.dst

start(e::AEdge) = 1
done(e::AEdge, i) = i>2
next(e::AEdge, i) = (getfield(e,i), i+1)
# indexed_next(e::Edge, i::Int, state) = (getfield(e,i), i+1)

"""
    reverse(e::Edge)

Swap `e.src` and `e.dst`.
"""
reverse(e::Edge) = Edge(dst(e), src(e))
