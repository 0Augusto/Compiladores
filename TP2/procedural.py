import ast
import networkx as nx
import matplotlib.pyplot as plt

class FunctionCallVisitor(ast.NodeVisitor):
    def __init__(self):
        self.graph = nx.DiGraph()
        self.current_function = None

    def visit_FunctionDef(self, node):
        self.current_function = node.name
        self.graph.add_node(node.name)
        self.generic_visit(node)
        self.current_function = None

    def visit_Call(self, node):
        if isinstance(node.func, ast.Name):
            self.graph.add_edge(self.current_function, node.func.id)
        elif isinstance(node.func, ast.Attribute) and isinstance(node.func.value, ast.Name):
            self.graph.add_edge(self.current_function, node.func.value.id)

        self.generic_visit(node)

def analyze_interprocedural(filename):
    with open(filename, 'r') as file:
        code = file.read()

    tree = ast.parse(code)
    visitor = FunctionCallVisitor()
    visitor.visit(tree)

    return visitor.graph

def draw_graph(graph):
    pos = nx.spring_layout(graph)
    nx.draw(graph, pos, with_labels=True, node_size=1500, node_color="skyblue", font_size=12, font_weight="bold")
    plt.show()

if __name__ == "__main__":
    filename = "sample_code.py"  # Nome do arquivo contendo o código Python
    interprocedural_graph = analyze_interprocedural(filename)
    draw_graph(interprocedural_graph)

