### Programación Clase 1: 21 de Abril / Sección Johnson 

#Descripción de la clase: En esta clase comenzaremos a introducirnos en el lenguaje de programación R desde lo
#básico: cómo moverse en Rstudio, cómo crear un script, hasta definir objetos, calcular expresiones matemáticas
#entre otros.

#Link PDF: https://drive.google.com/file/d/19X_4hng49mL_UXD_j6i0VRO5eblJE8sR/view

# EL Equipo que los acompañará en el proceso de inserción al lenguaje R:

# - Natalie Julian (najulian@mat.uc.cl)
# - Maite Vergara (Maite.vergara@uc.cl) 
# - Esteban Rucan (errucan@uc.cl)

### let's start!!

#Ciencia de datos: Ciencia + Datos 
## Ciencia: conocimiento o saber constituido mediante la observación y el estudio sistemático y metodológico e la naturaleza
## Dato: 'lo que se da', es la representación de variables que miden un fenómeno


#Ciencia de datos --> Generar conocimiento de forma metodológica usando datos 

# Pensemos que hoy en día el volumen de información es BRUTAL...
 
  # En un minuto...

  # Despegan al menos 60 aviones
  # Se produce algún terremoto
  # Tu corazón late 75 veces
  # Se suben al menos 300 mil historias en instagram
  # Ocurre MUCHO!

# Entonces, habiendo tanto volumen de fenómenos, tanta volumetría y con los avances de la automatización y todo,
  # se generan muchísimos DATOS..

  #pero.. ALERTA SPOILER!! Los datos no siempre (nunca) están así como así fácil llegar y usar..
  # los datos hay que ir a buscarlos, luego de buscarlos, mirarlos! y cuando los miremos nos daremos cuenta
  # de que vienen sucios, desordenados y no de la forma que nos serviría tenerlos
  
  # Paso 0: Generar preguntas que creamos que puedan ser respondidas con data
  # Paso 1: Ir a buscar la data que nos sirva para responder las preguntas
  # Paso 2: Una vez que la tengamos, miremos la data! (Para mirarla, hay que importarla)
  # Paso 3. Pensemos cómo nos serviría la data, y limpiamos y adecuamos la data a lo que nos serviría
  # Paso 4: Comenzar a buscar de qué manera resolvemos las preguntas con nuestra data!

  # Aquí comienza la minería de data, transformación de la data, 
  # visualización de data, inferencias de la data, modelamiento, resultados (comunicarlos)

  # y la tarea que sigue es ver de qué manera lo dejamos 'productivo' para poder accionar en base a los resultados
  # con datos que continuamente están llegando (BIG DATA!)


  # En todo este laargo proceso, existen distintas herramientas que nos pueden servir para distintas etapas:
  
  # Si queremos mirar la data, podríamos usar excel o SQL (BQ, Dbeaver)
  # Si queremos transformar la data, podríamos usar R, Python, Power BI
  # Si queremos visualizar la data, podríamos usar Tableau, Data Studio, Minitab, SPSS
  # Si queremos aplicar modelos, podríamos usar SAS, R, Python

  # Y hay muuuchas herramientas más, cada vez surgen nuevas y mueren otras, la pregunta no es ¿R o Python? o ¿R o SAS?
  # porque cada una tiene sus pro en distintos escenarios
  # La pregunta es en qué situaciones me sirve usar R, y cuándo SAS, esto va a depender de muchos factores, incluso
  # del área en la que estamos, el trabajo con los otros equipos, la herramienta con la que tenemos licencia, etc

  
  # Link: https://www.menti.com/msx2bfp3m3

  # Resultados encuesta: La mayoría había escuchado sobre este lenguaje de programación, y un cuarto aprox lo ha usado

  # R es un lenguaje de programación y entorno, que nace muy focalizado al análisis estadístico.
  # RStudio es un entorno más amigable donde podemos usar R 

  # Diferencia con Python? Son similares ya que ambos son lenguajes de programación abiertos y orientados a objetos (i.e creamos vectores,
  # matrices, listas, etc). Las diferencias más notorias suelen darse en cómo tratar algunos objetos, cómo definimos los objetos,
  # y cómo aplicamos las funciones. (Lo podrán ver más adelante en las clases de Python!)
  
  # Ningún lenguaje de programación es mejor que otro! Cuál nos sirva o nos guste más es otra cosa...

  # Saber más idiomas me sirve para comunicarme con más gente y tener una alta adaptabilidad, en lenguajes de programación es lo mismo!

  # Paquete: librería, extensión que incluye ciertas funciones 

  # R ya incluye funciones 'base' dependiendo de lo que queramos hacer vamos a necesitar añadir más funciones a nuestro environment
  

  #Manos a la obra!!

  # Para utilizar RStudio necesitamos instalar R y Rstudio, 

  ## Link para descargar R: https://cran.r-project.org/
  
  ## Link para descargar RStudio: https://www.rstudio.com/products/rstudio/download/#download
  
 
  #Una vez instalados ambos, los abrimos y veremos las amplias diferencias que hay entre ambos.

  # Si por alguna razón prefieren no instalar nada, podemos usar RStudio Cloud, link aquí:https://rstudio.cloud/
  # Haces click en Sign Up, creas tu cuenta y luego al entrar haces click en New Proyect.

  # Para cambiar la apariencia de nuestro Rstudio, vamos a Tools>Global Options >Appearence

  # COpiar el siguiente código en la consola:

print('Hola R') #Printea (Reproduce) la frase hola R en la consola

paste('Hola', 'R', sep=' ')


# Si apretamos Ctrl + L (Cmd + L) se limpia la consola

# Ctrl + Shift + N // Cmd+shif+N ---- > Crea un nuevo script

#Copiar el código anterior en el script nuevo

#Ejecutar código en R: Ctrl+Enter // Cmd+Enter -> Ejecuta línea de código actual
                    # Ctrl+Shift+N // Cmd+Shift+N -> Ejecuta todo el código

#Para guardar nuestro script podemos teclear Ctrl+S

# R entrega sugerencias de autocompletado y además te indica error en tu código

# Podemos comentar usando el simbolo # nuestro código. Para hacer comentario varias lineas de codigo, usamos Ctrl+Shift+C

# Ctrl+Shift+R // Cmd + Shift + R nos permite seccionar nuestro código

# Actividad práctica!! Momento de aplicar lo que hemos visto!

# R como calculadora
2+2
3*6
# R crea objetos
x <- 5+3
y <- 7-2
a <- "hola"


# Diapositiva 20 ----> Tomar break!


# Directorio de trabajo: Es la ruta en nuestro computador donde R buscará los archivos que necesitemos y donde guardará los archivos
# que creemos durante la sesión.

# ejecuta el código getwd() para conocer tu directorio de trabajo actual.


getwd()

# si quiero cambiar mi directorio actual puedo usar la función setwd(), por ejemplo:

setwd("GitHub/Clases-R-Diplomado-Data-Science_2022/Clase 1 - 21 de Abril")


# Proyectos: Para crear un proyecto vamos a la esquina superior derecha donde dice Proyect y damos click en New Project

# o también, file -> new file

# New directory: va a crear una carpeta nueva en nuestro computador exclusivamente para el proyecto

# Existing directory: va a alojar el proyecto en una carpeta que ya existe

# La gracia de un proyecto es que es como una sesión de R nueva y única! y uno puede cargar paquetes que sean propias de ese proyecto.
# En Rstudio justamente uno crea proyectos para separar nuestro trabajo.
 
#El archivo rproj pequeñito es justamente el archivo que se encarga de que R entienda que todo lo que está en esa carpeta es parte
# del proyecto y que están 'relacionados' o conectados.


dir.create("nueva_carpeta")
#o tambien en files -> new folder a la derecha

# Actividad! Práctica! A aplicar lo visto...

#Calculos en R

2 + (4*5) - exp(3)


log(5) + pi/sqrt(5)

# Alt + - para hacer la flecha

### AQUÍ PRACTICAR DEFINIENDO ALGUNOS OBJETOS *********




#usar las funciones min, max, mean, median, range, 


# Definimos 'objetos' (Esto lo veremos más adelante)
poleras <- c(254,203,182,50)
meses <- c("Ene", "Feb", "Mar", "Abr")
min(poleras) # Encuentra el mínimo
plot(poleras) # Gráfico de puntos
barplot(poleras, # Gráfico de barras
        names.arg = meses,col="orange") # Argumentos adicionales.

sqrt(521) 
getwd() #Cuando no tienen argumento son preguntas 'del contexto'
Sys.Date()

args(log) #Argumentos de la función log

log(100,10)

log(10,100)

log(100,10)==log(10,100)

log(base=10) #error 


#Aqui mostrar mas errores






#objetos en r

numero <- 256

resultado <- sqrt(numero) #contiene información de tipo numérica

class(numero)


a <- 5
b <- a
a <- 3

#para borrar objetos:

remove(a)


#nombre <- objeto
#nombre = objeto
#objeto -> nombre

#paquetes

install.packages("ggplot2")

library(ggplot2)

#Mostrar apartado donde se ven los paquetes instalados



#Referencias

# R para Ciencia de Datos : Libro en línea, en español.

# RStudio cheatsheets : “Torpedos”; en la parte inferior de la página hay versiones en español disponibles.
# RStudio Primers: Ejercicios interactivos; en inglés.
# Hands-on Programming with R : Libro en línea de introducción a la programación en R que no requiere conocimientos previos; en inglés.
# Curso de Estadística Computacional : Libro de apoyo para el curso Estadística Computacional dictado por María Teresa Ortiz.


