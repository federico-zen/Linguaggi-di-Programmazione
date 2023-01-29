-module(test).
-export([start/2]).

start(Node,N)->
    dftp:start(Node,N),
    timer:sleep(1000),


    TestUpload = [{file1,"F1"},{file2,"F2"},{file3,"F3"},{file4,"F4"},{file5,"F5"},{file6,"F6"}],
    
    lists:foreach(fun({Filename,Content})->
        
        io:format("~p ~n", [dftp:upload(Filename,Content)])
    
    end,TestUpload),


    TestFind = [file1,file2,file3,file4,file5,file6,file7],
    
    lists:foreach(fun(El)->
        
        io:format("~p : ~p ~n", [El,dftp:find(El)])
    
    end,TestFind),

    io:format("All File : ~p~n",[dftp:all()]),
   
     dftp:stop()      
.

    

    