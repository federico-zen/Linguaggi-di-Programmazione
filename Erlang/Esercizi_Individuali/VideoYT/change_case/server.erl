-module(server).
-export([start/0 , loop/0]).


start()->
    spawn(server,loop,[] ). %(module,function,argoments list)
   
   

loop() ->
    receive
        %pattern matching sui messaggi

        {Pid_sender,{Str,uppercase}} -> 
            Pid_sender ! {self(),string:to_upper(Str)};

        {Pid_sender,{Str,lowercase}} -> 
            Pid_sender ! {self(),string:to_lower(Str)}

    end,
    loop(). %Richiamo loop per fare tail recursion
