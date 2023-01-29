Si può redirigere l'output di un processo sul "terminale remoto" utilizzando i group_leader.
---
```erlang
    global:register_name(Label,self()).

```

Utilizzando questa istruzione registro l'attore a livello "globale".

Posso far partire la BEAM di erlang usando nomi differenti
```
erl -sname nome

```

facendo ciò potrò riferirmi al nodo nome@nome_macchina
---

Posso registrare il group leader con 
```erlang
    group_leader(whereis(user),self()). 

```
