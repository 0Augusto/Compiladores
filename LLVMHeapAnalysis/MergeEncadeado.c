#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* next;
} Node;

// Função para adicionar um nó no início da lista
void addNode(Node** headRef, int newData) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = newData;
    newNode->next = *headRef;
    *headRef = newNode;
}

// Função para imprimir a lista
void printList(Node* node) {
    while (node != NULL) {
        printf("%d -> ", node->data);
        node = node->next;
    }
    printf("NULL\n");
}

// Função para dividir a lista em duas metades
void splitList(Node* source, Node** frontRef, Node** backRef) {
    Node* fast;
    Node* slow;
    slow = source;
    fast = source->next;

    while (fast != NULL) {
        fast = fast->next;
        if (fast != NULL) {
            slow = slow->next;
            fast = fast->next;
        }
    }

    *frontRef = source;
    *backRef = slow->next;
    slow->next = NULL;
}

// Função para mesclar duas sublistas
Node* sortedMerge(Node* a, Node* b) {
    Node* result = NULL;

    if (a == NULL)
        return b;
    else if (b == NULL)
        return a;

    if (a->data <= b->data) {
        result = a;
        result->next = sortedMerge(a->next, b);
    } else {
        result = b;
        result->next = sortedMerge(a, b->next);
    }

    return result;
}

// Função de ordenação Merge Sort para lista encadeada
void mergeSort(Node** headRef) {
    Node* head = *headRef;
    Node* a;
    Node* b;

    if ((head == NULL) || (head->next == NULL)) {
        return;
    }

    splitList(head, &a, &b);
    mergeSort(&a);
    mergeSort(&b);

    *headRef = sortedMerge(a, b);
}

int main() {
    Node* res = NULL;
    Node* a = NULL;

    // Adicionando elementos à lista
    addNode(&a, 15);
    addNode(&a, 10);
    addNode(&a, 5);
    addNode(&a, 20);
    addNode(&a, 3);
    addNode(&a, 2);

    // Ordenando a lista
    mergeSort(&a);

    printf("Lista ordenada: \n");
    printList(a);

    return 0;
}
