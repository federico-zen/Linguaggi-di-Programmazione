# 📫Esercizi Erlang📧
Esercizi di Erlang assegnati a Lezione o presi da alcuni video

## 📫Fonti Esercizi📧
Esercizi Presi dal Web : <br>
 👉 [Playlist](https://www.youtube.com/playlist?list=PLdOYTlKwc71ljrfUqrKYoULxRjqI0p8it) <br>

## 💡Libreria Libchan💡
👉 [Codice Allegato Libro](https://media.pragprog.com/titles/jaerlang2/code/jaerlang2-code.zip) <br>

Il file ```lib_chan.erl``` si trova nella cartella ```socket_dist``` . 
Spostarsi nella cartella e digitare nel terminale ```make```.
Se non dovesse funzionare si puo inserire il modulo della lib_chan quando si avvia la shell
```
erl -pa path_to_lib_chan.erl 
```

## 💡Tips💡
Per compilare un modulo
```
erlc modulo.erl
```

oppure nella VM
```erlang
c(nome_modulo)
```



Se voglio eseguire il programma senza la shell
```
erl -noshell -s modulo funzione -s init stop

```
