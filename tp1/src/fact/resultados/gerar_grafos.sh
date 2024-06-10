#!/bin/bash

# Verifique se o arquivo Python existe
if [ ! -f "gerar_grafo.py" ]; then
  echo "O arquivo gerar_grafo.py não existe."
  exit 1
fi

echo "Digite os nomes dos arquivos AST que deseja processar, separados por espaço:"
read -a arquivos

# Gere um grafo para cada arquivo AST
for arquivo in "${arquivos[@]}"; do
  if [ -f "$arquivo" ]; then
    python3 gerar_grafo.py "$arquivo"
    echo "Grafo gerado para $arquivo."
  else
    echo "O arquivo $arquivo não existe."
  fi
done

