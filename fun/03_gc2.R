# 03_gc2.R

# Función para generar gráficos de puntos para cada cluster.

gc2 <- function(x, z, y = 46){
  set.seed(y)
  colores <- sido$co
  plot(jitter(sido$co), jitter(x),
       axes =F, col = colores,
       ylab = z, xlab = "Cluster")
  axis(1, labels = 1:2, at = 1:2)
  axis(2, las =1)
}
