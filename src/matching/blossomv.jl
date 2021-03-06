"""
    minimum_weight_perfect_matching{T}(g, w::AEdgeMap{T},cutoff=typemax{T})

Given a graph `g` and an edgemap `w` containing weights associated to edges,
returns a matching with the mimimum total weight among the ones containing
exactly `nv(g)/2` edges. Edges in `g` not present in `w` will not be considered for the matching.
The returned object is of type `MatchingResult`.

To reduce computational time, a `cutoff` argument can be given. Only edges
with weight lower than `cutoff` will be considered for the matching.

This function relies on the BlossomV.jl package, a julia wrapper
around Kolmogorov's BlossomV algorithm.
"""
function minimum_weight_perfect_matching end

function minimum_weight_perfect_matching{E, T<:AbstractFloat}(
        g::AGraph,
        w::AEdgeMap{E,T},
        cutoff = typemax(T);
        tmaxscale::Float64 =1000.)

    cmax = min(maximum(values(w)), cutoff)
    cmin = minimum(values(w))
    tmax = typemax(Int32)  / tmaxscale # /10 is kinda arbitrary,

    wnew = EdgeMap(g, Int32)
    for e in edges(g)
        c = get(w, e, cutoff)
        if c < cutoff
            wnew[e] = round(Int32, (c-cmin) / (cmax-cmin) * tmax)
        end
    end

    match = minimum_weight_perfect_matching(g, wnew)
    weight = T(0)
    for i=1:nv(g)
        j = match.mate[i]
        if j > i
            weight += w[i, j]
        end
    end
    return MatchingResult(weight, match.mate)
end

function minimum_weight_perfect_matching{E<:Edge, T<:Integer}(
        g::AGraph,
        w::AEdgeMap{E,T},
        cutoff = typemax(T))

    m = BlossomV.Matching(nv(g))
    for e in edges(g)
        c = get(w, e, cutoff)
        if c < cutoff
            BlossomV.add_edge(m, src(e)-1, dst(e)-1, c)
        end
    end
    BlossomV.solve(m)

    mate = fill(-1, nv(g))
    totweight = T(0)
    for i=1:nv(g)
        j = BlossomV.get_match(m, i-1) + 1
        mate[i] = j <= 0 ? -1 : j
        if i < j
            totweight += w[i, j]
        end
    end
    return MatchingResult(totweight, mate)
end
