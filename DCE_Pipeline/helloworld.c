#include <stdio.h>

void never_called() {
    printf("This function is never called\n");
}

void hello() {
    printf("Hello, World!\n");
}

int main() {
    hello();
    return 0;
}
