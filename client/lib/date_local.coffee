@dateLocal =
  month: (n) ->
    switch
      when n is 0 then "enero"
      when n is 1 then "febrero"
      when n is 2 then "marzo"
      when n is 3 then "abril"
      when n is 4 then "mayo"
      when n is 5 then "junio"
      when n is 6 then "julio"
      when n is 7 then "agosto"
      when n is 8 then "septiembre"
      when n is 9 then "octubre"
      when n is 10 then "noviembre"
      when n is 11 then "diciembre"
  
  spanishDate: (d) ->
    "#{d.getDate()} de #{@month(d.getMonth())} de #{d.getFullYear()}"
