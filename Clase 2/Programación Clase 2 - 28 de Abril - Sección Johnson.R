### Programación Clase 2: 28 de Abril / Sección Johnson 

#Descripción de la clase: En esta clase y ya con la introducción de la clase 1 empezaremos
#a hablar más formalmente de los objetos que solemos trabajar en R y las diferencias entre
#estos.


#Let's Start!!! -----> Clase 2! Tipos y estructura de datos en R

#Hoy veremos tipo de datos, objetos en R, matrices, dataframes, lógica en R

#Diapo 3: Tipos de datos

#Los datos pueden ser:

# ** números (enteros [integer] o reales [numeric]): 1, 3, 5.5, 100
# ** texto ([character]): 'pepito' , 'tengo hambre', 'casa'
# ** lógicos ([logical]): TRUE ó FALSE

#hay otros tipos de datos como números complejos, fechas, factores, pero estos los iremos
#aprendiendo en el camino!! Pasito a pasito.

#Diapo 4: Objetos

#Un objeto es un ente o unidad que definimos en nuestro código y con el cual podemos interactuar,
#en este objeto almacenaremos datos en cierta estructura (un número, un vector, una lista, etc).

#Vector: ordenamiento unimensional o secuencia, de datos de un mismo tipo (número, texto, fecha).

#Matriz: ordenamiento bidimensional con filas y columnas, pero con datos de un mismo tipo.

#Data Frame: ordenamiento bidimensional que admite datos de diferente tipo.

#Listas: Es una colección de objetos, donde los objetos pueden diferir en tipo (vector, matriz)


# Crear proyecto Clases en la carpeta deseada
# y adentro crear carpetas Clase 2, Clase 3, Clase 4, Clase 5 con dir.create("nueva_carpeta")
# y crear script dentro de la carpeta clase 2.


#Diapo 5: Vectores

#Secuencia de datos cuyo orden es a lo largo (como un fideo spagetti), todos los elementos deben
#tener el mismo tipo de dato.

vector_1 <- c(-1/2, 1, 0.5)
class(vector_1) #elementos se entienden como numeros

vector_2 <- c("A","B","C")
class(vector_2) #elementos se entienden como caracteres, texto, simbolos

vector_3<-c("-3", "-6", "0.5")
class(vector_3) #las comillas hacen que R entienda los números como símbolos y no como números en sí

vector_4<-c(-3, -6, 0.5)
class(vector_4)

min(vector_4)
min(vector_3)

#Si no nos damos cuenta de cómo R interpreta cada vector, podríamos concluir cosas erróneas.

mean(vector_4)
mean(vector_3)   #No esperemos que nos arroje error para darnos cuenta de que algo anda mal!

#(A esto me refería con revisar nuestros datos!)

#¿Qué tipo de dato sería el vector c(1,"dos",3) ?

# Bajo el supuesto de que los vectores tienen que tener el mismo tipo de elemento
# todos tienen que ser o numéricos o de tipo character, ¿cuál creen que gana?

suspenso<- c(1,"dos",3) 
class(suspenso)


#Gana character, por qué?


#Los vectores lógicos se ven más o menos así:

vectorlogic<-c(TRUE, FALSE, TRUE, TRUE, TRUE)
vectorlogic

as.numeric(vectorlogic)

sum(vectorlogic)

#Conclusión: TRUE equivale a 1, y false equivale a 0 ! (éxito, fallo)

#Diapo 6: Funciones para generar vectores

#Típico: ¿cómo generamos una secuencia de 0 hasta 30?

#Opción 1:

0:30

#Opción 2:

seq(0,30)

#Función seq: útil para crear grillas:

seq(-10, 2, by=0.4) #Misma distancia entre cada número, desde -10 hasta el 2

?seq #Documentación de la función!

seq(-10, 2, length.out=10) #Quiero 10 números entre -10 y 2


# Podemos crear vectores de repeticiones:

rep(4, 10)

rep(-1:4, 5)

rep(c(1,2,3,4), 1, each=2)

#Supongamos que queremos un vector que diga:
# variable 1, hora 1, resultado 1, variable 2, hora 2, resultado 2, y así hasta llegar a resultado 6

#¿Cómo lo harían? DESAFÍO!


#Paso 1: hacemos un vector que diga variable hora resultado 6 veces:

rep(c('variable', 'hora', 'resultado'), times=6)

#Paso 2: hacemos un vector que tenga los números que necesitamos

rep(1:6,1, each=3)

# Paso 3: Los unimos con paste:

paste(rep(c('variable', 'hora', 'resultado'), times=6), rep(1:6,1, each=3))



# vectores de texto:

letters

LETTERS

tolower(LETTERS)

toupper(letters)

# Funciones de extraer texto las veremos más adelante :)


# Diapo 7: Funciones útiles para vectores:

length(LETTERS) #Largo del vector

is.vector(LETTERS) #Es un vector?

#as.vector() convierte un objeto a vector (si es posible, claro)


#Para seleccionar elementos de un vector usamos corchetes:

LETTERS[1]
LETTERS[0] #En R usamos desde 1! (importante)


LETTERS[1:10]

LETTERS[seq(1,10, by=2)]

# Diapo 8: Matrices! 

# ordenamiento bi dimensional (como las tablas que vemos en excel)
# el issue, es que las matrices son una generalización de los vectores, por ende
# todos los elementos (posiciones) deben tener el mismo tipo (numérico o texto)

#fila: vector horizontal
#columna: vector vertical

matrix(1:9, ncol=3)

class(matrix(1:9, ncol=3))

matrix(letters[1:9],ncol=3)

matrix(c(1, 'hola', 3, 'que tal jeje'), ncol=2)

is.vector(matrix(c(1, 'hola', 3, 'que tal jeje'), ncol=2)) #noup!

as.vector(matrix(c(1, 'hola', 3, 'que tal jeje'), ncol=2)) #alarga la matriz


Matriz<-matrix(seq(-10,100, length=10), ncol=2)

dim(Matriz) #Dimensiones de la matriz

Matriz[, 1] #Extrae primera columna

Matriz[, 2] #Extrae segunda columna

Matriz[4, ] #Extrae cuarta fila

Matriz[1:2, ] #Extrae primeras dos filas

Matriz[3:4, 1] #Extrae tercera y cuarta fila de la primera columna

Matriz[4,1] #Extrae de la fila 4, el registro en la primera columna

#y asi....


#Ejemplo:

nombres<-c('Natalie', 'Ricardo', 'Esteban', 'Maite', 'Javiera')

ndados<-c(4,2, 0, 6, 2)

cbind(nombres, ndados) #perdemos la naturaleza de la cantidad de dados :(((

#Diapo 11: ¿Cómo solucionamos esto....? con las famosas DATAFRAMES

datadados<-data.frame(nombres, ndados)

datadados

class(datadados)

names(datadados) #nombre de las variables o columnas

summary(datadados) #tenemos mezclas de datos

str(datadados)

class(datadados$nombres)
class(datadados$ndados)

datadados  #aqui ya empezamos a hablar de observaciones y variables (contexto de datos)

#Cada observación corresponde a una persona (fila)
#Las variables que tenemos en este caso es el número de dados (columna 1)


#Diapo 12: Ejemplo Data Frame

mtcars

class(mtcars)

#Diapo 14:

#Forma 1: Definiendo a priori los vectores como objetos previamente:

nombre <- c("Andrea","Bastian","Camilo","Daniela")
grupo_s <- c("AB", "0", "A", "B")
altura_cm <- c(165, 180, 158, 170)

tabla <- data.frame(nombre,grupo_s,altura_cm)
tabla

names(tabla)

#Forma 2:

tabla <- data.frame(
  nombre = c("Andrea","Bastian","Camilo","Daniela"),
  grupo_s = c("AB", "0", "A", "B"),
  altura_cm = c(165, 180, 158, 170)
)

tabla

names(tabla)

#Diapo 17: Seleccion de observaciones

mtcars$mpg

mtcars[, 1]

mtcars[['mpg']]

#Podemos hacer las mismas extracciones que hicimos en las matrices, por fila, columna, posición
#etc

#Diapo 18: Tibbles :D

#Los tibbles tienen mejoras a los dataframes:

install.packages('tidyverse') #instalamos el paquete
library(tidyverse) #Cargamos


(base_tible<-as_tibble(mtcars)) 

#Diapo 22: Para crear un tibble es lo mismo que para crear dataframes


(tabla_tibble<-tibble(nombres, ndados))


#Antes de pasar a la diapo 23: RECREO!!! (Hemos visto muchooo!)


#De vuelta...!

#Diapo 3: Valores no disponibles (Faltantes, missing values, perdidos, NA, null)


#Missing value: Es un dato que por alguna razón NO lo tenemos (ya sea porque no existe,
#se tipeó erronéamente, se borró, etc)

#Hay toda una teoría sobre imputación de valores perdidos (en caso de que se quiera realizar)
#y hoy veremos introducción a estos datos.


vec_ejemplo <- c(1, NA, 3, NA, 5)
class(vec_ejemplo)

#La función is.na() nos entrega TRUE si es NA y FALSE si no es NA

is.na(vec_ejemplo)

#¿qué significa entonces la siguiente cantidad?

sum(is.na(vec_ejemplo))

#### R: La cantidad de missing values en el vector ejemplo.

#Podemos crear tibbles, dataframes, etc con NA:

tib_ejemplo <- tibble(
  nombre = c("Claudio","Javiera","Elias", NA,"Camila"),
  valor = c(10, NA, 7, NA, 15)
)
str(tib_ejemplo)

summary(tib_ejemplo) #Es importante detectar que tenemos valores faltantes antes de trabajar!

#Diapo 24: Podemos omitir los datos faltantes con la función na.omit()

na.omit(tib_ejemplo)

#El problema de esto.....omite TODOS LOS REGISTROS(FILAS) CON ALGÚN NA!!
### En consecuencia, podemos perder muchos datos :c así que usar con PRUDENCIA!



#Diapo 25: Podemos omitir los NA en las funciones:

sum(vec_ejemplo) #suma
mean(vec_ejemplo) #promedio
median(vec_ejemplo) #mediana
min(vec_ejemplo) #minimo
max(vec_ejemplo) #maximo
range(vec_ejemplo) #rango


sum(vec_ejemplo, na.rm=TRUE) #suma
mean(vec_ejemplo, na.rm=TRUE) #promedio
median(vec_ejemplo,  na.rm=TRUE) #mediana
min(vec_ejemplo,  na.rm=TRUE) #minimo
max(vec_ejemplo,  na.rm=TRUE) #maximo
range(vec_ejemplo,  na.rm=TRUE) #rango


#Diapo 26: Listas
#Una lista es como.. cuando cuelgas ropa en un tendedero, tienes poleras, camisas, pantalones
#toallas.... es como tener una secuencia de distintos objetos (podríamos decir que es una colección
#ordenada de objetos, es un objeto que contiene varios objetos)

vec <- LETTERS[1:5]
mat <- matrix(1:9,ncol=3)
lista <- list( "Elemento_1" = vec,
               "Elemento_2" = mat)
lista

lista[[1]]
lista$Elemento_1

lista[[2]]
lista$Elemento_2

lista[[3]]<-'hola que tal'

lista

names(lista)[3]<-'frase' #Nombre del 3er elemento de la lista


lista[[2]]


#DESAFÍO: ¿Cómo podemos obtener la tercera fila del segundo elemento de nuestra lista?

lista[[2]][3,2]

lista$Elemento_2[3,2]

#### Diapo 28: OPERADORES LÓGICOS

10>5

"Gato" == "gato"

tolower("Gato")=="gato"

c("a","B","c") %in% letters

3:100<5

# Diapo 29:

tabla <- data.frame(
  nombre = c("Andrea","Bastian","Camilo","Daniela"),
  grupo_s = c("AB", "0", "A", "B"),
  altura_cm = c(165, 180, 158, 170)
)

#queremos conocer a las personas que miden menos de 170

tabla[tabla$altura_cm < 170, ]

#si queremos concoer a las personas que miden menos de 170 y tienen grupo sanguineo A:

tabla[(tabla$altura_cm < 170)&(tabla$grupo_s=='A'), ]


###### Diapo 31: Actividad


#1. Cree un vector con números del 0 al 11

secuencia<-0:11
secuencia<-seq(0,11)

#2. Vea qué tipo de información contiene el vector en su interior (class) y su largo (length).

class(secuencia)
length(secuencia)

#3. A partir de este vector cree una matriz de tres columnas (matrix).

(matriz<-matrix(secuencia, ncol=3))

#4. Ahora pruebe añadiendo el argumento byrow = TRUE. ¿Qué cambia? DESAFÍO

(matriz<-matrix(secuencia, ncol=3, byrow=TRUE))

#5. Confirme que ha creado correctamente una matriz con la función is.matrix y
#analice sus dimensiones (dim).

dim(matriz)

is.matrix(matriz)

#6. Tomemos el ejemplo de la base mtcars. Cargue la base y vea las diferentes formas de pedir 
#los valores de las observaciones para la variable mpg.

mtcars$mpg
mtcars[,1]
mtcars[["mpg"]]

#7.  La segunda variable corresponde a cyl, la cantidad de cilindros. Y el segundo tipo de 
#autos corresponde al modelo Mazda RX4 Wag. Pidamos entonces a R que nos entregue:

#a) El valor de todas las variables para el modelo Mazda RX4 Wag.

mtcars

mtcars[2,] #Pero esto es muy manual.....................

#Hagamoslo de manera más inteligente!! Ver el script de la clase!! Hicimos lo mismo :)


rownames(mtcars)  #nombre del auto

rownames(mtcars) =='Mazda RX4 Wag'  #indica con TRUE cual es el auto que se llama asi

tolower(rownames(mtcars)) == tolower('Mazda RX4 Wag') ##en minusculas puede ser mas facil filtrarlo


mtcars[tolower(rownames(mtcars)) == tolower('Mazda RX4 Wag'),]  #Mucho más eficiente! :D


## Más ideas:


grepl('mazda', tolower(rownames(mtcars))) #se filtra qué autos contienen mazda en el nombre


mtcars[grepl('mazda', tolower(rownames(mtcars))),] #Extraigo las filas completas de los autos
#que cumplen esa condición (de que tengan mazda en el nombre)


grepl('merc', tolower(rownames(mtcars))) #que autos contienen merc en el nombre



#b) La cantidad de cilindros para cada modelo de auto.

mtcars[, 2] #No se ve el nombre del auto

data.frame('Nombre'=rownames(mtcars), 'Cilindros'=mtcars[,2]) #Le añado el nombre del auto!


#c) La cantidad de cilindros para el modelo Mazda RX4.

mtcars[tolower(rownames(mtcars)) == tolower('Mazda RX4 Wag'),2]


#8. Veamos la diferencia entre la impresión de mtcars como data frame y como tibble.

mtcars
as_tibble(mtcars)


############################################### CIERRE


#Pregunta: Algún comentario para el equipo?? Favor escribir aquí!:  https://www.menti.com/msx2bfp3m3



#Referencias

# R para Ciencia de Datos : Libro en línea, en español.

# RStudio cheatsheets : “Torpedos”; en la parte inferior de la página hay versiones en español disponibles.
# RStudio Primers: Ejercicios interactivos; en inglés.
# Hands-on Programming with R : Libro en línea de introducción a la programación en R que no requiere conocimientos previos; en inglés.
# Curso de Estadística Computacional : Libro de apoyo para el curso Estadística Computacional dictado por María Teresa Ortiz.



