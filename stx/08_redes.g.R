# 08_redes.g.R


library(qgraph)
library(igraph)


source("par/par.rtotal.R")

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

c1 <- cbind(an.1, de.1, es.1)
rm(an.1, de.1, es.1)

c2 <- cbind(an.2, de.2, es.2)
rm(an.2, de.2, es.2)


# Red global no dirigida para el conglomerado 1

g.c1 <- qgraph(cor(c1), layout = "spring", 
                 graph = "glasso", 
                 sampleSize = dim(c1)[1],
                 tuning = tun,
                 palette = "colorblind",
                 threshold = umb,
                 theme = "gray",
                 edge.width = ew,
                 cut = corte,
                 colFactor = cf,
                 title = "Red global no dirigida del conglomerado 1",
                 negDashed = F,
                 DoNotPlot =T
)

g.c2 <- qgraph(cor(c2), layout = "spring", 
               graph = "glasso", 
               sampleSize = dim(c2)[1],
               tuning = tun,
               palette = "colorblind",
               threshold = umb,
               theme = "gray",
               edge.width = ew,
               cut = corte,
               colFactor = cf,
               title = "Red global no dirigida para el conglomerado 2",
               negDashed = F,
               DoNotPlot =T
)

pdf("fig/rnd.g.pdf")
plot(g.c1)
plot(g.c2)
dev.off()

# Tablas de estadísticos locales para las redes de cada conglomerado

## Conglomerado 1

m.c1 <- cbind(g.c1$Edgelist[[1]], g.c1$Edgelist[[2]])
ig.c1 <- graph_from_data_frame(m.c1, directed = F)

l.c1 <- matrix(ncol=21, data = centrality(g.c1)$OutDegree)
l.c1 <- rbind (l.c1, degree(ig.c1))
l.c1 <- rbind (l.c1, centrality(g.c1)$Closeness)
l.c1 <- rbind (l.c1, centrality(g.c1)$Betweenness)
l.c1 <- rbind (l.c1, centrality(g.c1)$InExpectedInfluence)
l.c1 <- rbind (l.c1, clustWS(g.c1)[,1])

colnames(l.c1) <- names(centrality(g.c1)$OutDegree)
l.c1 <- round(l.c1, rdon)
l.c1 <- t(l.c1)
colnames(l.c1) <- rn <- c("GP", "G", "C", "I", "IE", "WS")

l.c1 <- as.data.frame(l.c1)
l.c1 <- data.frame(Item = rownames(l.c1), l.c1)

## Conglomerado 2

m.c2 <- cbind(g.c2$Edgelist[[1]], g.c2$Edgelist[[2]])
ig.c2 <- graph_from_data_frame(m.c2, directed = F)

l.c2 <- matrix(ncol=21, data = centrality(g.c2)$OutDegree)
l.c2 <- rbind (l.c2, degree(ig.c2))
l.c2 <- rbind (l.c2, centrality(g.c2)$Closeness)
l.c2 <- rbind (l.c2, centrality(g.c2)$Betweenness)
l.c2 <- rbind (l.c2, centrality(g.c2)$InExpectedInfluence)
l.c2 <- rbind (l.c2, clustWS(g.c2)[,1])

colnames(l.c2) <- names(centrality(g.c2)$OutDegree)
l.c2 <- round(l.c2, rdon)
l.c2 <- t(l.c2)
colnames(l.c2) <- rn <- c("GP", "G", "C", "I", "IE", "WS")

l.c2 <- as.data.frame(l.c2)
l.c2 <- data.frame(Item = rownames(l.c2), l.c2)

# Tabla de estadísticos globales para las redes de cada conglomerado

g.c1 <- data.frame(E = ecount(ig.c1), D = graph.density(ig.c1), T = transitivity(ig.c1))
g.c2 <- data.frame(E = ecount(ig.c2), D = graph.density(ig.c2), T = transitivity(ig.c2))

est.g <- rbind(round(g.c1,rdon), 
               round(g.c2, rdon))

cluster <- c("c1", "c2")

est.g <- cbind(cluster, est.g)

# Guardando tablas

## Tablas de estadísticos locales por nodo y conglomerado

write.csv2(l.c1, file = file("tab/l.c1.csv"), row.names = F)
write.csv2(l.c2, file = file("tab/l.c2.csv"), row.names = F)

# Tabla de estadísticos globales por conglomerado

write.csv2(est.g, file = file("tab/est.g.full.csv"), row.names = F)


library(bnlearn)

# Red dirigida acíclica para el conglomerado 1
set.seed(46)
b.c1 <- boot.strength(c1, R = sim, algorithm = alg)

## Pesos
p.c1 <- b.c1[b.c1$strength > fue & b.c1$direction > die,]

## Red promedio
g.c1 <- averaged.network(b.c1, threshold = umb2)

f.c1 <- qgraph(DoNotPlot = T , g.c1, edge.color = "black", title = "Red dirigida acíclica para el conglomerado 1")


# Red dirigida acíclica para el conglomerado 2
set.seed(46)
b.c2 <- boot.strength(c2, R = sim, algorithm = alg)

## Pesos
p.c2 <- b.c1[b.c2$strength > fue & b.c2$direction > die,]

## Red promedio
g.c2 <- averaged.network(b.c2, threshold = umb2)

f.c2 <- qgraph(DoNotPlot = T, g.c2, edge.color = "black", title = "Red dirigida acíclica para el conglomerado 2")

## Estadísticos básicos de redes dirigidas acíclicas

sink("tab/esta.rda.g.txt")
sink()

cx2 <- file("tab/esta.rda.g.txt", open = "wt", encoding = "UTF-8")

sink(cx2)
print("------ MODELO: Conglomerado 1 ------")
print(g.c1)
print("------ MODELO: Conglomerado 2 ------")
print(g.c2)
sink()

close(cx2)

print(cat(readLines("tab/esta.rda.g.txt", encoding = "UTF-8"), sep = "\n"))

pdf("fig/rda.g.pdf")
plot(f.c1)
plot(f.c2)
dev.off()


rm(list = ls())
.rs.restartR()
