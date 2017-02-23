
<a id='Flow-and-Cut-1'></a>

# Flow and Cut


*Erdos.jl* provides different algorithms for [maximum flow](https://en.wikipedia.org/wiki/Maximum_flow_problem) and minimum cut computations.

<a id='Erdos.BoykovKolmogorovAlgorithm' href='#Erdos.BoykovKolmogorovAlgorithm'>#</a>
**`Erdos.BoykovKolmogorovAlgorithm`** &mdash; *Type*.



Forces the maximum_flow function to use the Boykov-Kolmogorov algorithm.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/maximum_flow.jl#L18-L20' class='documenter-source'>source</a><br>

<a id='Erdos.DinicAlgorithm' href='#Erdos.DinicAlgorithm'>#</a>
**`Erdos.DinicAlgorithm`** &mdash; *Type*.



Forces the maximum_flow function to use Dinic's algorithm.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/maximum_flow.jl#L12-L14' class='documenter-source'>source</a><br>

<a id='Erdos.EdmondsKarpAlgorithm' href='#Erdos.EdmondsKarpAlgorithm'>#</a>
**`Erdos.EdmondsKarpAlgorithm`** &mdash; *Type*.



Forces the maximum_flow function to use the Edmonds–Karp algorithm.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/maximum_flow.jl#L6-L8' class='documenter-source'>source</a><br>

<a id='Erdos.PushRelabelAlgorithm' href='#Erdos.PushRelabelAlgorithm'>#</a>
**`Erdos.PushRelabelAlgorithm`** &mdash; *Type*.



Forces the maximum_flow function to use the Push-Relabel algorithm.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/maximum_flow.jl#L24-L26' class='documenter-source'>source</a><br>

<a id='Erdos.maximum_flow' href='#Erdos.maximum_flow'>#</a>
**`Erdos.maximum_flow`** &mdash; *Function*.



```
maximum_flow{T<:Number}(
                    g::ADiGraph,
                    source::Int,
                    target::Int,
                    capacity_matrix::AbstractMatrix{T} =
                        DefaultCapacity(g);
                    algorithm::AbstractFlowAlgorithm  =
                        PushRelabelAlgorithm(),
                    restriction::T = zero(T)
                )
```

Generic maximum_flow function. The function defaults to the Push-Relabel (also called Preflow) algorithm. Alternatively, the algorithm to be used can also be specified through a keyword argument. A default capacity of 1 is assumed for each link if no capacity matrix is provided. If the restriction is bigger than 0, it is applied to capacity_matrix.

All algorithms return a tuple with

1. the maximum flow
2. the flow matrix
3. the labelling associated to the minimum cut

Available algorithms are `DinicAlgorithm`, `EdmondsKarpAlgorithm`, `BoykovKolmogorovAlgorithm` and `PushRelabelAlgorithm`.

Time complexity is O(V²√E) for the push relabel algorithm.

**Usage Example:**

```julia

# Create a flow-graph and a capacity matrix
g = DiGraph(8)
flow_edges = [
    (1,2,10),(1,3,5),(1,4,15),(2,3,4),(2,5,9),
    (2,6,15),(3,4,4),(3,6,8),(4,7,16),(5,6,15),
    (5,8,10),(6,7,15),(6,8,10),(7,3,6),(7,8,10)
]
capacity_matrix = zeros(Int, 8, 8)
for e in flow_edges
    u, v, f = e
    add_edge!(g, u, v)
    capacity_matrix[u,v] = f
end

# Run default maximum_flow without the capacity_matrix (assumes capacity 1. on each edge).
f, F, labels = maximum_flow(g, 1, 8)

# Run Endmonds-Karp algorithm
f, F, labels = maximum_flow(g,1,8,capacity_matrix,algorithm=EdmondsKarpAlgorithm())
```


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/maximum_flow.jl#L122-L173' class='documenter-source'>source</a><br>

<a id='Erdos.minimum_cut-Tuple{Erdos.ADiGraph,Integer,Integer,Vararg{Any,N}}' href='#Erdos.minimum_cut-Tuple{Erdos.ADiGraph,Integer,Integer,Vararg{Any,N}}'>#</a>
**`Erdos.minimum_cut`** &mdash; *Method*.



```
minimum_cut(g, s, t, capacity_matrix=DefaultCapacity(); kws...)
```

Finds the `s-t cut` of minimal weight according to the `capacities` matrix on the directed graph `g`. The solution is found through a maximal flow algorithm. See [`maximum_flow`](flow.md#Erdos.maximum_flow) for the optional arguments.

Returns a triple `(f, cut, labels)`, where `f` is the weight of the cut, `cut` is a vector of the edges in the cut, and `labels` gives a partitioning of the vertices in two sets, according to the cut.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/maximum_flow.jl#L222-L233' class='documenter-source'>source</a><br>

<a id='Erdos.ExtendedMultirouteFlowAlgorithm' href='#Erdos.ExtendedMultirouteFlowAlgorithm'>#</a>
**`Erdos.ExtendedMultirouteFlowAlgorithm`** &mdash; *Type*.



Forces the multiroute_flow function to use the Extended Multiroute Flow algorithm.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/multiroute_flow.jl#L12-L14' class='documenter-source'>source</a><br>

<a id='Erdos.KishimotoAlgorithm' href='#Erdos.KishimotoAlgorithm'>#</a>
**`Erdos.KishimotoAlgorithm`** &mdash; *Type*.



Forces the multiroute_flow function to use the Kishimoto algorithm.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/multiroute_flow.jl#L6-L8' class='documenter-source'>source</a><br>

<a id='Erdos.multiroute_flow' href='#Erdos.multiroute_flow'>#</a>
**`Erdos.multiroute_flow`** &mdash; *Function*.



The generic multiroute_flow function will output three kinds of results:

  * When the number of routes is 0 or non-specified, the set of breaking points of

the multiroute flow is returned.

  * When the input is limited to a set of breaking points and a route value k,

only the value of the k-route flow is returned

  * Otherwise, a tuple with 1) the maximum flow and 2) the flow matrix. When the

max-flow subroutine is the Boykov-Kolmogorov algorithm, the associated mincut is returned as a third output.

When the input is a network, it requires the following arguments:

  * flow_graph::ADiGraph                   # the input graph
  * source::Int                           # the source vertex
  * target::Int                           # the target vertex
  * capacity_matrix::AbstractMatrix{T}  # edge flow capacities with T<:Real
  * flow_algorithm::AbstractFlowAlgorithm # keyword argument for flow algorithm
  * mrf_algorithm::AbstractFlowAlgorithm  # keyword argument for multiroute flow algorithm
  * routes::R<:Real                       # keyword argument for the number of routes

When the input is only the set of (breaking) points and the number of route, it requires the following arguments:

  * breakingpoints::Vector{Tuple{T, T, Int}},    # vector of breaking points
  * routes::R<:Real,                             # number of routes

When the input is the set of (breaking) points, the number of routes, and the network descriptors, it requires the following arguments:

  * breakingpoints::Vector{Tuple{T1, T1, Int}} # vector of breaking points (T1<:Real)
  * routes::R<:Real                            # number of routes
  * flow_graph::ADiGraph                        # the input graph
  * source::Int                                # the source vertex
  * target::Int                                # the target vertex
  * capacity_matrix::AbstractMatrix{T2}      # optional edge flow capacities (T2<:Real)
  * flow_algorithm::AbstractFlowAlgorithm      # keyword argument for algorithm

The function defaults to the Push-relabel (classical flow) and Kishimoto (multiroute) algorithms. Alternatively, the algorithms to be used can also be specified through  keyword arguments. A default capacity of 1 is assumed for each link if no capacity matrix is provided.

The mrf_algorithm keyword is inforced to Extended Multiroute Flow in the following cases:

  * The number of routes is non-integer
  * The number of routes is 0 or non-specified

**Usage Example :**

(please consult the  max_flow section for options about flow_algorithm and capacity_matrix)

```julia

# Create a flow-graph and a capacity matrix
flow_graph = DiGraph(8)
flow_edges = [
    (1, 2, 10), (1, 3, 5),  (1, 4, 15), (2, 3, 4),  (2, 5, 9),
    (2, 6, 15), (3, 4, 4),  (3, 6, 8),  (4, 7, 16), (5, 6, 15),
    (5, 8, 10), (6, 7, 15), (6, 8, 10), (7, 3, 6),  (7, 8, 10)
]
capacity_matrix = zeros(Int, 8, 8)
for e in flow_edges
    u, v, f = e
    add_edge!(flow_graph, u, v)
    capacity_matrix[u, v] = f
end

# Run default multiroute_flow with an integer number of routes = 2
f, F = multiroute_flow(flow_graph, 1, 8, capacity_matrix, routes = 2)

# Run default multiroute_flow with a noninteger number of routes = 1.5
f, F = multiroute_flow(flow_graph, 1, 8, capacity_matrix, routes = 1.5)

# Run default multiroute_flow for all the breaking points values
points = multiroute_flow(flow_graph, 1, 8, capacity_matrix)
# Then run multiroute flow algorithm for any positive number of routes
f, F = multiroute_flow(points, 1.5)
f = multiroute_flow(points, 1.5, valueonly = true)

# Run multiroute flow algorithm using Boykov-Kolmogorov algorithm as max_flow routine
f, F, labels = multiroute_flow(flow_graph, 1, 8, capacity_matrix,
               algorithm = BoykovKolmogorovAlgorithm(), routes = 2)

```


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/flow/multiroute_flow.jl#L94-L180' class='documenter-source'>source</a><br>

