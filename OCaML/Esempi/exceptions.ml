let safe_div x y = 
  try x/y with  (*Una specie di pattermatch usato per le eccezioni*)
    |Division_by_zero -> 0 
;;