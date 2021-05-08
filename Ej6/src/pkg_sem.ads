with Ada.Text_IO; use Ada.Text_IO;
package pkg_sem is  
    type sem_t is limited private;   
    type mutex is limited private;   

    procedure signal(sem : in out sem_t);   
    procedure wait(sem : in out sem_t);

    procedure signalMutex(sem : in out mutex);   
    procedure waitMutex(sem : in out mutex);
    
    private
        protected type sem_t(valor_inicial : integer := 0) is  
            entry wait;       
            procedure signal;   
    
            private
                valor_sem : integer := valor_inicial;
        end sem_t;

        protected type mutex(valor_inicial : integer := 1) is  
            entry wait;       
            procedure signal;   
    
            private
                valor_sem : integer := valor_inicial;
        end mutex;
end pkg_sem;