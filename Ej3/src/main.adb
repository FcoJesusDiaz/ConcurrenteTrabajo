with Text_IO; use Text_IO;
with pkg_tarea; use pkg_tarea;

procedure main is
    T1: tarea_periodica_t;
    T2: tarea_periodica_t;
    
begin
    Put_Line ("---- Inicio del programa main ----");
    delay 8.0;
    abort T1;
    abort T2;
    delay 2.0;
    Put_Line ("---- Fin del programa main ----");
end main;
