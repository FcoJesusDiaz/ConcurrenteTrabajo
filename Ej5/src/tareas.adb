with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
package body tareas is

    procedure A is
        TiempoA: Duration:=10.0;
    begin
        Put_Line("Comienzo de la tarea A");
        delay TiempoA;
        Put_Line("Fin de la tarea A");
    end A;
       
    procedure B is
        TiempoB: Duration:=8.0;
    begin
        Put_Line("Comienzo de la tarea B");
        delay TiempoB;
        Put_Line("Fin de la tarea B");
    end B;

    procedure C is
        TiempoC: Duration:=5.0;
    begin
        Put_Line("Comienzo de la tarea C");
        delay TiempoC;
        Put_Line("Fin de la tarea C");
    end C;
    
    procedure D is
        TiempoD: Duration:=4.0;
    begin
        Put_Line("Comienzo de la tarea D");
        delay TiempoD;
        Put_Line("Fin de la tarea D");
    end D;

    procedure E is
        TiempoE: Duration:=2.0;
    begin
        Put_Line("Comienzo de la tarea E");
        delay TiempoE;
        Put_Line("Fin de la tarea E");
    end E;
end tareas;