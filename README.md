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

- [demo.csv](dat/demo.csv): esta tabla contiene información sociodemográfica de la muestra de participantes. Las variables que incluye, así como los posibles valores que pueden asumir, son las siguientes:

  - id: código de identificación del participante.
  - sex: indica si el participante es mujer (0) u hombre (1).
  - ec: indica el estado civil del participante. Sus posibles categorías son:
    - Casado/casada.
    - Convivencia en pareja.
    - Divorciado/divorciada.
    - Pareja estable.
    - Soltero/soltera.
    - Viudo/viuda.
  - nh: indica el número de hijos del participante.
  - ne: indica el nivel de estudios del participante. Los valores posibles que asume esta variable son los siguientes.
    - Diplomatura.
    - Doctorado.
    - Formación profesional.
    - Grado.
    - Licenciatura.
  - esp: especialidad del nivel de estudios. Esta variable asume los siguientes valores con sus correspondientes significados:
    - 1: Magisterio.
    - 2: Filosofía y Letras.
    - 3: Psicología y logopedia.
    - 4: Filología Hispánica.
    - 5: Psicología.
    - 6: Geografía e Historia.
    - 7: Educación Infantil.
    - 8: Inglés.
    - 9: Matemáticas y ciencias.
    - 10: Traducción e interpretación.
    - 11: Física.
    - 12: Educación Física.
    - 13: Química.
    - 14: Bellas Artes.
    - 15: Francés.
    - 16: Administración y finanzas.
    - 17: Ingeniería.
    - 18: Biología.
    - 19: Pedagogía.
    - 20: Música.
  - mp: indica la respuesta a la pregunta *¿Ha cursado el título de Máster del Profesorado?* cuyas posibles respuestas son:
    - 0: No.
    - 1: Sí.
  - rol: indica el rol que desempeña el participante en su centro de trabajo y asume los siguientes posibles valores.
    - Dirección.
    - Educación Infantil.
    - Educación Primaria.
    - Educación Secundaria.
    - Jefatura de Estudios.
    - Orientación.
    - Otro.
    - Secretaría.
  - imf: indica los ingresos netos mensuales en el núcleo familiar. 
  - cue: cuerpo docente al que pertenece el participante. Las categoría de respuesta presentes en esta variable son las siguientes:
    - Cuerpo de Catedráticos de Enseñanza Secundaria.
    - Cuerpo de Maestros.
    - Cuerpo de Profesores de Enseñanza Secundaria.
    - Cuerpo de Profesores Técnicos de Formación.
    - Otro.
    - Profesores de Religión (Primaria).
    - Profesores de Religión (Secundaria).
    - Profesores Especialistas.
    
- [d21.csv](dat/d21.csv): esta tabla contiene las respuestas a la escala abreviada de depresión, ansiedad y estés (DASS-21) de [Lovibond y Lovibond (1995)](https://doi.org/10.1016/0005-7967(94)00075-U). Este archivo tiene cuatro conjuntos de variables. El significado de las variables es el siguiente:
  - id: es el identificador de cada uno de los casos del estudio.
  - de e1 a e7: se refieren a los ítems de estrés del DASS-21.
  - de a1 a a7: se refieren a los ítems de ansiedad del DASS-21.
  - de d1 a d7: se refieren a los ítems de depresión del DASS-21.

  El significado de cada una de las respuestas a estos ítems es el siguiente:
  
  - 0: no aplicable a mi.
  - 1: un poco aplicable a mí o durante parte del tiempo.
  - 2: bastante aplicable a mí, o durante una buena parte del tiempo.
  - 3: muy aplicable a mí, o la mayor parte del tiempo.
    
- [cesqt.csv](dat/cesqt.csv): esta tabla contiene las respuestas a la escala para la evaluación del síndrome de quemarse por el trabajo (CESQT-PE) de [Gil-Monte et al. (2009)](https://www.medigraphic.com/cgi-bin/new/resumenI.cgi?IDARTICULO=21721). Esta matriz de datos contiene 21 columnas que se agrupan en cinco bloques. El significado de cada una de las columnas es el siguiente:
  - id: es el identificador de cada uno de los casos del estudio.
  - de il1 a il5: se refieren a los ítems de la dimensión de ilusión por el trabajo del CESQT-PE.
  - de in1 a in6: se refieren a los ítems de la dimensión de indolencia del CESQT-PE.
  - de cu1 a cu5: se refieren a los ítems de la dimensión de culpa del CESQT-PE.
  - de de1 a de4: se refieren a los ítems de desgaste psíquico del CESQT-PE.
  
  Las opciones de respuesta para cada una de estas variables oscilan entre 0 y 4 y su significado es el siguiente:
  
  - 0: nunca.
  - 1: raramente: algunas veces al año.
  - 2: a veces: algunas veces al mes.
  - 3: frecuentemente: algunas veces por semana.
  - 4: muy frecuentemente: todos los días.

## Archivos de código

-   [sidoNet.R](sidoNet.R): es el archivo de código maestro del proyecto. Desde este archivo se van ejecutando el resto de los archivos de código del proyecto.

- [01_muestra.R](stx/01_muestra.R): este archivo realiza estimaciones del tamaño nuestral teniendo en cuenta los posibles conglomerados de docentes latentes y teniendo en cuenta el tamaño de los estratos poblacionales estudiados. Genera las tablas [muestra.conglomerados.csv](tab/muestra.conglomerados.csv) y [muestra.estratificada.csv](tab/muestra.estratificada.csv).

- [02_demo.R](stx/02_demo.R): este archivo ejecuta el análisis de las características sociodemográficas de la muestra del estudio. Este archivo genera las tablas [t.frec.csv](tab/t.frec.csv) y [edin.csv](tab/edin.csv) que son simultáneamente proyectadas en la consola de R. Este archivo también produce las figuras [edad.pdf](fig/edad.pdf) y [imf.pdf](fig/imf.pdf).

- [03_fiabil.R](stx/03_fiabil.R): este archivo estima los coeficientes de fiabilidad ($\omega$ de McDonald y $\alpha$ de Cronbach) y sus intervalos de confianza utilizando técnicas de remuestreo aleatorio (1000 muestras en todos los casos) de los datos muestrales. Este archivo genera la tabla [fiabil.csv](tab/fiabil.csv) que se almacena en la carpeta *tab*. **Atención:** ejecutar el archivo de código [03_fiabil.R](stx/03_fiabil.R) puede consumir una gran cantidad de recursos y de tiempo. El tiempo empleado para ejecutar las computaciones dependerá de lo recursos del ordenador en que se ejecute el comando correspondiente. Es por ello por lo que la línea de código que desencadena los análisis de fiabilidad ha sido comentada en el archivo maestro del proyecto ([sidoNet.R](sidoNet.R)). En su lugar, se ha optado por introducir la línea de código que permite recuperar los resultados ([fiabil.csv](tab/fiabil.csv)) que produce dicho archivo y que están almacenados en la carpeta *tab*.


## Tablas

- [exclusion.xlsx](tab/exclusion.xlsx): esta tabla contiene cinco columnas destinadas a clarificar el proceso de toma de decisiones para incluir (o no) los perfiles docentes correspondientes en el estudio. El significado de las columnas de la tabla es el siguiente:

  - ex: indica si el perfil docente se excluye del estudio.	
  - mex: indica el motivo de exclusión del perfil docente.
  - tpe: indica el tamaño poblacional del estrato (véase el archivo [cuerpo.csv](dat/cuerpo.csv) y su descripción correspondiente). 
  - cue: cuerpo docente.	
  - meap: muestra estimada para el estrato considerando un muestreo estratificado con afijación proporcional al cuerpo docente (León y Montero, 2003).

- [muestra.conglomerados.csv](tab/muestra.conglomerados.csv): esta tabla contiene información sobre la estimación del tamaño muestral basada en el análisis previo de conglomerados latentes posibles. En todos los casos se considera una potencia ($1-\beta$) del 80%, una variabilidad entre grupos reducida (1) y una variabilidad entre-grupos elevada (6) para obtener estimaciones de tamaños muestrales lo más conservadoras posible ($\alpha = 0.05$, ver archivo [01_muestra.R](stx/01_muestra.R)). Contiene tres columnas y el significado de cada una de ellas es el siguiente:

  - conglomerados.latentes: indica el número posible de conglomerados ($k$) latentes de personal docente en la muestra.
  - tamanyo.conglomerado: indica el tamaño muestral ($n_k$) estimado por conglomerado latente.
  - muestra.total.estimada: indica el tamaño muestral estimado para el estudio considerando el tamaño muestral del conglomerado latente y el número de conglomerados considerados ($n_k \times k$).

- [muestra.estratificada.csv](tab/muestra.estratificada.csv): esta tabla contiene cinco columnas que informan sobre el tamaño muestral estimado teniendo en cuenta un muestreo estratificado con afijación proporcional para los cuerpos docentes considerados en el estudio. El significado de cada una de las columnas es el siguiente: 

  - cuer: cuerpo docente considerado.
  - Freq: número de personas en la población que pertenecen al cuerpo docente considerado.
  - as: estimación del tamaño muestral para el cuerpo docente considerado considerando el criterio de afijación proporcional simple.
  - pp: indica la proporción que suponen el número de personas incluida en el estrato considerado.
  - me: muestra estimada para el estrato considerado teniendo en cuenta un muestreo con afijación proporcional por estratos.
  
- [t.frec.csv](tab/t.frec.csv): esta tabla contiene las frecuencias absolutas y relativas (como porcentajes) para las variables relativas al sexo, al estado civil, al número de hijos al nivel de estudios y al rol que asumen los participantes en su centro educativo. La tabla tiene tres columnas cuyos significados son:
  - fa: frecuencia absoluta.
  - fr: porcentaje.

- [edin.csv](tab/edin.csv): esta tabla contiene estadísticos descriptivos para la edad y para los ingresos mensuales familiares (imf) del participante. Las filas de la tabla contienen la siguiente información:
  - 0%: valor mínimo de la variable.
  - 25%: percentil 25 de la variable.
  - 50%: percentil 50 de la variable.
  - 75%: percentil 75 de la variable.
  - 10%: valor máximo de la variable.
  - M: media de la variable.
  - DT: desviación típica de la variable.
  
- [fiabil.csv](tab/fiabil.csv): esta tabla contiene las estimaciones de fiabilidad para las escalas DASS-21 y CESQT así como para sus correspondientes subescalas. El significado de las columnas que contiene esta tabla es el siguiente:
  - om: estimación puntual del coeficiente de consistencia interna $\omega$ de McDonald.
  - et.om: estimación del error típico asociado al coeficiente de consistencia interna $\omega$ de McDonald.
  - li.om: estimación del límite inferior del intervalo de confianza al 95% para el coeficiente de consistencia interna $\omega$ de McDonald.
  - ls.om: estimación del límite superior del intervalo de confianza al 95% para el coeficiente de consistencia interna $\omega$ de McDonald.
  - al: estimación puntual del coeficiente de consistencia interna $\alpha$ de Cronbach.
  - et.al: estimación del error típico asociado al coeficiente de consistencia intern $\alpha$ de Cronbach.
  - li.al: estimación del límite inferior del intervalo de confianza al 95% para el coeficiente de consistencia interna $\alpha$ de Cronbach.
  - ls.al: estimación del límite superior del intervalo de confianza al 95% para el coeficiente de consistencia interna $\alpha$ de Cronbach.
  
  Por su parte, el significado de las filas es el siguiente:
  - dass.21: escala DASS-21.
  - dass.21.e: subescala de estrés de la escala DASS-21.
  - dass.21.a: subescala de ansiedad de la escala DASS-21.
  - dass.21.d: subescala de depresión de la escala DASS-21.
  - cesqt: escala CESQT.
  - cesqt.il: subescala de ilusión por el trabajo de la escala CESQT.
  - cesqt.in: subescala de indolencia de la escala CESQT.
  - cesqt.cu: subescala de culpa de la escala CESQT.
  - cesqt.de: subescala de desgaste psicológico de la escala CESQT.
  

## Figuras

- [edad.pdf](fig/edad.pdf): es el histograma de la edad.

- [imf.pdf](fig/imf.pdf): es el histograma de la los ingresos medios familiares de los participantes.


# Referencias

- Gil-Monte, P. R., Unda Rojas, S., y Sandoval Ocaña, J. I. (2009). Validez factorial del "Cuestionario para la Evaluación del Síndrome de Quemarse por el Trabajo"" (CESQT) en una muestra de maestros mexicanos. *Salud Mental, 32*(3), 205-214. 

- León, O. G., y Montero, I. (2003). *Métodos de investigación en psicología y educación*. McGraw Hill.

- Lovibond, P. F., y Lovibond, S. H. (1995). The structure of negative emotional states: Comparison of the Depression Anxiety Stress Scales (DASS) with the Beck Depression and Anxiety Inventories. *Behaviour Research and Therapy, 33*(3), 335-343. https://doi.org/10.1016/0005-7967(94)00075-U
