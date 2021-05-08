with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with tareas;use tareas;

procedure main is
    Superperiodo:Time_Span:=Milliseconds(100000);
    PeriodoSecundario:Time_Span:=Milliseconds(25000);
    SiguienteMarco:Time;
begin
    SiguienteMarco:=Clock;
    loop    
        Put_Line("---INICIO DEL SUPERPERIODO--");
        --Marco 1
        Put_Line("-----Inicio del Marco 1-----");
        SiguienteMarco:=SiguienteMarco+PeriodoSecundario;
        A;
        B;
        C;
        E;
        delay until(SiguienteMarco);
        Put_Line("-----Fin del Marco 1--------");

        --Marco 2
        Put_Line("-----Inicio del Marco 2-----");
        SiguienteMarco:=SiguienteMarco+PeriodoSecundario;
        A;
        B;
        D;
        delay until(SiguienteMarco);
        Put_Line("-----Fin del Marco 2--------");

        --Marco 3
        Put_Line("-----Inicio del Marco 3-----");
        SiguienteMarco:=SiguienteMarco+PeriodoSecundario;
        A;
        B;
        C;
        delay until(SiguienteMarco);
        Put_Line("-----Fin del Marco 3--------");

        --Marco 4
        Put_Line("-----Inicio del Marco 4-----");
        SiguienteMarco:=SiguienteMarco+PeriodoSecundario;
        A;
        B;
        D;
        delay until(SiguienteMarco);
        Put_Line("-----Fin del Marco 4--------");
    
        Put_Line("----FIN DEL SUPERPERIODO---");
    end loop;
end main;