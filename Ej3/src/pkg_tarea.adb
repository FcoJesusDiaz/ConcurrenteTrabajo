with Text_IO; use Text_IO;
with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Real_Time; use Ada.Real_Time;

package body pkg_tarea is    
    task body tarea_periodica_t is 
    InicioEjecucion: Time;
    TiempoActivacion: Time_Span:=Seconds(1);
    InicioPeriodo: Time;
    Periodo: constant Time_Span:=Milliseconds(2000);
    TiempoEjecucion: Time_Span:=Milliseconds(1000);
    variable_entera: Integer:=0;
    begin
        loop
            InicioPeriodo:=Clock;
            --Activación
            delay To_Duration(TiempoActivacion);

            --Tiempo de cómputo
            InicioEjecucion:=Clock;
            variable_entera:=0;
            while (Clock-InicioEjecucion) < TiempoEjecucion loop
                variable_entera:=variable_entera+1;
            end loop;

            Put_Line("Tarea("&Image(Current_Task)&"): Variable interna: " & Integer'Image(variable_entera));

            --Tiempo que pasa hasta la siguiente iteración 
            delay until "+"(InicioPeriodo,Periodo);
        end loop;
    end tarea_periodica_t;
end pkg_tarea;