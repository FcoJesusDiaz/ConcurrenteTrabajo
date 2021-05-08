with pkg_sem;use pkg_sem;
package body ollas is
       
   procedure Coger(O: in out Olla) is
   begin
      O.Coger;
   end Coger;

   procedure LLenar(O: in out Olla) is
   begin
      O.LLenar;
   end LLenar;
      
   function Get_nRaciones (O: in out Olla) return Integer is
   begin
      return O.Get_nRaciones(0);
   end Get_nRaciones;

   protected body Olla is
      entry Coger when Estado = FULL is
      begin
         raciones:=raciones-1;
         if raciones = 0 then
            Estado:= EMPTY;
         end if;
      end Coger;

      entry LLenar when Estado = EMPTY is
      begin
         raciones:=5;
         Estado:=FULL;
      end LLenar;

      function Get_nRaciones (R:Integer) return Integer is
      begin
         return raciones; 
      end Get_nRaciones;
   end Olla;
end ollas;

