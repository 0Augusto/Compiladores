import ast

class CallGraphGenerator(ast.NodeVisitor):
    def __init__(self):
        self.graph = {}
        self.current_function = None

    def visit_FunctionDef(self, node):
        self.current_function = node.name
        if self.current_function not in self.graph:
            self.graph[self.current_function] = {'calls': [], 'args': [arg.arg for arg in node.args.args]}
        self.generic_visit(node)

    def visit_Call(self, node):
        if isinstance(node.func, ast.Name):
            function_called = node.func.id
            if self.current_function:
                self.graph[self.current_function]['calls'].append(function_called)
        self.generic_visit(node)

    def visit_Module(self, node):
        self.graph['module'] = {'calls': [], 'args': []}
        self.current_function = 'module'
        self.generic_visit(node)

def generate_call_graph(code):
    tree = ast.parse(code)
    generator = CallGraphGenerator()
    generator.visit(tree)
    return generator.graph

def print_call_graph(graph):
    for func, details in graph.items():
        print(f"Function: {func}")
        print(f"  Arguments: {details['args']}")
        print(f"  Calls: {details['calls']}")

if __name__ == '__main__':
    with open('input.py', 'r') as file:
        code = file.read()
    call_graph = generate_call_graph(code)
    print_call_graph(call_graph)

