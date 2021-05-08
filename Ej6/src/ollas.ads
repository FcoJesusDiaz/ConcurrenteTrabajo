package ollas is

   type Olla is limited private;
       
   procedure Coger(O: in out Olla);
   procedure LLenar(O: in out Olla);
   function Get_nRaciones (O: in out Olla) return Integer;

   private
      type Status is (FULL, EMPTY);
       
      protected type Olla(Estado_olla: Status := FULL; nRaciones: Integer:=5)  is
         entry Coger;
         entry LLenar;
         function Get_nRaciones(R: Integer) return Integer;
      private
         Estado: Status := Estado_olla;
         raciones: Integer:=nRaciones;
      end Olla;   
end ollas;


