with ollas;use ollas;
with pkg_sem;use pkg_sem;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure main is
    Num_Canibales: Positive;
    type P_Olla is access Olla;
    type P_sem_t is access sem_t;

    function randomDuration(I:Integer)return Duration;

    task type Tcanibal(Id:Character; empty:P_sem_t; oll:P_Olla);

    task body Tcanibal is
        procedure Comer is
        begin
            Put_Line("[CANIBAL " & Id & "]: Accediendo a la olla... ");
            delay 2.0;
            Coger(Id,oll.all,empty.all);
            delay 2.0;
        end Comer;

        procedure Bailar is
        begin
            Put_Line("[CANIBAL " & Id & "]: Bailando... "); 
            delay randomDuration(0);
        end Bailar;
    begin
        loop
           Comer;
           Bailar;
        end loop;
    end Tcanibal;

    task type Tcocinero(empty:P_sem_t; oll:P_Olla);
    task body Tcocinero is
        procedure Dormir is
        begin
            Put_Line("[COCINERO]: Durmiendo... ");
            wait(empty.all);
        end Dormir;

        procedure Reponer is
        begin
            Put_Line("[COCINERO]: LLenando olla vacía... ");
            delay 5.0;
            LLenar(oll.all);
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
        empty:P_sem_t;
        C:Character:='A';

    begin
        empty:=new sem_t;
        oll:=new Olla;
        Cocinero:=new Tcocinero(empty,oll);
        for i in 1..Num_Canibales loop
           Canibal:=new Tcanibal(C,empty,oll);
           C := Character'Succ(C);
        end loop;
    end;
end main;