with pkg_sem;use pkg_sem;
package ollas is
   type Status is (FULL, EMPTY);
       
   protected type Olla(Estado_olla: Status := FULL; nRaciones: Integer:=5)  is
      entry Coger(Id:Character; E: in out sem_t);
      entry LLenar;
      
      private
         Estado: Status := Estado_olla;
         raciones: Integer:=nRaciones;
   end Olla;   

   procedure Coger(Id:Character;O: in out Olla; E: in out sem_t);
   procedure LLenar(O: in out Olla);
end ollas;


