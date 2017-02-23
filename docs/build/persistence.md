
<a id='Reading-and-writing-Graphs-1'></a>

# Reading and writing Graphs


Graphs may be written to I/O streams and files using the `writegraph` function and read with the `readgraph` function. Currently supported common graph formats are [GraphML](http://en.wikipedia.org/wiki/GraphML), [GML](https://en.wikipedia.org/wiki/Graph_Modelling_Language), [Gexf](http://gexf.net/format), [DOT](https://en.wikipedia.org/wiki/DOT_(graph_description_language)), [Pajek .net](http://gephi.org/users/supported-graph-formats/pajek-net-format/), [graph-tool gt](https://graph-tool.skewed.de/static/doc/gt_format.html)


<a id='Examples-1'></a>

## Examples


```julia
writegraph("mygraph.gml", g) #format is inferred by the name
writegraph("mygraph.graphml", g)

g = readgraph("mygraph.dot")
g = readgraph("mygraph.net")
```

<a id='Erdos.readgraph' href='#Erdos.readgraph'>#</a>
**`Erdos.readgraph`** &mdash; *Function*.



```
readgraph(filename, G=Graph)
readgraph(filename, t, G=Graph; compressed=false)
```

Reads a graph from  `filename` in the format `t`. Returns a graph of type `G`. Compressed files can eventually be read.

Supported formats are `:gml, :dot, :graphml, :gexf, :net, :gt`.

If no format is provided, it will be inferred from `filename`.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/persistence/common.jl#L9-L19' class='documenter-source'>source</a><br>

<a id='Erdos.writegraph-Tuple{IO,Union{Erdos.ADiGraph,Erdos.AGraph},Symbol}' href='#Erdos.writegraph-Tuple{IO,Union{Erdos.ADiGraph,Erdos.AGraph},Symbol}'>#</a>
**`Erdos.writegraph`** &mdash; *Method*.



```
writegraph(file, g)
writegraph(file, g, t; compress=false)
```

Save a graph `g` to `file` in the format `t`.

Eventually the resulting file can be compressed in the gzip format.

Currently supported formats are `:gml, :graphml, :gexf, :dot, :net, :gt`.

If no format is provided, it will be inferred from `file` along with compression.


<a target='_blank' href='https://github.com/CarloLucibello/Erdos.jl/tree/66e6f1999dd8bd1a8b314ef10b82c9029c20289d/docs/../src/persistence/common.jl#L51-L62' class='documenter-source'>source</a><br>

