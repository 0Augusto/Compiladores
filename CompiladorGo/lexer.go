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
	IDENT
	INT
	ASSIGN
	SEMICOLON
	LPAREN
	RPAREN
	PLUS
	FUNCTION
	COMMA
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
	case '=':
		tok = Token{ASSIGN, string(l.ch)}
	case ';':
		tok = Token{SEMICOLON, string(l.ch)}
	case '(':
		tok = Token{LPAREN, string(l.ch)}
	case ')':
		tok = Token{RPAREN, string(l.ch)}
	case '+':
		tok = Token{PLUS, string(l.ch)}
	case ',':
		tok = Token{COMMA, string(l.ch)}
	default:
		if isLetter(l.ch) {
			value := l.readIdentifier()
			if value == "fn" {
				tok = Token{FUNCTION, value}
			} else {
				tok = Token{IDENT, value}
			}
			return tok
		} else if isDigit(l.ch) {
			tok = Token{INT, l.readNumber()}
			return tok
		} else {
			tok = Token{ILLEGAL, string(l.ch)}
			fmt.Printf("Unexpected character: %c\n", l.ch)
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

type Environment struct {
	variables map[string]bool
	functions map[string]bool
}

func NewEnvironment() *Environment {
	return &Environment{
		variables: make(map[string]bool),
		functions: make(map[string]bool),
	}
}

func (env *Environment) DeclareVariable(name string) {
	env.variables[name] = true
}

func (env *Environment) DeclareFunction(name string) {
	env.functions[name] = true
}

func (env *Environment) IsVariableDeclared(name string) bool {
	return env.variables[name]
}

func (env *Environment) IsFunctionDeclared(name string) bool {
	return env.functions[name]
}

type Parser struct {
	lexer     *Lexer
	currentToken Token
	env       *Environment
}

func NewParser(lexer *Lexer) *Parser {
	return &Parser{
		lexer:     lexer,
		env:       NewEnvironment(),
	}
}

func (p *Parser) Parse() {
	for p.currentToken.Type != EOF {
		switch p.currentToken.Type {
		case IDENT:
			if !p.env.IsVariableDeclared(p.currentToken.Value) {
				fmt.Printf("Error: Variable '%s' used before declaration.\n", p.currentToken.Value)
			}
			p.nextToken() // move to next token
		case FUNCTION:
			p.nextToken()
			if p.currentToken.Type == IDENT {
				p.env.DeclareFunction(p.currentToken.Value)
				p.nextToken()
			} else {
				fmt.Println("Error: Expected function name after 'fn'.")
			}
		case ASSIGN:
			p.nextToken()
			if p.currentToken.Type == IDENT {
				p.env.DeclareVariable(p.currentToken.Value)
				p.nextToken()
			} else {
				fmt.Println("Error: Expected variable name after '='.")
			}
		default:
			p.nextToken()
		}
	}
}

func (p *Parser) nextToken() {
	p.currentToken = p.lexer.NextToken()
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
	p := NewParser(l)

	p.nextToken() // Initialize the parser with the first token
	p.Parse()
}
