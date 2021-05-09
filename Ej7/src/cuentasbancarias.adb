with Ada.Text_IO;use Ada.Text_IO;
with Ada.Task_Identification;use Ada.Task_Identification;

package body cuentasbancarias is

    procedure Consultar(Id:Character;IdCuenta:Character;C:Cuenta) is
    begin
        Put_Line("[CLIENTE "& Id & "]: Realizando consulta...");
        Put_Line("[CLIENTE "& Id & "]: Quedan " & Integer'Image(C.Consultar) & " euros en la cuenta bancaria " & IdCuenta & "...");
        delay 3.0;
    end Consultar;

    procedure Extraer(Id:Character;IdCuenta:Character; C:in out Cuenta; I:Integer) is
    begin
        Put_Line("[CLIENTE "& Id & "]: Extrayendo " & Integer'Image(I) & "euros...");
        C.Extraer(I,IdCuenta);
        delay 3.0;
    end Extraer;

    procedure Ingresar(Id:Character;Id_Cuenta:Character;C: in out Cuenta;I:Integer) is
    begin
        Put_Line("[CLIENTE "& Id & "]: Ingresando " & Integer'Image(I) & "euros...");
        C.Ingresar(I,Id_Cuenta);
        delay 3.0;
        
    end Ingresar;

    procedure Transferir(Id:Character;Id_CuentaOrigen:Character;Id_CuentaDestino:Character;I:Integer; 
    C_Origen:in out Cuenta; C_Destino:in out Cuenta) is
    begin
        saldo=consult;
        Put_Line("[CLIENTE "& Id & "]: Realizando transferencia...");
        C_Origen.Extraer(I,Id_CuentaOrigen);
        
        if Consul=saldo-I then
        end if;
        delay 3.0;
        C_Destino.Ingresar(I,Id_CuentaDestino);
        delay 3.0;
    end Transferir;
       
    protected body Cuenta is
        function Consultar return Integer is
        begin
            return Saldo;
        end Consultar;

        entry Extraer(I:Integer;Id:Character) when Saldo >= I is
        begin
            Saldo:=Saldo-I; 
            Put_Line("Se han extraido " & Integer'Image(Saldo) & " de la cuenta " & Id & "...");
           
        end Extraer;

        procedure Ingresar(I:Integer;Id:Character) is
        begin
            Saldo:=Saldo+I;
            Put_Line("Se han ingresado " & Integer'Image(Saldo) & " en la cuenta " & Id & "...");
        end Ingresar;
    end Cuenta;   
end cuentasbancarias;