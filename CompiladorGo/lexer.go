package main

import (
	"fmt"
	"strings"
)

type TokenType int

const (
	ILLEGAL TokenType = iota
	EOF
	WS

	IDENT // fields, function names etc.
	INT   // integers
)

type Token struct {
	Type  TokenType
	Value string
}

type Lexer struct {
	input        string
	position     int
	readPosition int
	ch           byte
}

func New(input string) *Lexer {
	l := &Lexer{input: input}
	l.readChar()
	return l
}

func (l *Lexer) readChar() {
	if l.readPosition >= len(l.input) {
		l.ch = 0
	} else {
		l.ch = l.input[l.readPosition]
	}
	l.position = l.readPosition
	l.readPosition++
}

func (l *Lexer) NextToken() Token {
	var tok Token

	l.skipWhitespace()

	switch l.ch {
	case 0:
		tok = Token{EOF, ""}
	default:
		if isLetter(l.ch) {
			tok.Type = IDENT
			tok.Value = l.readIdentifier()
			return tok
		} else if isDigit(l.ch) {
			tok.Type = INT
			tok.Value = l.readNumber()
			return tok
		} else {
			tok = Token{ILLEGAL, string(l.ch)}
		}
	}

	l.readChar()
	return tok
}

func (l *Lexer) readIdentifier() string {
	position := l.position
	for isLetter(l.ch) {
		l.readChar()
	}
	return l.input[position:l.position]
}

func (l *Lexer) readNumber() string {
	position := l.position
	for isDigit(l.ch) {
		l.readChar()
	}
	return l.input[position:l.position]
}

func (l *Lexer) skipWhitespace() {
	for l.ch == ' ' || l.ch == '\t' || l.ch == '\n' || l.ch == '\r' {
		l.readChar()
	}
}

func isLetter(ch byte) bool {
	return 'a' <= ch && ch <= 'z' || 'A' <= ch && ch <= 'Z' || ch == '_'
}

func isDigit(ch byte) bool {
	return '0' <= ch && ch <= '9'
}

func main() {
	input := `let five = 5;
let ten = 10;
let add = fn(x, y) {
  x + y;
};
let result = add(five, ten);
`
	l := New(input)

	for {
		tok := l.NextToken()
		if tok.Type == EOF {
			break
		}

		fmt.Printf("%+v\n", tok)
	}
}

