# 02_demo.R

demo <- read.csv("dat/demo.csv", sep=";")

# Características de la muestra

# Distribución de frecuencias por sexo.
fa.sex <- table(demo$sex)
names(fa.sex) <- c("Mujer", "Hombre")
fa.sex <- sort(fa.sex, decreasing = T)
fr.sex <- round(prop.table(fa.sex) * 100,2)
fr.sex <- sort(fr.sex, decreasing = T)
sx <- rbind(fa = fa.sex, fr = fr.sex)

# Distribución de frecuencias por estado civil.
fa.ec <- table(demo$ec)
fa.ec <- sort(fa.ec, decreasing = T)
fr.ec <- round(prop.table(fa.ec) * 100,2)
fr.ec <- sort(fr.ec, decreasing = T)
ec <- rbind(fa = fa.ec, fr = fr.ec)

# Distribución de frecuencias por número de hijos.
fa.nh <- table(demo$nh)
# fa.nh <- sort(fa.nh, decreasing = T)
fr.nh <- round(prop.table(fa.nh) * 100,2)
# fr.nh <- sort(fr.nh, decreasing = T)
nh <- rbind(fa = fa.nh, fr = fr.nh)

# Distribución de frecuencias por nivel de estudios.
fa.ne <- table(demo$ne)
fa.ne <- sort(fa.ne, decreasing = T)
fr.ne <- round(prop.table(fa.ne) * 100,2)
fr.ne <- sort(fr.ne, decreasing = T)
ne <- rbind(fa = fa.ne, fr = fr.ne)

# Distribución de frecuencias por rol desempeñado en el centro.
fa.rol <- table(demo$rol)
fa.rol <- sort(fa.rol, decreasing = T)
fr.rol <- round(prop.table(fa.rol) * 100,2)
fr.rol <- sort(fr.rol, decreasing = T)
rol <- rbind(fa = fa.rol, fr = fr.rol)

df.emp.sx <- data.frame(fa=NA, fr=NA)
row.names(df.emp.sx) <- "----SEXO----"

df.emp.ec <- data.frame(fa=NA, fr=NA)
row.names(df.emp.ec) <- "----ESTADO CIVIL----"

df.emp.nh <- data.frame(fa=NA, fr=NA)
row.names(df.emp.nh) <- "----NÚMERO DE HIJOS----"

df.emp.ne <- data.frame(fa=NA, fr=NA)
row.names(df.emp.ne) <- "----NIVEL DE ESTUDIOS----"


df.emp.rol <- data.frame(fa=NA, fr=NA)
row.names(df.emp.rol) <- "----ROL DE CENTRO----"

t.frec <-  rbind(df.emp.sx,
                 data.frame(t(sx)),
                 df.emp.ec,
                 data.frame(t(ec)),
                 df.emp.nh,
                 data.frame(t(nh)),
                 df.emp.ne,
                 data.frame(t(ne)),
                 df.emp.rol,
                 data.frame(t(rol)))

print(t.frec)

write.csv(t.frec, "tab/t.frec.csv")

pe <- quantile(demo$edad)
edad <- c(pe, M = mean(demo$edad), DT = sd(demo$edad))

pin <- quantile(demo$imf, na.rm = T)
imf <- c(pin, M = mean(demo$imf, na.rm = T), DT = sd(demo$imf, na.rm = T))

print("..................")
edin <- data.frame(edad)
edin <- round(cbind(edad, imf), 2)
print(edin)
write.csv(edin, "tab/edin.csv")

pdf("fig/edad.pdf")
hist(demo$edad, 
     main = "Histograma de la edad", 
     ylab = "Frecuencia", 
     xlab = "Edad",
     col = "tomato")
dev.off()

pdf("fig/imf.pdf")
hist(demo$imf,
     main = "Histograma de ingresos familiares mensuales",
     ylab = "Frecuencia", 
     xlab = "Ingresos",
     col = "tomato")
dev.off()

rm(list = ls())
