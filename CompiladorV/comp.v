module main

import os

// Estruturas para representar o código fonte
struct Token {
    kind string
    value string
}

struct Node {
    kind string
    value string
    left &Node
    right &Node
}

// Função para tokenizar o código fonte
fn tokenize(code string) []Token {
    mut tokens := []Token{}
    mut i := 0
    for i < code.len {
        c := code[i]
        match c {
            `+` {
                tokens << Token{kind: 'plus', value: '+'}
                i++
            }
            `p` {
                if i + 4 < code.len && code[i..i+5] == 'print' {
                    tokens << Token{kind: 'print', value: 'print'}
                    i += 5
                } else {
                    i++
                }
            }
            `0`...`9` {
                mut num := ''
                for i < code.len && code[i] in `0`...`9` {
                    num += code[i].str()
                    i++
                }
                tokens << Token{kind: 'number', value: num}
            }
            else {
                i++
            }
        }
    }
    return tokens
}

// Função para criar a árvore de sintaxe abstrata (AST)
fn parse(tokens []Token) &Node {
    mut index := 0
    mut root := &Node{}
    if tokens.len > 0 {
        match tokens[index].kind {
            'print' {
                index++
                mut num_node := &Node{kind: 'number', value: tokens[index].value}
                root = &Node{kind: 'print', left: num_node}
            }
            else {
                // Handle other cases if necessary
            }
        }
    }
    return root
}

// Função para gerar código para a arquitetura ARM64 (exemplo fictício)
fn generate_code(ast &Node) string {
    mut code := ''
    match ast.kind {
        'print' {
            code += 'print '
            if ast.left.kind == 'number' {
                code += ast.left.value
            }
        }
        else {
            // Handle other AST node types if necessary
        }
    }
    return code
}

fn main() {
    code := 'print 42'
    tokens := tokenize(code)
    ast := parse(tokens)
    generated_code := generate_code(ast)
    println(generated_code)
}
