#!/bin/bash

# Verifica se o número de argumentos é válido
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <arquivo_fonte.c>"
    exit 1
fi

# Obtém o nome do arquivo fonte
ARQUIVO_FONTE="$1"

# Verifica se o arquivo fonte existe
if [ ! -f "$ARQUIVO_FONTE" ]; then
    echo "Erro: Arquivo fonte '$ARQUIVO_FONTE' não encontrado."
    exit 1
fi

# Array de níveis de otimização
NIVEIS_DE_OTIMIZACAO=("0" "1" "2" "3")

# Compila o arquivo fonte para bytecode LLVM
clang -emit-llvm -c "$ARQUIVO_FONTE" -o output.bc

# Gera o CFG para cada função no arquivo fonte para cada nível de otimização
for OTIMIZACAO in "${NIVEIS_DE_OTIMIZACAO[@]}"; do
    llvm-dis -o output.ll output.bc
    opt -dot-cfg-only output.ll -o "cfg_$OTIMIZACAO.dot" -O$OTIMIZACAO
    dot -Tpng -o "cfg_$OTIMIZACAO.png" "cfg_$OTIMIZACAO.dot"
done

# Limpa os arquivos temporários
rm -f output.bc output.ll *.dot

echo "Grafos de Fluxo de Controle gerados com sucesso para o arquivo fonte '$ARQUIVO_FONTE'."
