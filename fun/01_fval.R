# 01_fval.R

# Función para extraer los parámetros estimados de los cálculos de fiabilidad
fval <- function(o,a){
  
  om <- o$est
  et.om <- o$se
  li.om <- o$ci.lower
  ls.om <- o$ci.upper
  
  al <- a$est
  et.al <- a$se
  li.al <- a$ci.lower
  ls.al <- a$ci.upper
  
  est <- round(c(om, et.om, li.om, ls.om, al, et.al, li.al, ls.al), 4)
  print(est)
}