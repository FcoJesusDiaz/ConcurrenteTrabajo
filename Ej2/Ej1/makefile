INF = inf/
EXEC = exec/
OBJ = obj/
SRC = src/

all: dirs main 

dirs:
	mkdir -p src inf obj exec

move: dirs
	mv *.adb src
	mv *.ads src

main: $(SRC)main.adb
	gnatmake $^
	mv main.ali $(INF)
	mv main.o $(OBJ)
	mv $@ $(EXEC)

test: $(EXEC)main
	$(EXEC)main	

clean: 
	rm -rf *~ $(OBJ) $(INF) $(EXEC) 

