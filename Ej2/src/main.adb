with Text_IO; use Text_IO;
with pkg_tarea; use pkg_tarea;
with pkg_procedure; use pkg_procedure;

procedure main is
    T: tarea_t;
    numero: Integer;
begin
    Put_Line ("---- Inicio del programa main ----");
    loop
        T.EstadoConsultas;
        Leer_Entero(numero);
        if numero = 0 then
            exit;
        else 
            T.EsPar(numero);
        end if;
    end loop;
    Put_Line ("---- Fin del programa main ----");
    abort T;
end main;
