#@author: Henrique Augusto
'''
O Clang oferece várias opções de otimização que podem ajudar a melhorar o desempenho do código. Aqui estão algumas técnicas que os desenvolvedores podem usar para otimizar o código quando o Clang não o faz automaticamente:

1. **Ativar níveis de otimização**: O Clang oferece várias opções de otimização que podem ser ativadas usando a flag `-O`. Por exemplo, `-O1`, `-O2`, `-O3` e `-Ofast` ativam diferentes níveis de otimização. Experimentar diferentes níveis de otimização pode resultar em melhorias significativas no desempenho, embora possa aumentar o tempo de compilação.

2. **Especificar diretivas de otimização**: O Clang permite que os desenvolvedores especifiquem diretivas de otimização mais detalhadas usando a flag `-mllvm`. Por exemplo, `-mllvm -vectorize-loops` pode ativar a vetorização de loops, `-mllvm -unroll-loops` pode ativar a desenrolagem de loops, e assim por diante. Consultar a documentação do Clang para ver todas as opções disponíveis.

3. **Utilizar atributos específicos**: O Clang suporta atributos específicos que podem ajudar o compilador a otimizar o código de maneira mais eficaz. Por exemplo, o atributo `__attribute__((hot))` pode ser usado para marcar funções como "quentes", o que informa ao compilador para otimizá-las mais agressivamente.

4. **Perfil de código**: Usar informações de perfil de código pode ajudar o Clang a fazer otimizações mais inteligentes. Isso geralmente envolve compilar o código com a flag `-fprofile-generate` para gerar um perfil de código durante a execução e, em seguida, compilar novamente com a flag `-fprofile-use` para usar essas informações de perfil durante a otimização.

5. **Refatoração de código**: Às vezes, pequenas mudanças no código podem levar a melhorias significativas no desempenho. Isso pode incluir evitar operações desnecessárias, reduzir a complexidade do algoritmo ou reescrever partes do código para melhor aproveitar as otimizações do compilador.

É importante observar que nem todas as otimizações são apropriadas para todos os casos e que otimizar prematuramente pode levar a código mais complexo e difícil de manter. Portanto, é importante equilibrar os esforços de otimização com os requisitos de desempenho e manutenção do código.

'''
#!/bin/bash

# Verifique se o arquivo de entrada foi fornecido
if [ -z "$1" ]
then
  echo "Por favor, forneça um arquivo de entrada."
  exit 1
fi

# Nome do arquivo sem extensão
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# Compila o programa C com diferentes níveis de otimização e gera a representação AST
for opt in O0 O1 O2 O3 Ofast
do
  clang -$opt -Xclang -ast-dump -fsyntax-only "$1" > "${filename}_${opt}_ast.txt"
done
