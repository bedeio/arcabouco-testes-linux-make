AP := ../arcabouc
LIBS := ArcaboucoTeste.a
DEPS := testlis.c lista.c

testlis: arcabouco
	$(CC) -Wl,--verbose -o TesteLis -L$(AP)/Produto -l:$(LIBS) $(DEPS)

arcabouco:
	$(MAKE) -C ../arcabouc
