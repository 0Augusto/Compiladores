#include <stdio.h>
#include <stdlib.h>

// Definição da estrutura do nó da árvore
typedef struct TreeNode {
    int data;
    struct TreeNode * left;
    struct TreeNode * right;
} TreeNode;

// Função para criar um novo nó
TreeNode* createNode(int data) {
    TreeNode* newNode = (TreeNode*)malloc(sizeof(TreeNode));
    if (newNode == NULL) {
        printf("Erro ao alocar memória para o novo nó\n");
        exit(EXIT_FAILURE);
    }
    newNode->data = data;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Função para inserir um novo nó na árvore
TreeNode* insert(TreeNode * root, int data) {
    if (root == NULL) {
        return createNode(data);
    }
    if (data < root->data) {
        root->left = insert(root->left, data);
    } else if (data > root->data) {
        root->right = insert(root->right, data);
    }
    return root;
}

// Função para imprimir os elementos da árvore em ordem
void inorderTraversal(TreeNode* root) {
    if (root != NULL) {
        inorderTraversal(root->left);
        printf("%d ", root->data);
        inorderTraversal(root->right);
    }
}

// Função principal
int main() {
    TreeNode* root = NULL;
    root = insert(root, 50);
    insert(root, 30);
    insert(root, 20);
    insert(root, 40);
    insert(root, 70);
    insert(root, 60);
    insert(root, 80);
    
    printf("Elementos da árvore em ordem: ");
    inorderTraversal(root);
    printf("\n");
    
    return 0;
}

