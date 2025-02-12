# 01_muestra.R -- Cálculo del tamaño muestral necesario para el estudio


# PRIMER CRITERIO DE REFERENCIA
# Considerando un muestreo estratificado con afijación proporcional al cuerpo docente
# y teniendo en cuenta el tamaño muestral por estratos.

cuer <- read.csv2("dat/cuerpo.csv")

t.cuer <- data.frame(t(table(cuer)))
data.frame(t(t.cuer))

t.cuer <- t.cuer[,-1]

# Población teniendo en cuenta los criterios de exclusión (ver archivo "tab/exclusion.xlsx")
ex.cuer <- t.cuer[-c(1,3:4,7:11,16:18),]

# Tamaño poblacional
N <- sum(ex.cuer[,2]) # Tamaño de la población objetivo.
n.max <- 100 # Tamaño deseable considerando la estimación máxima de la muestra en función de los clusters latentes.
nc <- nrow(ex.cuer) # Número de estratos en la población.

as <- n.max/nc # Afijación simple: número de personas a muestrear por cada estrato.

pp <- ex.cuer$Freq/N # Proporción.

me <- round(pp * n.max,0) # Tamaño muestral estimado para el estrato.

muestra.estratificada <- cbind(ex.cuer, as, pp, me)

write.csv(muestra.estratificada, "tab/muestra.estratificada.csv")


# SEGUNDO (COMPLEMENTARIO) CRITERIO DE REFERENCIA
# Considerando el tamaño de personas incluidas en los conglomerados latentes en la población

c2 <- power.anova.test(groups = 2, power = .8, sig.level = 0.05, between.var = 1, within.var = 6)
c3 <- power.anova.test(groups = 3, power = .8, sig.level = 0.05, between.var = 1, within.var = 6)
c4 <- power.anova.test(groups = 4, power = .8, sig.level = 0.05, between.var = 1, within.var = 6)
c5 <- power.anova.test(groups = 5, power = .8, sig.level = 0.05, between.var = 1, within.var = 6)

nn <- c(c2$n, c3$n, c4$n, c5$n)
muestra.conglomerados <- data.frame(conglomerados.latentes = 2:5, 
           tamanyo.conglomerado = nn, 
           muestra.total.estimada = nn*2:5)

write.csv(muestra.conglomerados, "tab/muestra.conglomerados.csv")




rm(list =ls())

