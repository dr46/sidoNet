# 06_rnd.R

library(qgraph)
library(igraph)

co <- read.csv("dat/co.csv")
d21 <- read.csv("dat/d21.csv", sep=";")

rnd <- merge(co, d21, by ="id")
rm(co, d21)

source("par/par.rnd.R")

# Estrés
es.1 <- rnd[which(rnd$co == 1), c(3, 8, 10, 13, 14, 16, 20)]
es.2 <- rnd[which(rnd$co == 2), c(3, 8, 10, 13, 14, 16, 20)]


# Ansiedad
an.1 <- rnd[which(rnd$co == 1), c(4, 6, 9, 11, 17, 21, 22)]
an.2 <- rnd[which(rnd$co == 2), c(4, 6, 9, 11, 17, 21, 22)]

# Depresión
de.1 <- rnd[which(rnd$co == 1) ,c(5, 7, 12, 15, 18, 19, 23)]
de.2 <- rnd[which(rnd$co == 2) ,c(5, 7, 12, 15, 18, 19, 23)]

# Salvando base de datos intermedias
write.csv(an.1, "dat/an.1.csv", row.names = F)
write.csv(an.2, "dat/an.2.csv", row.names = F)
write.csv(de.1, "dat/de.1.csv", row.names = F)
write.csv(de.2, "dat/de.2.csv", row.names = F)
write.csv(es.1, "dat/es.1.csv", row.names = F)
write.csv(es.2, "dat/es.2.csv", row.names = F)


# Red de ansiedad para el conglomerado 1

g.an.1 <- qgraph(cor(an.1), layout = "spring", 
                 graph = "glasso", 
                 sampleSize = dim(an.1)[1],
                 tuning = tun,
                 palette = "colorblind",
                 threshold = umb,
                 theme = "gray",
                 edge.width = ew,
                 cut = corte,
                 colFactor = cf,
                 title = "Ansiedad, conglomerado 1",
                 DoNotPlot =T
                 )

# Red de ansiedad para conglomerado 2

g.an.2 <- qgraph(cor(an.2), layout = "spring", 
                 graph = "glasso", 
                 sampleSize = dim(an.2)[1],
                 tuning = tun,
                 palette = "colorblind",
                 threshold = umb,
                 theme = "gray",
                 edge.width = ew,
                 cut = corte,
                 colFactor = cf,
                 title = "Ansiedad, conglomerado 2",
                 DoNotPlot =T
)


# Red de estrés para conglomerado 1

g.es.1 <- qgraph(cor(es.1), layout = "spring", 
                 graph = "glasso", 
                 sampleSize = dim(es.1)[1],
                 tuning = tun,
                 palette = "colorblind",
                 threshold = umb,
                 theme = "gray",
                 edge.width = ew,
                 cut = corte,
                 colFactor = cf,
                 title = "Estrés, conglomerado 1",
                 DoNotPlot =T
)


# Red de estrés para conglomerado 2

g.es.2 <- qgraph(cor(es.2), layout = "spring", 
                 graph = "glasso", 
                 sampleSize = dim(es.2)[1],
                 tuning = tun,
                 palette = "colorblind",
                 threshold = umb,
                 theme = "gray",
                 edge.width = ew,
                 cut = corte,
                 colFactor = cf,
                 title = "Estrés, conglomerado 2",
                 DoNotPlot =T
)


# Red de depresión para conglomerado 1

g.de.1 <- qgraph(cor(de.1), layout = "spring", 
                 graph = "glasso", 
                 sampleSize = dim(de.1)[1],
                 tuning = tun,
                 palette = "colorblind",
                 threshold = umb,
                 theme = "gray",
                 edge.width = ew,
                 cut = corte,
                 colFactor = cf,
                 title = "Depresión, conglomerado 1",
                 DoNotPlot =T
)


# Red de depresión para conglomerado 2

g.de.2 <- qgraph(cor(de.2), layout = "spring", 
                 graph = "glasso", 
                 sampleSize = dim(de.2)[1],
                 tuning = tun,
                 palette = "colorblind",
                 threshold = umb,
                 theme = "gray",
                 edge.width = ew,
                 cut = corte,
                 colFactor = cf,
                 title = "Depresión, conglomerado 2",
                 DoNotPlot =T
)


###### Ansiedad - conglomerado 1
m.an.1 <- cbind(g.an.1$Edgelist[[1]], g.an.1$Edgelist[[2]])
ig.an.1 <- graph_from_data_frame(m.an.1, directed = F)

al.1 <- matrix(ncol=7, data = centrality(g.an.1)$OutDegree)
al.1 <- rbind (al.1, degree(ig.an.1))
al.1 <- rbind (al.1, centrality(g.an.1)$Closeness)
al.1 <- rbind (al.1, centrality(g.an.1)$Betweenness)
al.1 <- rbind (al.1, centrality(g.an.1)$InExpectedInfluence)
al.1 <- rbind (al.1, clustWS(ig.an.1)[,1])

###### Ansiedad - conglomerado 2
m.an.2 <- cbind(g.an.2$Edgelist[[1]], g.an.2$Edgelist[[2]])
ig.an.2 <- graph_from_data_frame(m.an.2, directed = F)

al.2 <- matrix(ncol=7, data = centrality(g.an.2)$OutDegree)
al.2 <- rbind (al.2, degree(ig.an.2))
al.2 <- rbind (al.2, centrality(g.an.2)$Closeness)
al.2 <- rbind (al.2, centrality(g.an.2)$Betweenness)
al.2 <- rbind (al.2, centrality(g.an.2)$InExpectedInfluence)
al.2 <- rbind (al.2, clustWS(ig.an.2)[,1])

###### Estrés - conglomerado 1
m.es.1 <- cbind(g.es.1$Edgelist[[1]], g.es.1$Edgelist[[2]])
ig.es.1 <- graph_from_data_frame(m.es.1, directed = F)

el.1 <- matrix(ncol=7, data = centrality(g.es.1)$OutDegree)
el.1 <- rbind (el.1, degree(ig.es.1))
el.1 <- rbind (el.1, centrality(g.es.1)$Closeness)
el.1 <- rbind (el.1, centrality(g.es.1)$Betweenness)
el.1 <- rbind (el.1, centrality(g.es.1)$InExpectedInfluence)
el.1 <- rbind (el.1, clustWS(ig.es.1)[,1])

#### Estrés - conglomerado 2
m.es.2 <- cbind(g.es.2$Edgelist[[1]], g.es.2$Edgelist[[2]])
ig.es.2 <- graph_from_data_frame(m.es.2, directed = F)

el.2 <- matrix(ncol=7, data = centrality(g.es.2)$OutDegree)
el.2 <- rbind (el.2, degree(ig.es.2))
el.2 <- rbind (el.2, centrality(g.es.2)$Closeness)
el.2 <- rbind (el.2, centrality(g.es.2)$Betweenness)
el.2 <- rbind (el.2, centrality(g.es.2)$InExpectedInfluence)
el.2 <- rbind (el.2, clustWS(ig.es.2)[,1])

#### Depresión - conglomerado 1
m.de.1 <- cbind(g.de.1$Edgelist[[1]], g.de.1$Edgelist[[2]])
ig.de.1 <- graph_from_data_frame(m.de.1, directed = F)

dl.1 <- matrix(ncol=7, data = centrality(g.de.1)$OutDegree)
dl.1 <- rbind (dl.1, degree(ig.de.1))
dl.1 <- rbind (dl.1, centrality(g.de.1)$Closeness)
dl.1 <- rbind (dl.1, centrality(g.de.1)$Betweenness)
dl.1 <- rbind (dl.1, centrality(g.de.1)$InExpectedInfluence)
dl.1 <- rbind (dl.1, clustWS(ig.de.1)[,1])

# Depresión - conglomerado 2
m.de.2 <- cbind(g.de.2$Edgelist[[1]], g.de.2$Edgelist[[2]])
ig.de.2 <- graph_from_data_frame(m.de.2, directed = F)

dl.2 <- matrix(ncol=7, data = centrality(g.de.2)$OutDegree)
dl.2 <- rbind (dl.2, degree(ig.de.2))
dl.2 <- rbind (dl.2, centrality(g.de.2)$Closeness)
dl.2 <- rbind (dl.2, centrality(g.de.2)$Betweenness)
dl.2 <- rbind (dl.2, centrality(g.de.2)$InExpectedInfluence)
dl.2 <- rbind (dl.2, clustWS(ig.de.2)[,1])

# Guardando tablas

## Tablas de estadísticos locales por nodo

rn <- c("GP", "G", "C", "I", "IE", "WS")

rownames(al.1) <- rn
rownames(al.2) <- rn
rownames(el.1) <- rn
rownames(el.2) <- rn
rownames(dl.1) <- rn
rownames(dl.2) <- rn

write.csv2(round(al.1, rdon), file = file("tab/al.1.csv"))
write.csv2(round(al.2, rdon), file = file("tab/al.2.csv"))
write.csv2(round(el.1, rdon), file = file("tab/el.1.csv"))
write.csv2(round(el.2, rdon), file = file("tab/el.2.csv"))
write.csv2(round(dl.1, rdon), file = file("tab/dl.1.csv"))
write.csv2(round(dl.2, rdon), file = file("tab/dl.2.csv"))

## Tablas de estadísticos globales por red

ag.1 <- data.frame(E = ecount(ig.an.1), D = graph.density(ig.an.1), T = transitivity(ig.an.1))
ag.2 <- data.frame(E = ecount(ig.an.2), D = graph.density(ig.an.2), T = transitivity(ig.an.2))
eg.1 <- data.frame(E = ecount(ig.es.1), D = graph.density(ig.es.1), T = transitivity(ig.es.1))
eg.2 <- data.frame(E = ecount(ig.es.2), D = graph.density(ig.es.2), T = transitivity(ig.es.2))
dg.1 <- data.frame(E = ecount(ig.de.1), D = graph.density(ig.de.1), T = transitivity(ig.de.1))
dg.2 <- data.frame(E = ecount(ig.de.2), D = graph.density(ig.de.2), T = transitivity(ig.de.2))

est.g <- rbind(round(ag.1,rdon), 
               round(ag.2, rdon), 
               round(eg.1,rdon), 
               round(eg.2,rdon), 
               round(dg.1, rdon), 
               round(dg.2, rdon))

Congl <- rep(1:2, 3)
Dim.Dass <- c("Ansiedad", "Ansiedad", "Estrés", "Estrés", "Depresión", "Depresión")

est.g <- cbind(Dim.Dass, Congl, est.g)

write.csv2(est.g, file = file("tab/est.g.csv"))

# Figuras de los grafos

pdf("fig/rnd.pdf")
plot(g.an.1)
plot(g.an.2)
plot(g.es.1)
plot(g.es.2)
plot(g.de.1)
plot(g.de.2)
dev.off()

rm(list = ls())
.rs.restartR()