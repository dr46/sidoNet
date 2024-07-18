# 04_rn.R

# Extracción de información desde test de ji-cuadrado y estadístico V de Crammer

rn <- function(x, y){
  ji.test <- chisq.test(table(x, y))
  ji <- ji.test$statistic
  pvalor <- ji.test$p.value
  v.test <- cramerV(table(x, y))
  
  out <- c(ji, pvalor, v.test[[1]])
  print(out)
}