#@author: Henrique Augusto

#!/bin/bash

# Verifique se o arquivo de entrada foi fornecido
if [ -z "$1" ]
then
  echo "Por favor, forneça um arquivo de entrada."
  exit 1
fi

# Nome do arquivo sem extensão
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# Compila o programa C com diferentes níveis de otimização e gera a representação AST
for opt in O0 O1 O2 O3
do
  clang -$opt -Xclang -ast-dump -fsyntax-only "$1" > "${filename}_${opt}_ast.txt"
done
