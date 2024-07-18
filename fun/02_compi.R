# 02_compi.R

# Función para extraer información de tests t y completarla con la desviación típica
compi <- function(test, dts){
  
  vari <- test$data.name
  te <- test$statistic
  te.df <- test$parameter
  alt <- test$alternative
  pv <- test$p.value
  
  m.1 <- test$estimate[[1]]
  m.2 <- test$estimate[[2]]
  dt.1 <- dts[[1]]
  dt.2 <- dts[[2]]
  
  de <- t_to_d(te, te.df, paired = F, alternative = alt)$d
  ere <- t_to_r(te, te.df, paired = F, alternative = alt)$r
  
  fil <- c(m.1, m.2, dt.1, dt.2, te, te.df, pv, abs(de), abs(ere))
  
  mat.p <- matrix(ncol = 9)
  mat.p[1,] <- fil
  rownames(mat.p) <- vari
  return(mat.p)
}