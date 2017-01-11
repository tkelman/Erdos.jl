
<a id='Reading-and-writing-Graphs-1'></a>

# Reading and writing Graphs


Graphs may be written to I/O streams and files using the `writegraph` function and read with the `readgraph` function. Currently supported common graph formats are [GraphML](http://en.wikipedia.org/wiki/GraphML), [GML](https://en.wikipedia.org/wiki/Graph_Modelling_Language), [Gexf](http://gexf.net/format), [DOT](https://en.wikipedia.org/wiki/DOT_(graph_description_language)), [Pajek NET](http://gephi.org/users/supported-graph-formats/pajek-net-format/), [graph-tool gt](https://graph-tool.skewed.de/static/doc/gt_format.html)

<a id='FatGraphs.readgraph' href='#FatGraphs.readgraph'>#</a>
**`FatGraphs.readgraph`** &mdash; *Function*.



```
readgraph(file, t, G=Graph; compressed=false)
```

Reads a graph from  `file` in the format `t`. Returns a graph of type `G`. Compressed files can eventually be read.

Supported formats are `:gml, :dot, :graphml, :gexf, :NET, :gt`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/persistence/common.jl#L9-L16' class='documenter-source'>source</a><br>

<a id='FatGraphs.writegraph-Tuple{IO,Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Symbol}' href='#FatGraphs.writegraph-Tuple{IO,Union{FatGraphs.ADiGraph,FatGraphs.AGraph},Symbol}'>#</a>
**`FatGraphs.writegraph`** &mdash; *Method*.



```
writegraph(file, g, t; compress=false)
```

Save a graph `g` to `file` in the format `t`.

Eventually the resulting file can be compressed in the gzip format.

Currently supported formats are `:gml, :graphml, :gexf, :dot, :NET, :gt`.


<a target='_blank' href='https://github.com/CarloLucibello/FatGraphs.jl/tree/d24f6e27b50b6b0ed47bf33a6887df23218dda7f/docs/../src/persistence/common.jl#L34-L42' class='documenter-source'>source</a><br>


<a id='Examples-1'></a>

## Examples


```julia
writegraph(STDOUT, g)
writegraph("mygraph.gml", g, :gml)
writegraph("mygraph.dot.gzip", g, :dot, compress=true)

g = readgraph("mygraph.dot.gzip", :dot)
g = readgraph("mygraphs.graphml", :graphml)
g = readgraph("mygraph.gml", :gml)
```

