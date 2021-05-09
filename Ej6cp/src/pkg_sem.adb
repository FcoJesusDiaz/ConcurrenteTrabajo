package body pkg_sem is  

    procedure signal(sem : in out sem_t) is
    begin
        sem.signal;
    end signal;
    
    procedure wait(sem : in out sem_t) is
    begin
        sem.wait;
    end wait;
    
    protected body sem_t is  
            entry wait when valor_sem > 0  is
            begin   
                valor_sem:=valor_sem-1;
            end wait;

            procedure signal is
            begin  
                valor_sem:=valor_sem+1;
            end signal;
    end sem_t;
end pkg_sem;