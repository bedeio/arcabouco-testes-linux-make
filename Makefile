# Base directories
SRC_P := Fontes
OBJ_P := Objetos
PROD_P := Produto

# Arcabouco
ARC := princip.o generico.o tabsimb.o \
       lerparm.o cespdin.o conta.o \
       geraalt.o intrpced.o intrpcnt.o

ARC_OBJ_P := $(addprefix $(OBJ_P)/,$(ARC))

# Teste aleatorio
TESTE_AL := $(ARC) testalt.o
TA_OBJ_P := $(addprefix $(OBJ_P)/,$(TESTE_AL))

# Teste contadores
TESTE_CON := $(ARC) testcnt.o
TC_OBJ_P := $(addprefix $(OBJ_P)/,$(TESTE_CON))

# Teste controle espaco
TESTE_CE := $(ARC) testced.o
TCE_OBJ_P := $(addprefix $(OBJ_P)/,$(TESTE_CE))

# Teste Funcoes
TESTE_FUN := $(ARC) testgen.o
TF_OBJ_P := $(addprefix $(OBJ_P)/,$(TESTE_FUN))

# Teste Ler Parametros
TESTE_LP := $(ARC) testler.o
TLP_OBJ_P := $(addprefix $(OBJ_P)/,$(TESTE_LP))

# Teste Tabela Simbolos
TESTE_TBS := $(ARC) testtbs.o
TTBS_OBJ_P := $(addprefix $(OBJ_P)/,$(TESTE_TBS))

# Flags
CFLAGS := -x c -g -I$(SRC_P) -Wall -std=c99 -Wno-comment
TESTE_LIBS := -lm

# ===

FILE_P := $(OBJ_P)/$(*F)

default: lib

lib: $(ARC_OBJ_P)
	$(AR) -rcs $(PROD_P)/ArcaboucoTeste.a $^

teste_al: $(TA_OBJ_P)
	$(CC) -o $(PROD_P)/TesteAleatorio.out $^ $(TESTE_LIBS)

teste_con: $(TC_OBJ_P)
	$(CC) -o $(PROD_P)/TesteContadores.out $^ $(TESTE_LIBS)

teste_ce: $(TCE_OBJ_P)
	$(CC) -o $(PROD_P)/TesteControleEspaco.out $^

teste_fun: $(TF_OBJ_P)
	$(CC) -o $(PROD_P)/TesteFuncoes.out $^

teste_lerparm: $(TLP_OBJ_P)
	$(CC) -o $(PROD_P)/TesteFuncoes.out $^

teste_tab: $(TTBS_OBJ_P)
	$(CC) -o $(PROD_P)/TesteTabelaSimbolos.out $^

clean:
	rm -f $(ARC_OBJ_P) $(TF_OBJ_P) $(PROD_P)/*

$(OBJ_P)/%.o: $(SRC_P)/%.c
	$(CC) -c $(CFLAGS) $< -o $@

$(OBJ_P)/%.d: $(SRC_P)/%.c
	$(CC) $(CFLAGS) -MM -MP -MT $(FILE_P).o $< > $(FILE_P).d

.PHONY: lib clean
