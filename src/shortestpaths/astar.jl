# Parts of this code were taken / derived from Graphs.jl. See LICENSE for
# licensing details.

# A* shortest-path algorithm

function a_star_impl!{E,T<:Number}(
        g::ASimpleGraph,# the graph
        s::Integer,
        t::Integer, # the end vertex
        colormap::Vector{Int},  # an (initialized) color-map to indicate status of vertices
        distmx::AEdgeMap{E,T},
        heuristic::Function    # heuristic fn (under)estimating distance to target
    )
    V = vertextype(g)
    colormap[s] = 1
    frontier = PriorityQueue(Tuple{T,Vector{Edge{V}},Int},T)
    frontier[(zero(T), Vector{Edge{V}}(), s)] = zero(T)

    path = Vector{Edge{V}}()
    foundpath = false
    while !isempty(frontier)
        (cost_so_far, path, u) = dequeue!(frontier)
        if u == t
            foundpath = true
            break
        end
        for e in out_edges(g, u)
            v = dst(e)
            if colormap[v] < 2
                dist = distmx[e]

                colormap[v] = 1
                new_path = cat(1, path, Edge{V}(u,v))
                path_cost = cost_so_far + dist
                enqueue!(frontier,
                        (path_cost, new_path, v),
                        path_cost + heuristic(v))
            end
        end
        colormap[u] = 2
    end
    return foundpath ? path : Vector{Edge{V}}()
end

"""
    a_star(g, s, t, distmx=ConstEdgeMap(g,1), heuristic = n->0)

Computes the shortest path between vertices `s` and `t` using the
[A\* search algorithm](http://en.wikipedia.org/wiki/A%2A_search_algorithm). An
optional heuristic function and edge distance matrix may be supplied.
Returns an empty path if there are no such paths.
"""
function a_star(
        g::ASimpleGraph,  # the graph
        s::Integer,                       # the start vertex
        t::Integer,                       # the end vertex
        distmx::AEdgeMap=ConstEdgeMap(g,1),
        heuristic::Function = n -> 0
    )
            # heuristic (under)estimating distance to target
    colormap = zeros(Int, nv(g))
    a_star_impl!(g, s, t, colormap, distmx, heuristic)
end
