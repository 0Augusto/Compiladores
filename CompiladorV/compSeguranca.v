fn tokenize(code string) []Token {
    mut tokens := []Token{}
    mut i := 0
    for i < code.len {
        c := code[i]
        if !c.is_whitespace() { // Ignorar espaços em branco
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
                        // Erro: Comando desconhecido
                        eprintln('Erro de análise: Comando desconhecido.')
                        return []
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
                    // Erro: Caractere inválido
                    eprintln('Erro de análise: Caractere inválido.')
                    return []
                }
            }
        } else {
            i++
        }
    }
    return tokens
}
