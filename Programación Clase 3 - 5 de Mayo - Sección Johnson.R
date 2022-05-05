### Programación Clase 3: 5 de Mayo / Sección Johnson 

#Descripción de la clase: En esta clase partiremos respondiendo dudas de la actividad de la clase pasada
#y luego patiremos importando bases de datos, y usaremos tidyverse, dplyr y otros paquetes 
#y funciones que nos servirán A DIARIO en
#nuestra pega como analistas o científicos de datos :)


# Nuestro equipo:

# - Natalie Julian (najulian@mat.uc.cl)
# - Maite Vergara (Maite.vergara@uc.cl) 
# - Esteban Rucan (errucan@uc.cl)


#Como ya creamos nuestro proyecto de las clases de R, abriremos nuestro proyecto y
#crearemos nuestra carpeta de la clase 3 con

dir.create("Clase 3")


#Primero empezaremos con dudas de las clases anteriores y/o de la tarea:

### Dudas que recibí por correo:

###1) ¿El módulo que tú impartes es sólo una parte de "Herramientas Computacionales" 
#o abarcarás el curso completo?  Si es sólo una parte, ¿cómo se llama el módulo? 
#R: El curso herramientas computacionales es laaargo, este capítulo se llama introducción a R
# y lo impartiré yo y serán 5 clases (ya vamos en la 3era :'( 

###2) consigo generar una secuencia, pero pese a pedir desde 0 me entrega resultado a contar de 1.
#la única forma de conseguir que sea desde 0 es restar 1. hay un método más directo para conseguir que se incluya al 0?
  
#Forma 1 (mencionada por el compañero):

1:11 -1

seq(1,11) -1

#Forma 2:

c(0, 1:10) #le pego el cero al principio! :)

#Forma 3:

0:10

seq(0,10)

###3)  ¿Cuál es la diferencia entre  [1] y [[1]] ? cuando se trabaja con dataframe ¿hay diferencias?

#La mejor forma de resolver sus dudas es empíricamente, veamos qué sucede al usar [1] y [[1]] en una
#dataframe:


mtcars

class(mtcars) #es una dataframe, comprobado!

mtcars[,1] #Extrae la primera columna (como vector)

mtcars[1] #Extrae la dataframe acortada a la primera columna

mtcars[[1]] #Extrae la primera columna (como vector)

## En general [[1]] se suele usar en listas, y en dataframes bases de datos estructuradas, se suele
#usar [,1] :)

### 4) el modelo de auto no es una variable que sea observable (es un nombre de fila). 
#por lo que no sabría cómo realizar un filtro.

#Ya vimos que el nombre del modelo está como nombre de fila, podemos extraerlo así:

rownames(mtcars) #extrae el vector con los nombres de los modelos

#Podemos crear una nueva dataframe que contenga el nombre como columna, de la siguiente forma:

mtcars.arreglada<-data.frame(nombres=rownames(mtcars),mtcars)

#Pero aparecen también los nombres de las filas :((

#Vamos a eliminarlos! o mas bien, reemplazarlos por null!!

rownames(mtcars.arreglada)

rownames(mtcars.arreglada)<-NULL ##indica que esté vacío

mtcars.arreglada

rownames(mtcars.arreglada)<-1:nrow(mtcars.arreglada)

mtcars.arreglada

#La otra pregunta era cómo podíamos extraer los registros de determinado modelo
#por ejemplo del Mazda RX4 Wag

#Opción 1: Filtrar uno o más modelos específicos

mtcars.arreglada$nombres %in% c('Mazda RX4 Wag') 

mtcars.arreglada$nombres %in% c('Mazda RX4 Wag', 'Volvo 142E') #Y puedo filtrar más de un modelo

mtcars.arreglada[mtcars.arreglada$nombres %in% c('Mazda RX4 Wag', 'Volvo 142E'),] #y acá los filtro

#Opción 2: Filtrar que el modelo sea un toyota

grepl('toyota', mtcars.arreglada$nombres) #no me filtra ninguno T_T por qué creen??

#El tema de las mayúsculas y minúsculas es MEGA sensible en R !!

#podemos pasar a minúsculas los nombres para evitarnos este problema}

grepl('toyota', tolower(mtcars.arreglada$nombres)) #Ahora sí me encuentra algunos


sum(grepl('toyota', tolower(mtcars.arreglada$nombres))) #¿cuántos modelos toyota hay? R:2

#y ahora para filtrar, hacemos lo mismo!

mtcars.arreglada[grepl('toyota', tolower(mtcars.arreglada$nombres)) ,]


#Listoquis :)))

###################### MÁS DUDAS DE LA TAREA? PLEASE! HACERLA ANTES DE 
#LLEGAR A LA AYUDANTÍA DEL SÁBADO :)


#Ahora sí! Let's Start!!! -----> Clase 3!

#### IMPORTACIÓN DE DATOS

#Importar datos es, cargarlos en R, así como importamos paquetes o librerías, hacemos lo mismo
#con los datos. Usualmente hablamos de importar datos cuando estos se encuentran en un archivo 
#por ejemplo: una planilla excel, un csv, un archivo de SPSS, etcétera.

#Lo importante es que:

#### Dependiendo del formato del archivo usaremos una u otra función

#### por ejemplo, read_csv lo usamos para cargar archivos CSV.
####              read_table nos sirve para cargar archivos txt
####              read.excel nos sirve para cargar archivos excel


##Si la base está super limpia, usar la función import() del paquete rio.


#### Ejemplo 1:

### La base 202010_PUB_TRAM5_ACT contiene data de subrubros y rubros económicos y detalle.

#Vamos a importarla en R!

#### PRIMER PASO (LO CONVERSAMOS EN LA CLASE 1:) miremos nuestros datos en el archivo fuente.
#### ¿qué cositas ven que les llame la atención?

#### Es un archivo en formato excel
#### Hay unas líneas en blanco al principio
#### Tenemos 2 hojas en el excel, solo queremos importar la primera
#### Hay muchos valores asterisco * (si leemos en la 2da hoja, corresponden a NA, porque no
#### pueden ser informados por diversas razones)

### Esquina superior derecha, hacer click en Import Dataset>>From Excel>>Seleccionar ruta del archivo
### y especificar todo lo que necesitamos especificar

#### En sheet: La hoja que queremos cargar
#### En name: el nombre del objeto que va a contener la data
#### En skip: La cantidad de filas a saltarse
#### En NA: el símbolo que representa los NA


library(readxl)
empresas <- read_excel("C:/Users/Naty/Downloads/202010_PUB_TRAM5_ACT.xlsx", 
                                    sheet = "Datos", na = "*", skip = 4)
View(empresas)

empresas #es un tibble :) la función carga los archivos en un objeto tibble

names(empresas) #los nombres son horribles!!! :((

empresas$`Número de trabajadores dependientes informados` #<------- y hay que extraerlos así, con comillas, demasiado incomodo!!

#Vamos a usar el paquete janitor :)

install.packages('janitor') #Lo instalamos

library(janitor) #Lo cargamos!

#Diapo 12: Podemos limpiar los nombres de una base de datos, con la función clean_names()


empresas<-clean_names(empresas) #limpia los nombres (aplica minúsculas y guiones)

empresas$numero_de_trabajadores_dependientes_informados

View(empresas)

########### NUEVA NOTACIÓN!! 


empresas <- empresas %>% clean_names()  #hoy en día las funciones se van aplicando de esta forma
#de manera anidada!! el pip o pipe '%>%' es el operador que te permite aplicar funciones de manera
#secuencial

library(tidyverse)
empresas %>% clean_names() %>% select(numero_de_trabajadores_dependientes_informados)

#Lo profundizaremos en un par de diapos más :D

#### Ejemplo 2:

### La base robos contiene robos por sucursal

#### miremos nuestros datos en el archivo fuente.
#### ¿qué cositas ven que les llame la atención?

# Es un archivo excel
# solo tiene una hoja
# tiene celdas agrupadas!
# Los casos 'sin información' son NA

#Carguemosla a R!!

#si tratamos de ocupar el mismo método de importación anterior (import dataset>>From Excel)
#nos daremos cuenta de que nos llenará con NA algunas filas!! :(

# Afortunadamente esto lo podemos solucionar :)

# Diapo 11: Tendremos que usar la función read.xlsx()

install.packages('openxlsx')

library(openxlsx)

robos<-read_xlsx("C:/Users/Naty/Downloads/robos.xlsx", fillMergedCells = TRUE)

#Nos arroja un error T_T, ¿alguien sabe por qué? DESAFÍO

robos<-openxlsx::read.xlsx("C:/Users/Naty/Downloads/robos.xlsx", fillMergedCells = TRUE)

View(robos)

#Pero falta corregir los casos 'sin información'

?openxlsx::read.xlsx #documentación de la función


robos<-openxlsx::read.xlsx("C:/Users/Naty/Downloads/robos.xlsx", fillMergedCells = TRUE,
                           na.strings = 'Sin Información')

#Ahí sipo :)



#Diapo 14: Tidyverse formalmente:

#Paquete estrella para el data science, incluye muuchos paquetes útiles :)

#ggplot2: gráficos 
#dplyr: manipulación de datos
#stringr: manejo de strings (texto)
#y etcétera... se aprenderán en el diplomado :D


empresas %>% select(ano_comercial) #selecciona solo esa columna

empresas %>% filter(tramo_segun_ventas_5_tramos=='Micro') #filtra determinada columna

empresas %>% filter(grepl('Agencias',actividad_economica)) #filtra actividad economica que contiene agencias

empresas %>% mutate(venta_clp=ventas_anuales_en_uf*32277.59) #Crear columnas nuevas con cálculos

View(empresas %>% mutate(venta_clp=ventas_anuales_en_uf*32277.59))

empresas%>%rename(anio_comercial=ano_comercial) #cambiarle el nombre a las columnas

## Y también podemos combinarlas todas :)

empresas %>% 
  select(ano_comercial, actividad_economica, ventas_anuales_en_uf) %>% 
  filter(grepl('Agencias',actividad_economica)) %>%
  mutate(venta_clp=ventas_anuales_en_uf*32277.59) %>%
  group_by(ano_comercial, actividad_economica)%>%
  count() 

#Amazing :)


#si queremos el n ésimo registro de la base:

empresas %>% slice(4)


empresas %>% slice(1:10)  #o los primeros 10 registros

#similar a head()


#Ideal hacer la actividad antes del recreoooooooo!!! 

# Si vamos bien en la hora, hacer dinámica de grupos :)



### ACTIVIDAD: Link base: https://drive.google.com/file/d/1bEH6281W_jwMQA0b-gRvcHcxQSN4-uGR/view

#1. Importe la base de datos

library(readxl)
viviendasRM <- read_excel("C:/Users/Naty/Downloads/viviendasRM.xlsx", 
                          sheet = "viviendasRM")
View(viviendasRM)


#2. Limpie los nombres de la base de datos

(viviendasRM<-viviendasRM %>%
                          clean_names())

#3. Usando las funciones de dplyr y el operador pipe, indique:

#a) Toda la información de la cuarta vivienda de la base

viviendasRM%>%
  slice(4)

#b) El número de baños de la octava vivienda

viviendasRM%>%
  select(n_banos)%>%
  slice(8)

#c) El número de estacionamientos de la vivienda 14

viviendasRM%>%
  select(n_estacionamientos)%>%
  slice(14)

#Lo más correcto acá sería imputar el No por cero :)


#d) El total de superficie M2 y valor en UF desde la quinta vivienda hasta la décima.


viviendasRM%>%
  select(total_superficie_m2, valor_uf)%>%
  slice(5:10)


#e) Listado de superficie M2, corredor y valor en UF de las viviendas 
#cuya superficie M2 es igual a 100 M2.

viviendasRM%>%
  select(total_superficie_m2, corredor, valor_uf)%>%
  filter(total_superficie_m2==100)

################# ÚLTIMA PATITA DE LA CLASE!!! GRÁFICOS EN GGPLOT2

?ggplot2 #ya estaba cargado, venía incluido en tidyverse :)


## Gráfico de puntos

ggplot(data=viviendasRM, aes(x=n_habitaciones, y=valor_uf))+ 
  geom_point() #tipo de grafico de puntos

max(viviendasRM$n_habitaciones, na.rm=TRUE)

ggplot(data=viviendasRM, aes(x=n_habitaciones, y=valor_uf))+ 
  geom_point() +
  scale_x_continuous(breaks = 1:19) #agregamos la grilla de 1 hasta a 19 habitaciones


#Histograma

ggplot(data=viviendasRM, aes(x=valor_uf))+ 
  geom_histogram() #histograma

ggplot(data=viviendasRM, aes(x=valor_uf))+ 
  geom_histogram()+
  scale_x_continuous(breaks = seq(1, max(viviendasRM$valor_uf), length.out=9))
#agregamos en el eje x mas numeritos, porque habian muy pocos

ggplot(data=viviendasRM, aes(x=valor_uf))+ 
  geom_histogram(bins=50)+ #los bins modifican el ancho de cada intervalo
  scale_x_continuous(breaks = seq(1, max(viviendasRM$valor_uf), length.out=9))


#Gráfico de puntos

ggplot(data=viviendasRM, aes(x=valor_uf))+ 
  geom_boxplot() #grafico de caja y bigote

#Gráfico de barras:

ggplot(data=viviendasRM, aes(x=comuna))+
  geom_bar() #grafico de tipo de barra


ggplot(data=viviendasRM, aes(x=comuna))+
  geom_bar()+ 
  ylab('Cantidad de casas en venta')+ #nombre eje y
  xlab('Comuna') #nombre eje x
  

ggplot(data=viviendasRM, aes(x=comuna))+
  geom_bar()+ 
  ylab('Cantidad de casas en venta')+
  xlab('Comuna')+
  theme(axis.text.x = element_text(angle = 90)) #Ahora si se ven los nombres pueh


########## FIN! MUCHAS GRACIAS POR SU ATENCION :)

#algún comentario o sugerencia para el equipo? Please déjalo aquí!! :D

### https://www.menti.com/msx2bfp3m3


#Referencias

#Capítulo sobre visualización de datos del libro "R para Ciencia de Datos"`, de Hadley Wickham y Garrett Grolemund.

#Cheatsheet Domar Datos con dplyr y tidyr, Traducido por Frans van Dunné.

#Cheatsheet Transformación de Datos con dplyr, Traducido por Frans van Dunné.

#Cheatsheet ggplot2, Traducido por Diego Kozlowski, previamente traducido por Carlos Ortega, Santiago Mota y Carolina Mengoni Goñalons.
