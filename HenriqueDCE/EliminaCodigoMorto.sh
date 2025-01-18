#author: Henrique Augusto Rodrigues

#!/bin/bash

# Verificar dependências necessárias
check_dependencies() {
    local missing_deps=()
    
    if ! command -v gcc &> /dev/null; then
        missing_deps+=("gcc")
    fi
    
    if ! command -v nm &> /dev/null; then
        missing_deps+=("nm (GNU binutils)")
    fi
    
    if ! command -v objdump &> /dev/null; then
        missing_deps+=("objdump (GNU binutils)")
    fi
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        echo "Erro: Dependências necessárias não encontradas:"
        for dep in "${missing_deps[@]}"; do
            echo "- $dep"
        done
        echo -e "\nPor favor, instale as ferramentas necessárias."
        echo "No Ubuntu/Debian: sudo apt-get install gcc binutils"
        echo "No macOS com Homebrew: brew install gcc binutils"
        exit 1
    fi
}

# Função para extrair símbolos de um binário
extract_symbols() {
    local binary_path="$1"
    echo "Extraindo símbolos de $binary_path..."
    
    nm "$binary_path" | while read -r line; do
        addr=$(echo "$line" | awk '{print $1}')
        type=$(echo "$line" | awk '{print $2}')
        name=$(echo "$line" | awk '{print $3}')
        
        if [[ -z "$name" ]]; then
            continue
        fi
        
        echo "Função: $name, Endereço: $addr, Tipo: $type"
    done
}

# Função para extrair informações de seções de um binário
extract_sections() {
    local binary_path="$1"
    echo "Extraindo seções de $binary_path..."
    
    objdump -h "$binary_path" | awk '/\b\.text\b/ {print $1, $2, $3}'
}

# Função para analisar chamadas de função no binário
analyze_calls() {
    local binary_path="$1"
    echo "Analisando chamadas de função em $binary_path..."
    
    objdump -d "$binary_path" | while read -r line; do
        if [[ "$line" =~ "callq" || "$line" =~ "jmp" ]]; then
            echo "Chamada: $line"
        fi
    done
}

# Função para identificar código morto (simplificação)
identify_dead_code() {
    local binary_path="$1"
    echo -e "\n=== Análise de Código Morto ===\n"
    
    # Funções potencialmente mortas
    echo "Funções potencialmente mortas:"
    nm "$binary_path" | awk '$2 == "T" && $3 ~ /^_/ {print $3}'
}

# Função para processar arquivos C
process_file() {
    local input_file="$1"
    local basename=$(basename "$input_file" .c)
    
    echo "Processando $input_file..."
    
    # Compilar o arquivo C
    gcc "$input_file" -o "$basename"
    if [[ $? -ne 0 ]]; then
        echo "Erro ao compilar $input_file"
        return 1
    fi
    echo "✓ Compilado com sucesso: $basename"
    
    # Realizar as análises no binário gerado
    extract_symbols "$basename"
    echo -e "\nSeções:"
    extract_sections "$basename"
    echo -e "\nChamadas de função:"
    analyze_calls "$basename"
    identify_dead_code "$basename"
    echo "----------------------------------------"
}

# Função principal
main() {
    # Verificar dependências
    check_dependencies
    
    # Verificar se foi fornecido ao menos um arquivo C
    if [[ $# -lt 1 ]]; then
        echo "Uso: $0 arquivo1.c [arquivo2.c ...]"
        exit 1
    fi
    
    # Limite de 100 arquivos C
    if [[ $# -gt 100 ]]; then
        echo "Erro: Limite de 100 arquivos atingido."
        exit 1
    fi
    
    # Criar diretório para resultados
    mkdir -p results
    cd results || exit 1
    
    # Processar cada arquivo C fornecido como argumento
    for file in "$@"; do
        if [[ -f "../$file" ]]; then
            process_file "../$file"
        else
            echo "Arquivo não encontrado: $file"
        fi
    done
}

# Executar o script
main "$@"
