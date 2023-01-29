module TrigonometriaImpl  = struct
  

  let rec fact n = 
      if n <= 1 then 
          1 
      else 
        n * (fact (n-1))
  ;;

  let sen x n = 
    let rec step acc esp = 
      if esp > n then 
        acc
      else
        let num = 
          x ** (float_of_int((2*esp)+1) )
        in 
          let den = 
            float_of_int(fact((2*esp)+1))
        in
          let fraz = ((-1.)** float_of_int (esp)) *. (num) /.(den)
      in
      step (acc +. fraz) (esp +1) 

    in step 0. 0 ;;

    let cosen x n = 
      let rec step acc esp = 
        if esp > n then 
          acc
        else
          let num = 
            x ** (float_of_int((2*esp)) )
          in 
            let den = 
              float_of_int(fact((2*esp)))
          in
            let fraz = ((-1.)** float_of_int (esp)) *. (num) /.(den)
        in
        step (acc +. fraz) (esp +1) 
    
      in step 0. 0 ;;


    
  let logarithm x n = 
    let rec log_step esp acc = 
      if esp  > n then
        acc
      else
        let num =
          ((x-.1.)) ** float_of_int (esp)
        in 
        let sign = 
          (float_of_int (-1)) ** (float_of_int(esp+1))
      in
      log_step (esp+1) (acc +. (sign *. (num /. (float_of_int esp))))
    in log_step 1 0.
  ;;

  let tang x n=
    (sen x n ) /. (cosen x n)
  ;;

end