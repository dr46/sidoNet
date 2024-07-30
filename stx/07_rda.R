# 07_rda.R

library(bnlearn)
library(qgraph)

an.1 <- read.csv("dat/an.1.csv")
an.2 <- read.csv("dat/an.2.csv")
de.1 <- read.csv("dat/de.1.csv")
de.2 <- read.csv("dat/de.2.csv")
es.1 <- read.csv("dat/es.1.csv")
es.2 <- read.csv("dat/es.2.csv")

an.1[,1:7] <- sapply(an.1[, 1:7], as.numeric)
an.2[,1:7] <- sapply(an.2[, 1:7], as.numeric)
de.1[,1:7] <- sapply(de.1[, 1:7], as.numeric)
de.2[,1:7] <- sapply(de.2[, 1:7], as.numeric)
es.1[,1:7] <- sapply(es.1[, 1:7], as.numeric)
es.2[,1:7] <- sapply(es.2[, 1:7], as.numeric)

# Generando archivos de texto para almacenar los pesos de las redes y estadísticos básicos
sink("tab/pesos.rda.txt")
sink()
sink("tab/esta.rda.txt")
sink()


# Generando conexiones con archivos de texto para pesos y estadísticos
conex <- file("tab/pesos.rda.txt", open = "wt", encoding = "UTF-8") 
cx2 <- file("tab/esta.rda.txt", open = "wt", encoding = "UTF-8")

source("par/par_rda.R")

# Ansiedad - conglomerado 1
## Remuestreo
set.seed(46)
b.an.1 <- boot.strength(an.1, R = sim, algorithm = alg)

## Pesos
p.an.1 <- b.an.1[b.an.1$strength > fue & b.an.1$direction > die,]
sink(conex) 
print("------ PESOS: Ansiedad - conglomerado 1 ------")
print(p.an.1)
sink()

## Red promedio
g.an.1 <- averaged.network(b.an.1, threshold = umb)
sink(cx2)
print("------ MODELO: Ansiedad - conglomerado 1 ------")
print(g.an.1)
sink()

f.g.an.1 <- qgraph(DoNotPlot = T, edge.color = "black", g.an.1, title = "Ansiedad - conglomerado 1")

# Ansiedad - conglomerado 2
## Remuestreo
set.seed(46)
b.an.2 <- boot.strength(an.2, R = sim, algorithm = alg)

## Pesos
p.an.2 <- b.an.2[b.an.2$strength > fue & b.an.2$direction > die,]
sink(conex, append = T) # sink("tab/pesos.rda.txt", append = T)
print("------ PESOS: ansiedad - conglomerado 2 ------")
print(p.an.2)
sink()

## Red promedio
g.an.2 <- averaged.network(b.an.2, threshold = umb)
sink(cx2, append = T)
print("------ MODELO: ansiedad - conglomerado 2 ------")
print(g.an.2)
sink()

f.g.an.2 <- qgraph(DoNotPlot = T, g.an.2, edge.color = "black", title = "Ansiedad - conglomerado 2")

# Depresión - conglomerado 1
## Remuestreo
set.seed(46)
b.de.1 <- boot.strength(de.1, R = sim, algorithm = alg)

## Pesos
p.de.1 <- b.de.1[b.de.1$strength > fue & b.de.1$direction > die,]
sink(conex, append = T)
print("------ PESOS: depresión - conglomerado 1 ------")
print(p.de.1)
sink()

## Red promedio
g.de.1 <- averaged.network(b.de.1, threshold = umb)
sink(cx2, append = T)
print("------ MODELO: depresión - conglomerado 1 ------")
print(g.de.1)
sink()

f.g.de.1 <- qgraph(DoNotPlot = T, g.de.1, edge.color = "black", title = "Depresión - conglomerado 1")

# Depresión - conglomerado 2
## Remuestreo
set.seed(46)
b.de.2 <- boot.strength(de.2, R = sim, algorithm = alg)

## Pesos
p.de.2 <- b.de.2[b.de.2$strength > fue & b.de.2$direction > die,]
sink(conex, append = T) 
print("------ PESOS: depresión - conglomerado 2 ------")
print(p.de.2)
sink()

## Red promedio
g.de.2 <- averaged.network(b.de.2, threshold = umb)
sink(cx2, append = T)
print("------ MODELO: depresión - conglomerado 2 ------")
print(g.de.2)
sink()

f.g.de.2 <- qgraph(DoNotPlot = T, g.de.2, edge.color = "black", title = "Depresión - conglomerado 2")

# Estrés - conglomerado 1
## Remuestreo
set.seed(46)
b.es.1 <- boot.strength(es.1, R = sim, algorithm = alg)

## Pesos
p.es.1 <- b.es.1[b.es.1$strength > fue & b.es.1$direction > die,]
sink(conex, append = T) 
print("------ PESOS: estrés - conglomerado 1 ------")
print(p.es.1)
sink()

## Red promedio
g.es.1 <- averaged.network(b.es.1, threshold = umb)
sink(cx2, append = T)
print("------ MODELO: estrés - conglomerado 1 ------")
print(g.es.1)
sink()

f.g.es.1 <- qgraph(DoNotPlot = T, g.es.1, edge.color = "black", title = "Estrés - conglomerado 1")

# Estrés - conglomerado 2
## Remuestreo
set.seed(46)
b.es.2 <- boot.strength(es.2, R = sim, algorithm = alg)

## Pesos
p.es.2 <- b.es.2[b.es.2$strength > fue & b.es.2$direction > die,]
sink(conex, append = T)
print("------ PESOS: estrés - conglomerado 2 ------")
print(p.es.2)
sink()

## Red promedio
g.es.2 <- averaged.network(b.es.2, threshold = umb)
sink(cx2, append = T)
print("------ MODELO: estrés - conglomerado 2 ------")
print(g.es.2)
sink()

f.g.es.2 <- qgraph(DoNotPlot = T, g.es.2, edge.color = "black", title = "Estrés - conglomerado 2")

# Cerrando la conexión con el archivo de texto
close(conex)
close(cx2)

print(cat(readLines("tab/pesos.rda.txt", encoding = "UTF-8"), sep = "\n"))
print(cat(readLines("tab/esta.rda.txt", encoding = "UTF-8"), sep = "\n"))

pdf("fig/rda.pdf")
plot(f.g.an.1)
plot(f.g.an.2)
plot(f.g.de.1)
plot(f.g.de.2)
plot(f.g.es.1)
plot(f.g.es.2)
dev.off()

rm(list = ls())
.rs.restartR()
