import networkx as nx
import matplotlib.pyplot as plt
import sys

def gerar_grafo(arquivo_ast):
    G = nx.DiGraph()

    with open(arquivo_ast, 'r') as file:
        for line in file:
            if '->' in line:
                source, target = line.strip().split('->')
                G.add_edge(source.strip(), target.strip())

    return G

def visualizar_grafo(G):
    nx.draw(G, with_labels=True)
    plt.show()

if __name__ == "__main__":
    arquivo_ast = sys.argv[1]
    G = gerar_grafo(arquivo_ast)
    visualizar_grafo(G)

