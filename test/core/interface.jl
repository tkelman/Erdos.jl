if !isdefined(:TestGraph)
    type TestGraph <: AGraph; end
    type TestDiGraph <: ADiGraph; end
end
g = TestGraph()
h = TestDiGraph()

@test_throws ErrorException nv(g)
@test_throws ErrorException nv(h)
@test_throws ErrorException neighbors(g, 1)
@test edge(g, 1, 2) == Edge{Int}(1, 2)
@test edge(h, 1, 2) == Edge{Int}(1, 2)
@test_throws ErrorException neighbors(g, 1)
@test_throws ErrorException in_neighbors(h, 1)
@test_throws ErrorException out_neighbors(h, 1)
@test_throws ErrorException graphtype(h)
@test_throws ErrorException digraphtype(g)
@test edgetype(g) == Edge{Int}
@test_throws ErrorException  pop_vertex!(g)
@test vertextype(g) == Int

@test graphtype(Graph) == Graph{Int}
@test graphtype(DiGraph) == Graph{Int}
@test digraphtype(Graph) == DiGraph{Int}
@test digraphtype(DiGraph) == DiGraph{Int}
