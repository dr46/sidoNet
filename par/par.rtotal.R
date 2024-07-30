# par.rtotal.R


tun <- 0.5        # Tuning parameter
ew <- 1           # Grosor de los enlaces
corte <- .01      # cut
cf <- 0.0005      # colFactor
umb <- F          # threshold para sensibilidad
rdon <- 4         # redondeo de decimales en tablas



# Parámetros para dirigida acíclica con todos los ítems

sim <- 1000 # Número de simulaciones para el remuestreo
alg <- "pc.stable" # Algoritmo utilizado
fue <- 0.65 # Fuerza de asociación entre las variables
umb2 <- fue  # Umbral
die <- 0.5  # Dirección del enlace

