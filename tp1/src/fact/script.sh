#!/bin/bash

# Recebe o arquivo fonte como argumento
SOURCE_FILE=$1

# Array com os níveis de otimização
OPT_LEVELS=("O1" "O2" "O3")

# Loop pelos níveis de otimização
for OPT in ${OPT_LEVELS[@]}; do

  # Compila o arquivo fonte para bytecode LLVM com o nível de otimização
  clang -emit-llvm -c $SOURCE_FILE -o output.bc -O$OPT

  # Gera o CFG para cada função no arquivo fonte
  for FUNC in $(llvm-nm -g output.bc | awk '{print $3}'); do
    llvm-dis < output.bc | opt -dot-cfg-only -disable-output
    dot -Tpng -o $FUNC-$OPT.png cfg.$FUNC.dot
  done

done
