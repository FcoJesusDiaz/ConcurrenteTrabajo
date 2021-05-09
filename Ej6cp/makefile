INF = inf/
EXEC = exec/
OBJ = obj/
SRC = src/

all: dirs main 

dirs:
	mkdir -p src inf obj exec

main: $(SRC)main.adb
	gnatmake $^ ; mv $@ $(EXEC) ; mv *.ali $(INF) ; mv *.o $(OBJ)

test: 
	$(EXEC)main	

clean: 
	rm -rf *~ $(OBJ) $(INF) $(EXEC) 


