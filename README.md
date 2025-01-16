# LLVM Dead Code Elimination (DCE) Analysis Tool

Este projeto fornece ferramentas para análise comparativa do Dead Code Elimination (DCE) do LLVM em diferentes níveis de otimização.

## Pré-requisitos

### Instalação das Dependências

1. **LLVM e Clang**
```bash
# macOS (usando Homebrew)
brew install llvm

# Ubuntu/Debian
sudo apt-get update
sudo apt-get install llvm clang

# Fedora
sudo dnf install llvm clang
```

2. **Python e ambiente virtual**
```bash
# Instalar Python (macOS)
brew install python3

# Criar e ativar ambiente virtual
mkdir meu_projeto
cd meu_projeto
python3 -m venv venv
source venv/bin/activate
```

3. **Dependências Python**
```bash
# Atualizar pip
python3 -m pip install --upgrade pip

# Instalar dependências do requirements.txt
python3 -m pip install -r requirements.txt
```

## Estrutura do Projeto

```
.
├── src/                    # Arquivos fonte para análise
├── scripts/                # Scripts de automação
├── results/                # Resultados das análises
├── venv/                   # Ambiente virtual Python
├── dce_pipeline.sh         # Script principal
├── requirements.txt        # Dependências Python
└── README.md              # Esta documentação
```

## Uso do Pipeline

### Pipeline Básico

1. **Preparar o ambiente**
```bash
# Tornar o script executável
chmod +x dce_pipeline.sh

# Ativar ambiente virtual (se ainda não estiver ativo)
source venv/bin/activate
```

2. **Executar análise em um arquivo**
```bash
./dce_pipeline.sh exemplo.c
```

3. **Executar em múltiplos arquivos**
```bash
./dce_pipeline.sh arquivo1.c arquivo2.c arquivo3.c
```

### Análise Manual com LLVM

1. **Gerar LLVM IR**
```bash
# Gerar IR sem otimizações
clang -O0 -S -emit-llvm arquivo.c -o arquivo.ll

# Gerar IR com diferentes níveis de otimização
clang -O1 -S -emit-llvm arquivo.c -o arquivo.O1.ll
clang -O2 -S -emit-llvm arquivo.c -o arquivo.O2.ll
clang -O3 -S -emit-llvm arquivo.c -o arquivo.O3.ll
```

2. **Aplicar DCE**
```bash
# Aplicar DCE em arquivo IR
opt -passes=dce -S arquivo.ll -o arquivo.dce.ll

# Aplicar DCE com estatísticas
opt -passes=dce -stats arquivo.ll -o arquivo.dce.ll
```

3. **Visualização e Análise**
```bash
# Converter bitcode para formato legível
llvm-dis < arquivo.bc > arquivo.ll

# Gerar CFG (Control Flow Graph)
opt -passes=dot-cfg arquivo.ll

# Visualizar diferenças
diff arquivo.ll arquivo.dce.ll
```

## Outputs e Análise

### Arquivos Gerados

- `*.ll`: LLVM IR intermediário
- `*.dce.ll`: IR após aplicação do DCE
- `*.stats.txt`: Estatísticas de análise
- `*.opt_comparison.txt`: Comparação entre níveis de otimização

### Estrutura dos Resultados

```
results/
├── arquivo1/
│   ├── arquivo1.ll          # IR original
│   ├── arquivo1.dce.ll      # IR após DCE
│   ├── arquivo1.stats.txt   # Estatísticas
│   └── arquivo1.opt_comparison.txt
├── arquivo2/
    └── ...
```

## Análise de Resultados

### Estatísticas Básicas
```bash
# Contar instruções em um arquivo IR
grep -c "define" arquivo.ll

# Comparar número de instruções antes e depois do DCE
wc -l arquivo.ll arquivo.dce.ll
```

### Visualização Avançada
```bash
# Gerar gráfico de fluxo de controle
opt -passes=dot-cfg arquivo.ll
dot -Tpng cfg.dot -o cfg.png

# Análise detalhada do DCE
opt -passes=dce -debug-only=dce arquivo.ll -o /dev/null
```

## Dicas e Solução de Problemas

### Problemas Comuns

1. **Comando não encontrado**
```bash
# Verificar instalação do LLVM
which clang
which opt

# Adicionar LLVM ao PATH (se necessário)
export PATH="/usr/local/opt/llvm/bin:$PATH"
```

2. **Erros de Permissão**
```bash
# Corrigir permissões do script
chmod +x dce_pipeline.sh

# Verificar permissões do diretório
ls -la
chmod 755 diretório
```

3. **Problemas com ambiente virtual**
```bash
# Recriar ambiente virtual
rm -rf venv
python3 -m venv venv
source venv/bin/activate
python3 -m pip install -r requirements.txt
```

## Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a licença CCO - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.
