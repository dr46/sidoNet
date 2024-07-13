---
title: 'sidoNet: Sindrome de Desgaste Ocupacional Docente modelado con grafos'
output:
  html_document: default
  word_document: default
  pdf_document: default
---

[Ana María Ruiz-Ruano García](https://orcid.org/0000-0002-7260-0588), [Javier Rodríguez Fragoso](https://www.psicofrago.com/), [Francisco José Moya-Faz](https://orcid.org/0000-0002-5832-4900), [Enrique Javier Garcés de los Fayos Ruiz](https://orcid.org/0000-0002-9850-1385), y [Jorge López Puga](https://orcid.org/0000-0003-0693-0092)

# Introducción

Este proyecto contiene los archivos de datos, el código y las figuras generadas para el artículo titulado xxxxxxxxxxxx xxxxxxxx xxxxx y que ha sido remitido a la revista XXXXXX XXXXX para su revisión por pares. Contiene la misma información que la que está contenida en el archivo [README.pdf](README.pdf).

Este proyecto se encuentra alojado en la *Open Science Framework* (OSF) en la web https://osf.io/4cbsz/ y en GitHub en la web https://github.com/dr46/sidoNet. **Advertencia:** nótese que los hipervínculos que contiene este documento y el archivo [README.pdf](README.pdf) están referidos a la versión del proyecto disponible en GitHub. Por tanto, para navegar por el conjunto de archivos contenidos en este proyecto se recomienda utilizar la versión web del proyecto disponible en GitHub. *Se hace notar* también que las tildes españolas pueden no verse correctamente en la web de la OSF. Sin embargo, las tildes son legibles perfectamente en las páginas de GitHub.

# Carpetas o directorios del proyecto

Este proyecto contiene un conjunto de carpetas en las que se organizan los archivos. Más concretamente, las carpetas del proyecto y la descripción de la información que contienen es esta:

-   dat: esta carpeta contiene archivos de datos.
-   stx: esta carpeta contiene archivos de código.
-   fig: esta carpeta contiene las figuras generadas por el proyecto.
-   tab: esta carpeta contiene tablas de resultados.

# Archivos

## Archivos de datos

- [cuerpo.csv](dat/cuerpo.csv): esta tabla contiene una única columna en la que se indica a qué cuerpo laboral pertenecía la población (*N* = 20766) de estudio en el momento en que se estimó el tamaño muestral necesario para llevar a cabo la investigación.

## Archivos de código

-   [sidoNet.R](sidoNet.R): es el archivo de código maestro del proyecto. Desde este archivo se van ejecutando el resto de los archivos de código del proyecto.

- [01_muestra.R](stx/01_muestra.R): este archivo realiza estimaciones del tamaño nuestral teniendo en cuenta los posibles conglomerados de docentes latentes y teniendo en cuenta el tamaño de los estratos poblacionales estudiados. Genera las tablas [muestra.conglomerados.csv](tab/muestra.conglomerados.csv) y [muestra.estratificada.csv](tab/muestra.estratificada.csv).


## Tablas

- [exclusion.xlsx](tab/exclusion.xlsx): esta tabla contiene cinco columnas destinadas a clarificar el proceso de toma de decisiones para incluir (o no) los perfiles docentes correspondientes en el estudio. El significado de las columnas de la tabla es el siguiente:

  - ex: indica si el perfil docente se excluye del estudio.	
  - mex: indica el motivo de exclusión del perfil docente.
  - tpe: indica el tamaño poblacional del estrato (véase el archivo [cuerpo.csv](dat/cuerpo.csv) y su descripción correspondiente). 
  - cue: cuerpo docente.	
  - meap: muestra estimada para el estrato considerando un muestreo estratificado con afijación proporcional al cuerpo docente (León y Montero, 2003).

- [muestra.conglomerados.csv](tab/muestra.conglomerados.csv): esta tabla contiene información sobre la estimación del tamaño muestral basada en el análisis previo de conglomerados latentes posibles. En todos los casos se considera una potencia ($1-\beta$) del 80%, una variabilidad entre grupos reducida (1) y una variabilidad entre-grupos elevada (6) para obtener estimaciones de tamaños muestrales lo más conservadoras posible ($\alpha = 0.05$, ver archivo [01_muestra.R](stx/01_muestra.R)). Contiene tres columnas y el significado de cada una de ellas es el siguiente:

  - conglomerados.latentes: indica el número posible de conglomerados ($k$) latentes de personal docente en la muestra.
  - tamaño.conglomerado: indica el tamaño muestral ($n_k$) estimado por conglomerado latente.
  - muestra.total.estimada: indica el tamaño muestral estimado para el estudio considerando el tamaño muestral del conglomerado latente y el número de conglomerados considerados ($n_k \times k$).

- [muestra.estratificada.csv](tab/muestra.estratificada.csv): esta tabla contiene cinco columnas que informan sobre el tamaño muestral estimado teniendo en cuenta un muestreo estratificado con afijación proporcional para los cuerpos docentes considerados en el estudio. El significado de cada una de las columnas es el siguiente: 

  - cuer: cuerpo docente considerado.
  - Freq: número de personas en la población que pertenecen al cuerpo docente considerado.
  - as: estimación del tamaño muestral para el cuerpo docente considerado considerando el criterio de afijación proporcional simple.
  - pp: indica la proporción que suponen el número de personas incluida en el estrato considerado.
  - me: muestra estimada para el estrato considerado teniendo en cuenta un muestreo con afijación proporcional por estratos.

# Referencias

- León, O. G., y Montero, I. (2003). *Métodos de investigación en psicología y educación*. McGraw Hill.
