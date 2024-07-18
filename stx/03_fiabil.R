# 03_fiabil.R

library(MBESS)

d21 <- read.csv("dat/d21.csv", sep=";")
cesqt <- read.csv("dat/cesqt.csv", sep=";")

# Fiabilidad del DASS-21

set.seed(66)
f.o.d21 <- ci.reliability(d21[,-1], type = "omega", interval.type = "perc", B = 1000)

set.seed(66)
f.a.d21 <- ci.reliability(d21[,-1], type = "alpha", interval.type = "perc", B = 1000)

## Dimensión de Estrés
set.seed(26)
f.o.d21.e <- ci.reliability(d21[,c(2,7,9,12,13,15,19)], type = "omega", interval.type = "perc", B = 1000)

set.seed(26)
f.a.d21.e <- ci.reliability(d21[,c(2,7,9,12,13,15,19)], type = "alpha", interval.type = "perc", B = 1000)

## Dimensión de Ansiedad
set.seed(26)
f.o.d21.a <- ci.reliability(d21[,c(3,5,8,10,16,20,21)], type = "omega", interval.type = "perc", B = 1000)

set.seed(26)
f.a.d21.a <- ci.reliability(d21[,c(3,5,8,10,16,20,21)], type = "alpha", interval.type = "perc", B = 1000)

## Dimensión de Depresión
set.seed(26)
f.o.d21.d <- ci.reliability(d21[,c(4,6,11,14,17,18,22)], type = "omega", interval.type = "perc", B = 1000)

set.seed(26)
f.a.d21.d <- ci.reliability(d21[,c(4,6,11,14,17,18,22)], type = "alpha", interval.type = "perc", B = 1000)


# Fiabilidad del CESQT

cesqt$il1 <- 4-cesqt$il1
cesqt$il2 <- 4-cesqt$il2
cesqt$il3 <- 4-cesqt$il3
cesqt$il4 <- 4-cesqt$il4
cesqt$il5 <- 4-cesqt$il5

set.seed(66)
f.o.cesqt <- ci.reliability(cesqt[,-1], type = "omega", interval.type = "perc", B = 1000)

set.seed(66)
f.a.cesqt <- ci.reliability(cesqt[,-1], type = "alpha", interval.type = "perc", B = 1000)

## Dimensión de ilusión por el trabajo

set.seed(66)
f.o.cesqt.il <- ci.reliability(cesqt[,c(2,6,11,16,20)], type = "omega", interval.type = "perc", B = 1000)

set.seed(66)
f.a.cesqt.il <- ci.reliability(cesqt[,c(2,6,11,16,20)], type = "alpha", interval.type = "perc", B = 1000)

## Dimensión de indolencia

set.seed(66)
f.o.cesqt.in <- ci.reliability(cesqt[,c(3,4,7,8,12,15)], type = "omega", interval.type = "perc", B = 1000)

set.seed(66)
f.a.cesqt.in <- ci.reliability(cesqt[,c(3,4,7,8,12,15)], type = "alpha", interval.type = "perc", B = 1000)

## Dimensión de culpa

set.seed(66)
f.o.cesqt.cu <- ci.reliability(cesqt[,c(5,10,14,17,21)], type = "omega", interval.type = "perc", B = 1000)

set.seed(66)
f.a.cesqt.cu <- ci.reliability(cesqt[,c(5,10,14,17,21)], type = "alpha", interval.type = "perc", B = 1000)

## Dimensión de desgaste psíquico

set.seed(66)
f.o.cesqt.de <- ci.reliability(cesqt[,c(9,13,18,19)], type = "omega", interval.type = "perc", B = 1000)

set.seed(66)
f.a.cesqt.de <- ci.reliability(cesqt[,c(9,13,18,19)], type = "alpha", interval.type = "perc", B = 1000)

source("fun/01_fval.R")

mt <- matrix(nrow = 9, ncol = 8)
colnames(mt) <- c("om", "et.om", "li.om", "ls.om", "al", "et.al", "li.al", "ls.al")
rownames(mt) <- c("dass.21", "dass.21.e", "dass.21.a", "dass.21.d", "cesqt",
                  "cesqt.il", "cesqt.in", "cesqt.cu", "cesqt.de")

mt[1,] <- fval(f.o.d21, f.a.d21)
mt[2,] <- fval(f.o.d21.e, f.a.d21.e)
mt[3,] <- fval(f.o.d21.a, f.a.d21.a)
mt[4,] <- fval(f.o.d21.d, f.a.d21.d)

mt[5,] <- fval(f.o.cesqt, f.a.cesqt)
mt[6,] <- fval(f.o.cesqt.il, f.a.cesqt.il)
mt[7,] <- fval(f.o.cesqt.in, f.a.cesqt.in)
mt[8,] <- fval(f.o.cesqt.cu, f.a.cesqt.cu)
mt[9,] <- fval(f.o.cesqt.de, f.a.cesqt.de)


write.table(mt, file = "tab/fiabil.csv", sep = ";", dec = ",", 
            row.names = T, col.names = NA)


rm(list=ls())
.rs.restartR()
