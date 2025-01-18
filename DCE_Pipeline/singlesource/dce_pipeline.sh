#!/bin/bash

# Check for required dependencies
check_dependencies() {
    local missing_deps=()
    
    if ! command -v clang &> /dev/null; then
        missing_deps+=("clang")
    fi
    
    if ! command -v opt &> /dev/null; then
        missing_deps+=("LLVM opt")
    fi
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        echo "Error: Required dependencies not found:"
        for dep in "${missing_deps[@]}"; do
            echo "- $dep"
        done
        echo -e "\nPlease install LLVM and Clang tools."
        echo "On Ubuntu/Debian: sudo apt-get install llvm clang"
        echo "On macOS with Homebrew: brew install llvm"
        exit 1
    fi
}

# Função para processar um único arquivo
process_file() {
    local input_file=$1
    local basename=$(basename "$input_file" .c)
    
    echo "Processando $input_file..."
    
    # 1. Gerar LLVM IR sem otimizações
    if ! clang -O0 -S -emit-llvm "$input_file" -o "${basename}.ll"; then
        echo "Erro ao gerar IR para $input_file"
        return 1
    fi
    echo "✓ Gerado IR inicial"
    
    # 2. Guardar uma cópia do IR original para comparação
    cp "${basename}.ll" "${basename}.original.ll"
    
    # 3. Aplicar DCE
    if ! opt -passes=dce -S "${basename}.ll" -o "${basename}.dce.ll"; then
        echo "Erro ao aplicar DCE em ${basename}.ll"
        return 1
    fi
    echo "✓ Aplicado DCE"
    
    # 4. Gerar estatísticas básicas
    echo "Análise do arquivo $basename:" > "${basename}.stats.txt"
    echo "----------------------------------------" >> "${basename}.stats.txt"
    
    # Contar instruções antes e depois do DCE
    echo "Instruções antes do DCE:" >> "${basename}.stats.txt"
    grep -c "define" "${basename}.original.ll" >> "${basename}.stats.txt"
    echo "Instruções após DCE:" >> "${basename}.stats.txt"
    grep -c "define" "${basename}.dce.ll" >> "${basename}.stats.txt"
    
    # Encontrar diferenças
    echo -e "\nDiferenças encontradas:" >> "${basename}.stats.txt"
    diff "${basename}.original.ll" "${basename}.dce.ll" >> "${basename}.stats.txt" || true
    
    echo "✓ Análise completa - resultados em ${basename}.stats.txt"
    echo "----------------------------------------"
}

# Função para processar com diferentes níveis de otimização
process_with_optimization_levels() {
    local input_file=$1
    local basename=$(basename "$input_file" .c)
    
    > "${basename}.opt_comparison.txt"  # Clear/create the file
    
    for opt_level in 0 1 2 3; do
        echo "Processando com -O${opt_level}..."
        
        # Gerar IR com otimização específica
        if ! clang -O${opt_level} -S -emit-llvm "$input_file" -o "${basename}.O${opt_level}.ll"; then
            echo "Erro ao gerar IR com O${opt_level} para $input_file"
            continue
        fi
        
        # Aplicar DCE
        if ! opt -passes=dce -S "${basename}.O${opt_level}.ll" -o "${basename}.O${opt_level}.dce.ll"; then
            echo "Erro ao aplicar DCE no IR com O${opt_level}"
            continue
        fi
        
        # Gerar estatísticas
        echo "Análise com O${opt_level}:" >> "${basename}.opt_comparison.txt"
        echo "----------------------------------------" >> "${basename}.opt_comparison.txt"
        echo "Instruções antes do DCE:" >> "${basename}.opt_comparison.txt"
        grep -c "define" "${basename}.O${opt_level}.ll" >> "${basename}.opt_comparison.txt"
        echo "Instruções após DCE:" >> "${basename}.opt_comparison.txt"
        grep -c "define" "${basename}.O${opt_level}.dce.ll" >> "${basename}.opt_comparison.txt"
        echo -e "\n" >> "${basename}.opt_comparison.txt"
    done
    
    echo "✓ Comparação de otimizações completa - resultados em ${basename}.opt_comparison.txt"
}

# Função principal
main() {
    # Verificar dependências primeiro
    check_dependencies
    
    # Verificar se um arquivo foi fornecido
    if [ $# -eq 0 ]; then
        echo "Uso: $0 arquivo.c [arquivo2.c ...]"
        exit 1
    fi
    
    # Criar diretório para resultados
    mkdir -p results
    cd results || exit 1
    
    # Processar cada arquivo
    for file in "$@"; do
        if [ -f "../$file" ]; then
            process_file "../$file"
            process_with_optimization_levels "../$file"
        else
            echo "Arquivo não encontrado: $file"
        fi
    done
}

# Executar o script
main "$@"
