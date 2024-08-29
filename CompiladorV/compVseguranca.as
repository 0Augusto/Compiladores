.section .data
code:   .ascii "12+34+56\0"    // String de exemplo a ser tokenizada
length: .word 8                // Tamanho da string
plus_token: .ascii "plus\0"    // Representação do token '+'
number_token: .ascii "number\0"// Representação do token 'number'
error_msg: .ascii "Erro de análise\0"

.section .bss
tokens: .skip 64               // Área de memória para armazenar os tokens (simplificada)

.section .text
.global _start

_start:
    // Inicializa ponteiros e variáveis
    ldr x0, =code          // Ponteiro para o código fonte
    ldr x1, =length        // Ponteiro para o comprimento do código
    ldr w1, [x1]           // Comprimento do código
    ldr x2, =tokens        // Ponteiro para armazenar tokens
    mov w3, #0             // Índice do código

loop:
    cmp w3, w1             // Comparar índice com comprimento do código
    beq end                // Se índice >= comprimento, fim do loop
    
    ldrb w4, [x0, w3]      // Carregar o caractere atual
    
    cmp w4, #'+'           // Comparar caractere com '+'
    beq handle_plus        // Se igual, vá para handle_plus
    
    // Verificar se é um dígito
    cmp w4, #'0'
    blt handle_error       // Se menor que '0', é um erro
    cmp w4, #'9'
    bgt handle_error       // Se maior que '9', é um erro
    
    // Caso seja um número
    mov x5, w3             // Guardar posição inicial do número
    add w3, w3, #1         // Incrementar índice para o próximo caractere
parse_number:
    ldrb w4, [x0, w3]
    cmp w4, #'0'
    blt store_number_token
    cmp w4, #'9'
    bgt store_number_token
    add w3, w3, #1         // Incrementar índice se for número
    b parse_number         // Loop para processar o número

store_number_token:
    ldr x6, =number_token  // Carregar o token 'number'
    str x6, [x2]           // Armazenar o token na memória
    add x2, x2, #8         // Avançar o ponteiro de tokens
    b loop                 // Voltar para o loop principal

handle_plus:
    ldr x6, =plus_token    // Carregar o token 'plus'
    str x6, [x2]           // Armazenar o token na memória
    add x2, x2, #8         // Avançar o ponteiro de tokens
    add w3, w3, #1         // Incrementar índice para o próximo caractere
    b loop                 // Voltar para o loop principal

handle_error:
    ldr x0, =error_msg     // Carregar mensagem de erro
    bl puts                // Exibir mensagem de erro
    b end                  // Terminar o programa

end:
    // Sair do programa
    mov x8, #93            // Código de saída do sistema
    mov x0, #0             // Status de saída
    svc #0                 // Chamada de sistema para sair
