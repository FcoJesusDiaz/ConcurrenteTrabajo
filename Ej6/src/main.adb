with ollas;use ollas;
with pkg_sem;use pkg_sem;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure main is
    Num_Canibales: Positive;
    type P_mutex is access mutex;
    type P_Olla is access Olla;
    type P_sem_t is access sem_t;

    function randomDuration(I:Integer)return Duration;

    task type Tcanibal(Id:Character; mut:P_mutex; full:P_sem_t; empty:P_sem_t; oll:P_Olla);

    task body Tcanibal is
        procedure Comer is
            boolean:Integer;
        begin
            Put("[CANIBAL " & Id & "]: Esperando olla libre..."); New_line;
            waitMutex(mut.all);
            boolean:=Get_nRaciones(oll.all); 
            Put_Line("Queda(n)" & Integer'Image(boolean) & " racion/es");New_line;
                if boolean = 0 then
                    Put("[CANIBAL " & Id & "]: Despertando al cocinero... "); New_line;
                    signal(empty.all);
                    wait(full.all);
                end if;
                Coger(oll.all);
                Put("[CANIBAL " & Id & "]: Comiendo... "); New_line;
                delay 2.0;
            signalMutex(mut.all);
        end Comer;

        procedure Bailar is
        begin
            Put_Line("[CANIBAL " & Id & "]: Bailando... "); New_line;
            delay randomDuration(0);
        end Bailar;
    begin
        loop
           Comer;
           Bailar;
        end loop;
    end Tcanibal;

    task type Tcocinero(full:P_sem_t; empty:P_sem_t; oll:P_Olla);
    task body Tcocinero is
        procedure Dormir is
        begin
            Put("[COCINERO]: Durmiendo... "); New_line;
            wait(empty.all);
        end Dormir;

        procedure Reponer is
        begin
            Put("[COCINERO]: LLenando olla vacía... "); New_line;
            delay 5.0;
            LLenar(oll.all);
            signal(full.all);
            Put("[COCINERO]: Olla llena... "); New_line;
        end Reponer;

    begin
        loop
            Dormir;
            Reponer;
        end loop;
    end Tcocinero;

    --Generación de una duración aleatoria
    function randomDuration(I:Integer)return Duration is
        Random_Duration : Duration;
        type Custom is range 1..20;
        package Rand_Cust is new Ada.Numerics.Discrete_Random(Custom);
        use Rand_Cust;
        Seed : Generator;
        Num  : Custom;
    begin
        Reset(Seed);
        Num := Random(Seed);
        Random_Duration := Duration(Num); 
        return Random_Duration;
    end randomDuration;

begin
    Put("Introduce el numero de caníbales: "); Get(Num_Canibales); New_line;

    declare
        type P_TCocinero is access Tcocinero;
        type P_Tcanibal is access Tcanibal;        

        oll:P_Olla;
        Cocinero:P_Tcocinero;
        Canibal:P_Tcanibal;
        full:P_sem_t;
        empty:P_sem_t;
        mut:P_mutex;
        C:Character:='A';

    begin
        full:=new sem_t;
        empty:=new sem_t;
        mut:=new mutex;
        oll:=new Olla;
        Cocinero:=new Tcocinero(full,empty,oll);
        for i in 1..Num_Canibales loop
           Canibal:=new Tcanibal(C,mut,full,empty,oll);
           C := Character'Succ(C);
        end loop;
    end;
end main;