# 09_narrativ.R

# Número de docentes por conglomerado

sido <- read.csv("dat/sido.csv")

table(sido$co) # Docentes por conglomerado


dl1 <- read.csv("tab/dl.1.csv", sep = ";", dec = ",") # Estadísticos locales Depresión-Conglomerado 1
dl2 <- read.csv("tab/dl.2.csv", sep = ";", dec = ",") # Estadísticos locales Depresión-Conglomerado 2

nomb <- dl1[,1]
dl1 <- t(dl1[,2:8])
colnames(dl1) <- nomb

dl2 <- t(dl2[,2:8])
colnames(dl2) <- nomb

# Red de síntomas de depresión 
## Medias de estadísticos locales
### Conglomerado 1
colMeans(dl1)
### Conglomerado 2
colMeans(dl2)

## Desviaciones típicas estadísticos locales
### Conglomerado 1
apply(dl1, 2, sd)
### Conglomerado 2
apply(dl2, 2, sd)


al1 <- read.csv("tab/al.1.csv", sep = ";", dec = ",") # Estadísticos locales Ansiedad-Conglomerado 1
al2 <- read.csv("tab/al.2.csv", sep = ";", dec = ",") # Estadísticos locales Ansiedad-Conglomerado 2

al1 <- t(al1[,2:8])
colnames(al1) <- nomb

al2 <- t(al2[,2:8])
colnames(al2) <- nomb


# Red de síntomas de ansiedad 
## Medias de estadísticos locales
### Conglomerado 1
colMeans(al1, na.rm =T)
### Conglomerado 2
colMeans(al2)

## Desviaciones típicas estadísticos locales
### Conglomerado 1
apply(al1, 2, sd, na.rm =T)
### Conglomerado 2
apply(al2, 2, sd)


el1 <- read.csv("tab/el.1.csv", sep = ";", dec = ",") # Estadísticos locales Estrés-Conglomerado 1
el2 <- read.csv("tab/el.2.csv", sep = ";", dec = ",") # Estadísticos locales Estrés-Conglomerado 2

el1 <- t(el1[,2:8])
colnames(el1) <- nomb

el2 <- t(el2[,2:8])
colnames(el2) <- nomb

# Red de síntomas de estrés
## Medias de estadísticos locales
### Conglomerado 1
colMeans(el1)
### Conglomerado 2
colMeans(el2)

## Desviaciones típicas estadísticos locales
### Conglomerado 1
apply(el1, 2, sd)
### Conglomerado 2
apply(el2, 2, sd)







dl <- rbind(dl1, dl2)
dl <- as.data.frame(dl)

dl$cl <- c(rep(1, 7), rep(2, 7))
