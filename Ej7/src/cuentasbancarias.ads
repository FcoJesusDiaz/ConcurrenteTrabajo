
package cuentasbancarias is
    type Status is (ENOUGH_MONEY, NOT_ENOUGH_MONEY);
    protected type Cuenta(saldoInicial: Integer:=5)  is
        function Consultar return Integer;
        entry Extraer(I:Integer;Id:Character);
        procedure Ingresar(I:Integer;Id:Character);
      
        private
            Saldo: Integer:= saldoInicial;
            --Estado: Status:= ENOUGH_MONEY;
            --Cant: Integer:=0;
    end Cuenta;   

    procedure Consultar(Id:Character;IdCuenta:Character;C:Cuenta);
    procedure Extraer(Id:Character;IdCuenta:Character;C: in out Cuenta;I:Integer);
    procedure Ingresar(Id:Character;Id_Cuenta:Character;C: in out Cuenta;I:Integer);
    procedure Transferir(Id:Character;Id_CuentaOrigen:Character;Id_CuentaDestino:Character;I:Integer;
     C_Origen:in out Cuenta; C_Destino:in out Cuenta);
end cuentasbancarias;