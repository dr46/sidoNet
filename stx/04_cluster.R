# 04_cluster.R

library(NbClust)

cesqt <- read.csv("dat/cesqt.csv", sep=";")

cesqt[,-1]

# Determinación del número de clusters 
pdf("fig/clust.pdf", width = 15, height = 10)
nc <- NbClust(scale(cesqt[,-1]), 
              distance = "euclidean", 
              min.nc = 2, 
              max.nc = 10, 
              method = "kmeans")
dev.off()

# Identificación del cluster al que pertenece cada participante
hw <- kmeans(scale(cesqt[,-1]), iter.max = 25, nstart = 25, 
             algorithm =  "Hartigan-Wong", centers = 2)

# Tamaño de los clusters
tc <- table(hw$cluster)
p.tc <- round(prop.table(tc), 4) *100

clusters <- list("Tamño de los cluster" = tc, 
                 "Porcentaje de personas en los clusters" = p.tc)
print(clusters)

co <- data.frame(id = cesqt$id, co = hw$cluster)

write.csv(co, file = "dat/co.csv", row.names = F)

rm(list = ls())