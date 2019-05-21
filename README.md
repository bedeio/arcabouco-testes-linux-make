# Makefile para o Arcabouco de Testes, usado para INF 1301 na PUC-Rio, no Linux
### Programacao Modular PUC-Rio 2019.1

## Como usar
1. Copie o `Makefile` e o script `fix.sh` para o diretorio `arcabouc` do projeto (Arcabouco de Testes v2).
1(a). Se quiser adicionalmente compilar o modulo lista e seu teste, substitua o diretorio `lista` do arcabouco com o desse repo.
2. Rode o `fix.sh` com a pasta `arcabouc/Fontes` como argumento, para alterar os arquivos fonte do projeto para funcionar no Linux. 
3. Quando isso estiver feito, rode `make` para gerar a biblioteca (.a) do Arcabouco.
3(a). Para compilar o teste do modulo lista, rode `make` no diretorio `lista` na raiz do projeto (Arc. de Testes).

## Extras
- Para compilar os testes do Arcabouco, consulte os alvos de compilacao definidos no Makefile.
- Um Makefile para o modulo lista eh fornecido com arquivos ja processados pelo `fix.sh`.

### Pre-requisitos (testados)
- Arcabouco de Testes v2.02
- GNU Core Utilities 
- GNU Rename




