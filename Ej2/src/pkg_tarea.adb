with Ada.Text_IO; 
use Ada.Text_IO;

package body pkg_tarea is
    task body tarea_t is
        nPares: integer:=0;
        nImpares: integer:=0;
    begin
        loop
            select
                accept EsPar (N: integer) do
                    if N rem 2 = 0 then
                        Put_Line("El número " & Integer'Image(N) & " es par");
                        nPares:=nPares+1;
                    else
                        Put_Line("El número " & Integer'Image(N) & " es impar");
                        nImpares:=nImpares+1;
                    end if;
                end EsPar;
            or
                accept EstadoConsultas do
                    Put_Line("El número de números pares consultados es " & Integer'Image(nPares));
                    Ada.Text_IO.New_line; 
                    Put_Line("El número de números impares consultados es " & Integer'Image(nImpares));
                end EstadoConsultas;
            end select;       
        end loop;
        
    end tarea_t;
end pkg_tarea;
