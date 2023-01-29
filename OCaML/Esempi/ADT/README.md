# 🐫ADT su piu File 🐫

<p>
    se stack.ml ha contenuto chiamato DM , e stack.mli ha contenuto DS il compilatore di OCAML si comporta cosi:
</p>

``` ocaml 
 module MyFile [: sig DS end] =
        struct
            DM
        end
    
