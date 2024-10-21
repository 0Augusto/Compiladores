#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Estrutura que representa um nó da lista, incluindo informações de tempo
typedef struct Node {
    int data;
    struct Node* next;
    time_t alloc_time;  // Hora da alocação
} Node;

// Função para criar um novo nó e registrar o tempo de alocação
Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (!newNode) {
        printf("Erro na alocação de memória.\n");
        exit(1);
    }
    newNode->data = data;
    newNode->next = NULL;
    newNode->alloc_time = time(NULL);  // Registra o tempo de alocação
    return newNode;
}

// Função para adicionar um nó no início da lista
void addNode(Node** head, int data) {
    Node* newNode = createNode(data);
    newNode->next = *head;
    *head = newNode;
}

// Função para imprimir os elementos da lista e o tempo de vida no heap
void printListAndLifetime(Node* head) {
    Node* temp = head;
    time_t current_time = time(NULL);  // Obtém o tempo atual
    while (temp != NULL) {
        double lifetime = difftime(current_time, temp->alloc_time);  // Calcula o tempo de vida no heap
        printf("Nó com valor %d -> Tempo de vida no heap: %.2f segundos\n", temp->data, lifetime);
        temp = temp->next;
    }
}

// Função para liberar a memória da lista e mostrar o tempo de vida final
void freeList(Node* head) {
    Node* temp;
    time_t current_time;
    double lifetime;

    while (head != NULL) {
        temp = head;
        head = head->next;

        // Calcula o tempo de vida do nó no heap
        current_time = time(NULL);
        lifetime = difftime(current_time, temp->alloc_time);

        printf("Liberando nó com valor %d -> Tempo total de vida no heap: %.2f segundos\n", temp->data, lifetime);

        free(temp);
    }
}

int main() {
    Node* head = NULL;

    // Adiciona nós na lista
    addNode(&head, 10);
    addNode(&head, 20);
    addNode(&head, 30);

    // Imprime os elementos da lista e o tempo de vida atual no heap
    printf("Antes da liberação:\n");
    printListAndLifetime(head);

    // Libera a memória da lista e exibe o tempo de vida final de cada nó
    freeList(head);

    return 0;
}

