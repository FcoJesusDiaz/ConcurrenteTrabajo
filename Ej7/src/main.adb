with cuentasbancarias;use cuentasbancarias;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure main is
    Num_clientes: Positive;
    type P_Tcuenta is access Cuenta;

    function randomInteger(I:Integer)return Integer;

    task type Tcliente(Id:Character; CuentaOrigen:P_Tcuenta; CuentaDestino:P_Tcuenta);

    task body Tcliente is
    Id_origen:Character:='A';
    Id_destino:Character:='B';
    begin
        loop
            case randomInteger(0) is
                when 1 => Consultar(Id,Id_origen,CuentaOrigen.all);
                when 2 => Extraer(Id,Id_origen,CuentaOrigen.all,randomInteger(0));
                when 3 => Ingresar(Id,Id_origen,CuentaOrigen.all,randomInteger(0));
                when 4 => Transferir(Id,Id_origen,Id_destino,randomInteger(0), CuentaOrigen.all,CuentaDestino.all);
                when others => Consultar(Id,Id_destino,CuentaDestino.all);
            end case;
        end loop;
    end Tcliente;

    --Generación de una duración aleatoria
    function randomInteger(I:Integer)return Integer is
        RandomNum : Integer;
        type Custom is range 1..5;
        package Rand_Cust is new Ada.Numerics.Discrete_Random(Custom);
        use Rand_Cust;
        Seed : Generator;
        Num  : Custom;
    begin
        Reset(Seed);
        Num := Random(Seed);
        RandomNum:= Integer(Num); 
        return RandomNum;
    end randomInteger;

begin
    Put("Introduce el numero de clientes: "); Get(Num_clientes); New_line;

    declare
        type P_Tcliente is access Tcliente;        

        CuentaOrigen:P_Tcuenta;
        CuentaDestino:P_Tcuenta;
        Cliente:P_Tcliente;
        C:Character:='A';

    begin
        CuentaOrigen:=new Cuenta;
        CuentaDestino:=new Cuenta;
        
        for i in 1..Num_clientes loop
           Cliente:=new Tcliente(C,CuentaOrigen,CuentaDestino);
           C := Character'Succ(C);
        end loop;
    end;
end main;