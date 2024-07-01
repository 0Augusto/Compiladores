#Gera o grafo

// graph.v
module graph

import parser

pub fn generate_graph(functions []parser.Function) string {
    mut graph_representation := 'digraph G {\n'
    
    for function in functions {
        graph_representation += '    ${function.name} [shape=box];\n'
        for arg in function.args {
            graph_representation += '    ${arg} -> ${function.name};\n'
        }
    }

    graph_representation += '}\n'
    return graph_representation
}

