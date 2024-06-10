'''
S --> SaS
S --> b
A grmática é slrk ou slr1?
'''

class SLRParser:
    def __init__(self, grammar, terminals, non_terminals, parsing_table):
        self.grammar = grammar
        self.terminals = terminals
        self.non_terminals = non_terminals
        self.parsing_table = parsing_table

    def parse(self, input_string):
        stack = ['$']
        input_string += '$'
        input_index = 0

        while len(stack) > 0:
            top = stack[-1]
            current_input = input_string[input_index]

            if top in self.terminals or top == '$':
                if top == current_input:
                    stack.pop()
                    input_index += 1
                else:
                    return False
            elif (top, current_input) in self.parsing_table:
                stack.pop()
                production = self.parsing_table[(top, current_input)]
                if production != 'epsilon':
                    stack += reversed(production)
            else:
                return False

        return True if input_index == len(input_string) else False

# Exemplo de uso
grammar = {
    'S': ['SaS', 'b']
}
terminals = ['a', 'b', '$']
non_terminals = ['S']
parsing_table = {
    ('S', 'a'): ['SaS'],
    ('S', 'b'): ['b']
}

parser = SLRParser(grammar, terminals, non_terminals, parsing_table)
input_string = 'baaab$'
result = parser.parse(input_string)
print(result)  # Saída: True

