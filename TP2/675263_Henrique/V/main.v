// main.v
import utils
import parser
import graph

fn main() {
    if os.args.len != 2 {
        eprintln('Uso: v run main.v <caminho_do_arquivo_python>')
        return
    }

    file_path := os.args[1]
    code := utils.read_file(file_path) or {
        eprintln('Erro ao ler o arquivo: $err')
        return
    }

    functions := parser.parse_code(code) or {
        eprintln('Erro ao analisar o código: $err')
        return
    }

    graph_representation := graph.generate_graph(functions)
    println(graph_representation)
}

