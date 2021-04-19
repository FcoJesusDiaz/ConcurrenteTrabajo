with Ada.Text_IO;
with Ada.Characters.Handling;

package body pkg_procedure is     
    procedure Leer_Entero(Num : out Integer) is  
        -- Lee de entrada un número entero no dejando al usuario escribir  
        -- caracteres que no sean dígitos.  
        -- Para Linux cambiar por ASCII.LF sino ASCII.CR  
        Intro : constant Character := ASCII.LF; 
        -- Para Linux cambiar por ASCII.Del sino ASCII.BS  
        Back : constant Character := ASCII.Del;
        
        Char : Character;  
        Fin : Boolean := False;  
        Numero : Natural := 0;

        -- Cadena para leer el número carácter a carácter 
        -- El máximo de caracteres es Integer'Width-1 porque no leemos signo  
        Cadena_Numero : String (1 .. Integer'Width - 1);

        begin 
            Ada.Text_IO.New_line; 
            Ada.Text_IO.Put ("Escriba un número y pulse Enter: ");
            while not Fin loop        
                Ada.Text_IO.Get_Immediate (Char);
                if Ada.Characters.Handling.Is_Digit (Char) then    
                    Numero := Numero + 1;    
                    Cadena_Numero(Numero) := Char;
                    Ada.Text_IO.Put (Char);
                elsif Char = Intro then    
                    Fin := True;
                elsif Numero>0 and Char = Back then 
                   -- Si el usuario ha pulsado la tecla backspace    
                   -- borra el dígito escrito anteriormente    
                   Ada.Text_IO.Put (ASCII.BS & ' ' & ASCII.BS);    
                   Numero:=Numero-1;
                end if;
            end loop;
            Numero := Integer'Value (Cadena_Numero (1 .. Numero));  
            Ada.Text_IO.New_line;  
            Num := Numero;

            exception   
                when Constraint_Error =>     
                    Ada.Text_IO.New_line;    
                    Ada.Text_IO.Put_Line ("Lo siento: " & Cadena_Numero & " es demasiado largo para almacenarse");   
                    Num := 0;     
        end Leer_Entero;
end pkg_procedure;