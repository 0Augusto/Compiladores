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

# Compila o programa C com diferentes níveis de otimização e gera o grafo de fluxo de controle
for opt in O1 O2 O3
do
  gcc -$opt -fdump-rtl-expand "$1"
  dot -Tpng "${filename}.expand" > "${filename}_${opt}.png"
done

# Remove arquivos intermediários
rm "${filename}.expand"

