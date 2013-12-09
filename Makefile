COMPILER=clang
CFLAGS=-Wall -Weverything -g -std=c11
LIBS=-lcheck
CHECKMK=/usr/bin/checkmk
PROJECT=add_two_numbs

all:	$(PROJECT)
  
$(PROJECT):	main.o $(PROJECT).o
	$(COMPILER) -o $(PROJECT) main.o $(PROJECT).o

$(PROJECT).o:	$(PROJECT).c $(PROJECT).h
	$(COMPILER) $(CFLAGS) -c $(PROJECT).c

main.o:	main.c $(PROJECT).h
	$(COMPILER) $(CFLAGS) -c main.c
  
test:	$(PROJECT)_test
	./$(PROJECT)_test

$(PROJECT)_test:	$(PROJECT)_test.o $(PROJECT).o
	$(COMPILER) -o $(PROJECT)_test $(PROJECT).o $(PROJECT)_test.o $(LIBS)

$(PROJECT)_test.o:	$(PROJECT)_test.c $(PROJECT).h
	$(COMPILER) $(CFLAGS) -c $(PROJECT)_test.c

$(PROJECT)_test.c:	$(PROJECT)_test.check
	$(CHECKMK) $(PROJECT)_test.check > $(PROJECT)_test.c
  

clean:
	rm *.o
	rm $(PROJECT)
	rm $(PROJECT)_test
	rm $(PROJECT)_test.c
