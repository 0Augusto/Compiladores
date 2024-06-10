#!/bin/bash

# Função para processar o arquivo AST e gerar o conteúdo do arquivo DOT
process_ast() {
    # Aqui você processaria o conteúdo do AST e geraria o conteúdo do DOT
    # Isso envolveria transformar os nós e conexões do AST em nós e conexões do DOT
    echo "digraph AST {"  # Início do arquivo DOT
    # Adicione o conteúdo do DOT aqui
    echo "}"  # Fim do arquivo DOT
}

# Verifica se os argumentos de entrada estão corretos
if [ $# -ne 2 ]; then
    echo "Uso: $0 fact_Ofast_ast.txt fact_Ofast_dot.dot"
    exit 1
fi

AST_FILE=$1
DOT_FILE=$2

# Verifica se o arquivo AST existe
if [ ! -f "$AST_FILE" ]; then
    echo "Arquivo AST não encontrado: $AST_FILE"
    exit 1
fi

# Processa o arquivo AST e redireciona a saída para o arquivo DOT
process_ast < "$AST_FILE" > "$DOT_FILE"

echo "Arquivo DOT gerado com sucesso: $DOT_FILE"
