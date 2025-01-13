#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>

// Estrutura para armazenar informações de funções
typedef struct {
    char name[256];
    unsigned long address;
    bool is_called;
    bool is_exported;
} Function;

// Estrutura para armazenar informações de seções
typedef struct {
    char name[64];
    unsigned long start;
    unsigned long size;
} Section;

// Estrutura principal do analisador
typedef struct {
    Function* functions;
    size_t function_count;
    Section* sections;
    size_t section_count;
    char* binary_path;
} Analyzer;

// Inicializa o analisador
Analyzer* init_analyzer(const char* binary_path) {
    Analyzer* analyzer = (Analyzer*)malloc(sizeof(Analyzer));
    if (!analyzer) {
        return NULL;
    }

    analyzer->binary_path = strdup(binary_path);
    analyzer->functions = NULL;
    analyzer->function_count = 0;
    analyzer->sections = NULL;
    analyzer->section_count = 0;

    return analyzer;
}

// Extrai símbolos usando nm do LLVM
bool extract_symbols(Analyzer* analyzer) {
    char command[512];
    snprintf(command, sizeof(command), "llvm-nm %s", analyzer->binary_path);
    
    FILE* pipe = popen(command, "r");
    if (!pipe) {
        return false;
    }

    char line[512];
    size_t capacity = 10;
    analyzer->functions = (Function*)malloc(capacity * sizeof(Function));

    while (fgets(line, sizeof(line), pipe)) {
        unsigned long addr;
        char type;
        char name[256];

        if (sscanf(line, "%lx %c %s", &addr, &type, name) == 3) {
            if (analyzer->function_count >= capacity) {
                capacity *= 2;
                Function* temp = realloc(analyzer->functions, capacity * sizeof(Function));
                if (!temp) {
                    pclose(pipe);
                    return false;
                }
                analyzer->functions = temp;
            }

            Function* func = &analyzer->functions[analyzer->function_count++];
            strncpy(func->name, name, sizeof(func->name) - 1);
            func->address = addr;
            func->is_called = false;
            func->is_exported = (type == 'T');
        }
    }

    pclose(pipe);
    return true;
}

// Extrai informações das seções usando objdump do LLVM
bool extract_sections(Analyzer* analyzer) {
    char command[512];
    snprintf(command, sizeof(command), "llvm-objdump -h %s", analyzer->binary_path);
    
    FILE* pipe = popen(command, "r");
    if (!pipe) {
        return false;
    }

    char line[512];
    size_t capacity = 5;
    analyzer->sections = (Section*)malloc(capacity * sizeof(Section));

    // Pula o cabeçalho
    for (int i = 0; i < 4; i++) {
        fgets(line, sizeof(line), pipe);
    }

    while (fgets(line, sizeof(line), pipe)) {
        char name[64];
        unsigned long size, start;

        if (sscanf(line, "%s %lx %lx", name, &size, &start) == 3) {
            if (analyzer->section_count >= capacity) {
                capacity *= 2;
                Section* temp = realloc(analyzer->sections, capacity * sizeof(Section));
                if (!temp) {
                    pclose(pipe);
                    return false;
                }
                analyzer->sections = temp;
            }

            Section* sec = &analyzer->sections[analyzer->section_count++];
            strncpy(sec->name, name, sizeof(sec->name) - 1);
            sec->size = size;
            sec->start = start;
        }
    }

    pclose(pipe);
    return true;
}

// Analisa chamadas de função usando objdump do LLVM
bool analyze_calls(Analyzer* analyzer) {
    char command[512];
    snprintf(command, sizeof(command), "llvm-objdump -d %s", analyzer->binary_path);
    
    FILE* pipe = popen(command, "r");
    if (!pipe) {
        return false;
    }

    char line[512];
    while (fgets(line, sizeof(line), pipe)) {
        if (strstr(line, "callq") || strstr(line, "jmp")) {
            for (size_t i = 0; i < analyzer->function_count; i++) {
                if (strstr(line, analyzer->functions[i].name)) {
                    analyzer->functions[i].is_called = true;
                    break;
                }
            }
        }
    }

    pclose(pipe);
    return true;
}

// Identifica código morto
void identify_dead_code(Analyzer* analyzer) {
    printf("\n=== Análise de Código Morto ===\n\n");
    
    int dead_count = 0;
    printf("Funções potencialmente mortas:\n");
    
    for (size_t i = 0; i < analyzer->function_count; i++) {
        Function* func = &analyzer->functions[i];
        
        // Ignora funções exportadas e funções especiais
        if (!func->is_exported && !func->is_called &&
            strncmp(func->name, "_", 1) != 0 &&
            strncmp(func->name, "main", 4) != 0) {
            
            printf("- %s (endereço: 0x%lx)\n", func->name, func->address);
            dead_count++;
        }
    }
    
    printf("\nEstatísticas:\n");
    printf("Total de funções: %zu\n", analyzer->function_count);
    printf("Funções potencialmente mortas: %d\n", dead_count);
    printf("Porcentagem de código morto: %.2f%%\n", 
           (float)dead_count / analyzer->function_count * 100);
}

// Libera recursos
void cleanup_analyzer(Analyzer* analyzer) {
    if (analyzer) {
        free(analyzer->binary_path);
        free(analyzer->functions);
        free(analyzer->sections);
        free(analyzer);
    }
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Uso: %s <caminho_do_binario>\n", argv[0]);
        return 1;
    }

    Analyzer* analyzer = init_analyzer(argv[1]);
    if (!analyzer) {
        printf("Erro ao inicializar o analisador\n");
        return 1;
    }

    printf("Analisando binário: %s\n", argv[1]);

    if (!extract_symbols(analyzer)) {
        printf("Erro ao extrair símbolos\n");
        cleanup_analyzer(analyzer);
        return 1;
    }

    if (!extract_sections(analyzer)) {
        printf("Erro ao extrair seções\n");
        cleanup_analyzer(analyzer);
        return 1;
    }

    if (!analyze_calls(analyzer)) {
        printf("Erro ao analisar chamadas\n");
        cleanup_analyzer(analyzer);
        return 1;
    }

    identify_dead_code(analyzer);
    cleanup_analyzer(analyzer);

    return 0;
}
