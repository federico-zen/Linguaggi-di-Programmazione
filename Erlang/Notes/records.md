I record stanno in un file Header (.hrl)
e si definisce :
```Erlang
-record(Name, {

    campi

}).
```
Es:
```Erlang
-record(Message, {
    Sender, 
    Receiver,
    Text =""
}).
```

Per usarli devo importarli usando

rr("nomefile.hrl").

I record sono delle tuple , se utilizzo rf(). ossia record forget nell VM e provassi a stampare un messaggio , 
verrebbe trattato come un tupla.