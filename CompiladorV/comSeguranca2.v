fn tokenize(code string) ?[]Token {
    mut tokens := []Token{}
    mut i := 0

    while i < code.len {
        c := code[i]

        if c.is_whitespace() {
            i++
            continue
        }
        
        match c {
            `+` {
                tokens << Token{kind: 'plus', value: '+'}
                i++
            }
            `p` {
                if code[i..].starts_with('print') {
                    tokens << Token{kind: 'print', value: 'print'}
                    i += 5
                } else {
                    return error('Erro de análise: Comando desconhecido na posição $i.')
                }
            }
            `0`...`9` {
                start := i
                while i < code.len && code[i].is_digit() {
                    i++
                }
                tokens << Token{kind: 'number', value: code[start..i]}
            }
            else {
                return error('Erro de análise: Caractere inválido "$c" na posição $i.')
            }
        }
    }
    
    return tokens
}
