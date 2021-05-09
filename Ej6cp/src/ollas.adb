with pkg_sem;use pkg_sem;
with Ada.Text_IO; use Ada.Text_IO;

package body ollas is
       
   procedure Coger(Id:Character; O: in out Olla; E: in out sem_t) is
   begin
      O.Coger(Id,E);
   end Coger;

   procedure LLenar(O: in out Olla) is
   begin
      O.LLenar;
   end LLenar;

   protected body Olla is
      entry Coger(Id:Character; E:in out sem_t) when Estado = FULL is
      begin
         Put_Line("[Canibal " & Id & "]: Comiendo...");
         raciones:=raciones-1;
         Put_Line("Quedan " & Integer'Image(raciones) & " raciones");
         if raciones = 0 then
            Estado:= EMPTY;
            signal(E);
         end if;
      end Coger;

      entry LLenar when Estado = EMPTY is
      begin
         Put_Line("[COCINERO]: Olla llena... ");
         raciones:=5;
         Estado:=FULL;
      end LLenar;
   end Olla;
end ollas;

