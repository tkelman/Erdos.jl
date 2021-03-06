NI(x...) = error("This function is not implemented.")

# filemap is filled in the format specific source files
@compat const filemap = Dict{Symbol, Tuple{Function, Function}}()
        # :gml        => (readgml, writegml)
        # :graphml    => (readgraphml, writegraphml)
        # ....

"""
    readgraph(filename, G=Graph)
    readgraph(filename, t, G=Graph; compressed=false)

Reads a graph from  `filename` in the format `t`. Returns a graph of type `G`.
Compressed files can eventually be read.

Supported formats are `:gml, :dot, :graphml, :gexf, :net, :gt`.

If no format is provided, it will be inferred from `filename`.
"""
function readgraph{G<:ASimpleGraph}(fn::String, t::Symbol, ::Type{G}=Graph; compressed=false)
    if compressed
        io = GZip.open(fn,"r")
    else
        io = open(fn,"r")
    end
    g = readgraph(io, t, G)
    close(io)
    return g
end

function readgraph{G<:ASimpleGraph}(io::IO, t::Symbol, ::Type{G}=Graph)
    t in keys(filemap) || error("Please select a supported graph format: one of $(keys(filemap))")
    return filemap[t][1](io, G)
end

function readgraph{G<:ASimpleGraph}(fn::String, ::Type{G}=Graph)
    compressed = false
    ft = split(fn,'.')[end]
    if ft == "gz"
        compressed = true
        ft = split(fn,'.')[end-1]
    end
    if Symbol(ft) in keys(filemap)
        return readgraph(fn, Symbol(ft), G; compressed=compressed)
    else
        error("Could not infer file format.")
    end
end


"""
    writegraph(file, g)
    writegraph(file, g, t; compress=false)

Save a graph `g` to `file` in the format `t`.

Eventually the resulting file can be compressed in the gzip format.

Currently supported formats are `:gml, :graphml, :gexf, :dot, :net, :gt`.

If no format is provided, it will be inferred from `file` along with compression.
"""
function writegraph(io::IO, g::ASimpleGraph, t::Symbol)
    t in keys(filemap) || error("Please select a supported graph format: one of $(keys(filemap))")
    return filemap[t][2](io, g)
end

function writegraph(fn::String, g::ASimpleGraph, t::Symbol; compress::Bool=false)
    if compress
        io = GZip.open(fn,"w")
    else
        io = open(fn,"w")
    end
    retval = writegraph(io, g, t)
    close(io)
    return retval
end

function writegraph(fn::String, g::ASimpleGraph)
    compress = false
    ft = split(fn,'.')[end]
    if ft == "gz"
        compress = true
        ft = split(fn,'.')[end-1]
    end
    return writegraph(fn, g, Symbol(ft), compress=compress)
end


function getchild(el::EzXML.Node, s::String)
    childs = elements(el)
    i = findfirst(x->name(x)==s, childs)
    i == 0 && error("no child $s")
    return childs[i]
end
