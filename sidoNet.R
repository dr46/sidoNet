# Documento maestro del proyecto sidoNet 
# Este documento sirve para desencadenar la ejecución de todos los archivos de
# código relacionados con este proyecto.

# Estimación de tamaño muestral por potencia estadística y estratos
source("stx/01_muestra.R")

# Descripción sociodemográfica de la muestra
source("stx/02_demo.R", encoding = "UTF-8")

# Estimación de la fiabilidad de las escalas
# ¡¡¡ATENCIÓN!!!  --- Ejecutar el archivo de código "03_fiabil.R" puede consumir
# una gran cantidad de recursos y de tiempo. El tiempo empleado para ejecutar 
# las computaciones dependerá de lo recursos del ordenador en que se ejecute 
# el comando. Es por ello por lo que la línea correspondiente aparece comentada
# por defecto. En su lugar, se ha optado por recuperar los resultados que produce
# dicho archivo y que están almacenados en la carpeta "tab" (archivo "fiabiil.csv").
### source("stx/03_fiabil.R")
read.csv2("tab/fiabil.csv")

# Análisis cluster
source("stx/04_cluster.R", encoding = "UTF-8")

# Análisis de los conglomerados
suppressWarnings(source("stx/05_escon.R", encoding = "UTF-8"))
read.csv("tab/comp.csv", sep = ";", dec = ",")
read.csv("tab/tj.csv", sep = ";", dec = ",")

# Redes no dirigidas
suppressWarnings(source("stx/06_rnd.R", encoding = "UTF-8"))
read.csv("tab/al.1.csv", sep = ";", dec = ",") # Estadísticos locales Ansiedad-Conglomerado 1
read.csv("tab/al.2.csv", sep = ";", dec = ",") # Estadísticos locales Ansiedad-Conglomerado 2
read.csv("tab/el.1.csv", sep = ";", dec = ",") # Estadísticos locales Estrés-Conglomerado 1
read.csv("tab/el.2.csv", sep = ";", dec = ",") # Estadísticos locales Estrés-Conglomerado 2
read.csv("tab/dl.1.csv", sep = ";", dec = ",") # Estadísticos locales Depresión-Conglomerado 1
read.csv("tab/dl.2.csv", sep = ";", dec = ",") # Estadísticos locales Depresión-Conglomerado 2
read.csv("tab/est.g.csv", sep = ";", dec = ",") # Estadísticos globales por redes
