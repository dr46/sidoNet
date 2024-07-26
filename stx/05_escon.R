# 05_escon.R

library(effectsize)
library(rcompanion)

cesqt <- read.csv("dat/cesqt.csv", sep=";")
d21 <- read.csv("dat/d21.csv", sep=";")
demo <- read.csv("dat/demo.csv", sep=";")
co <- read.csv("dat/co.csv")


cesqt <- transform(cesqt, 
                   ilu = il1 + il2 + il3 + il4 * il5,
                   ind =  in1 + in2 + in3 + in4 + in5 + in6,
                   cul = cu1 + cu2 + cu3 + cu4 + cu5,
                   des = de1 + de2 + de3 + de4,
                   do  = (4 - il1) + (4 - il2) + (4 - il3) + (4 - il4) + (4- il5) + 
                     in1 + in2 + in3 + in4 + in5 + in6 + cu1 + cu2 + cu3 + cu4 + 
                     cu5 + de1 + de2 + de3 + de4)
cesqt.r <- cesqt[,c(1,22:26)]

d21 <- transform(d21,
                 est = e1 + e2 + e3 + e4 + e5 + e6 + e7,
                 ans =  a1 + a2 + a3 + a4 + a5 + a6 + a7,
                 dep = d1 + d2 + d3 + d4 + d5 + d6 + d7,
                 dass = e1 + e2 + e3 + e4 + e5 + e6 + e7 +
                   a1 + a2 + a3 + a4 + a5 + a6 + a7 +
                   d1 + d2 + d3 + d4 + d5 + d6 + d7)
d21.r <- d21[,c(1, 23:26)]

sido <- merge(demo, co, by ="id")
sido <- merge(sido, cesqt.r, by = "id")
sido <- merge(sido, d21.r, by = "id")

write.csv(sido, "dat/sido.csv")


# Pruebas t de Student para variables cuantitativas.

mat <- matrix(ncol = 9, nrow = 0)
cn <- c("m.1", "m.2", "dt.1", "dt.2", "t", 
        "df", "p", "d", "r")
colnames(mat) <- cn

source("fun/02_compi.R")

test <- t.test(sido$do ~ sido$co)
dts <- tapply(sido$do, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$ilu ~ sido$co)
dts <- tapply(sido$ilu, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$ind ~ sido$co)
dts <- tapply(sido$ind, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$cul ~ sido$co)
dts <- tapply(sido$cul, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$des ~ sido$co)
dts <- tapply(sido$des, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$dass ~ sido$co)
dts <- tapply(sido$dass, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$est ~ sido$co)
dts <- tapply(sido$est, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$ans ~ sido$co)
dts <- tapply(sido$ans, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$dep ~ sido$co)
dts <- tapply(sido$dep, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$edad ~ sido$co)
dts <- tapply(sido$edad, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$nh ~ sido$co)
dts <- tapply(sido$nh, sido$co, sd)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)

test <- t.test(sido$imf ~ sido$co)
dts <- tapply(sido$imf, sido$co, sd, na.rm=T)
mat.p <- compi(test, dts)
mat <- rbind(mat, mat.p)


rownames(mat) <- c("CESQT-PA",
                   "Ilu. Traba.",
                   "Indolencia",
                   "Culpa",
                   "Desgas. Psi.",
                   "DASS-21",
                   "Estr:",
                   "Ansiedad",
                   "Depre.",
                   "Edad",
                   "Hijos",
                   "Ingresos")


df <- as.data.frame(mat)

df[,c(1:6, 8,9)] <- sapply(df[,c(1:6,8,9)], round, 2)
df[,7] <- sapply(df[,7], round, 5)

write.table(df, file = file("tab/comp.csv", encoding ="UTF-8"), 
            sep = ";", dec = "," , row.names = T, col.names = NA)

# Gráficos de puntos.

source("fun/03_gc2.R", encoding = "UTF-8")

pdf("fig/puntos.pdf")

gc2(sido$do, "CESQT-PA")
gc2(sido$ilu, "Ilusión por el trabajo")
gc2(sido$ind, "Indolencia")
gc2(sido$cul, "Culpa")
gc2(sido$des, "Desgaste Psíquico")
gc2(sido$dass, "DASS-21")
gc2(sido$est, "Estrés")
gc2(sido$ans, "Ansiedad")
gc2(sido$dep, "Depresión")

dev.off()


# Estudio de la relación entre clusters y variables nominales.

source("fun/04_rn.R")

tj <- matrix(ncol = 3, nrow = 0)
cn <- c("ji.2", "p", "V")
colnames(tj) <- cn

tj <- rbind(tj, rn(sido$co, sido$sex))
tj <- rbind(tj, rn(sido$co, sido$ec))
tj <- rbind(tj, rn(sido$co, sido$ne))
tj <- rbind(tj, rn(sido$co, sido$mp))
tj <- rbind(tj, rn(sido$co, sido$rol))
tj <- rbind(tj, rn(sido$co, sido$cue))


rownames(tj) <- c("Sexo",
                   "Estado civil",
                   "Nivel de estudios",
                   "Master profesorado",
                   "Rol en centro",
                   "Cuerpo docente")

tj <- round(tj, 2)

write.table(tj, file = file("tab/tj.csv", encoding ="UTF-8"), 
            sep = ";", dec = "," , row.names = T, col.names = NA)

rm(list = ls())
.rs.restartR()