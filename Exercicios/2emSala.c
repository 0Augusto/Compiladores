#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define MAX_SIZE 100

// Estrutura para representar a gramática
typedef struct {
    char left;
    char right[MAX_SIZE];
} Production;

// Função para inicializar uma produção
Production create_production(char left, char* right) {
    Production production;
    production.left = left;
    strcpy(production.right, right);
    return production;
}

// Função para checar se um caractere é terminal ou não-terminal
bool is_terminal(char c) {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
}

// Função para realizar o parsing SLR(1)
bool parse(char* input_string, Production* grammar, int num_productions, char* terminals, int num_terminals, char* non_terminals, int num_non_terminals, char* parsing_table[][MAX_SIZE]) {
    char stack[MAX_SIZE];
    int stack_top = 0;
    int input_index = 0;
    
    stack[stack_top++] = '$';
    input_string[strlen(input_string)] = '$';

    while (stack_top > 0) {
        char top = stack[stack_top - 1];
        char current_input = input_string[input_index];

        if (top == current_input) {
            stack_top--;
            input_index++;
        } else if (is_terminal(top) || top == '$') {
            return false;
        } else {
            int row = strchr(non_terminals, top) - non_terminals;
            int col = strchr(terminals, current_input) - terminals;

            if (row < 0 || col < 0 || parsing_table[row][col] == NULL) {
                return false;
            }

            char* production = parsing_table[row][col];
            if (strcmp(production, "epsilon") != 0) {
                for (int i = strlen(production) - 1; i >= 0; i--) {
                    stack[stack_top++] = production[i];
                }
            } else {
                stack_top--;
            }
        }
    }

    return input_index == strlen(input_string);
}

int main() {
    // Definição da gramática
    Production grammar[] = {
        create_production('S', "SaS"),
        create_production('S', "b")
    };
    int num_productions = 2;

    // Definição dos terminais e não-terminais
    char terminals[] = "ab$";
    int num_terminals = 3;
    char non_terminals[] = "S";
    int num_non_terminals = 1;

    // Tabela de parsing SLR(1)
    char* parsing_table[][MAX_SIZE] = {
        {"SaS", NULL, NULL},
        {"b", NULL, NULL}
    };

    char input_string[MAX_SIZE];
    printf("Digite a string de entrada: ");
    scanf("%s", input_string);

    // Realizando o parsing
    bool result = parse(input_string, grammar, num_productions, terminals, num_terminals, non_terminals, num_non_terminals, parsing_table);
    if (result) {
        printf("A string foi aceita pela gramática.\n");
    } else {
        printf("A string não foi aceita pela gramática.\n");
    }

    return 0;
}
