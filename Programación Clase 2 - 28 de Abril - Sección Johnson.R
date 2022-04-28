### Programación Clase 2: 28 de Abril / Sección Johnson 

#Descripción de la clase: En esta clase y ya con la introducción de la clase 1 empezaremos
#a hablar más formalmente de los objetos que solemos trabajar en R y las diferencias entre
#estos.


#Pregunta: ¿qué te pareció el entorno de Rstudio? https://www.menti.com/msx2bfp3m3

## **Conversar sobre los resultados**

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

summary(datadados) #tenemos mezclas de datos

class(datadados$nombres)
class(datadados$ndados)

datadados  #aqui ya empezamos a hablar de observaciones y variables (contexto de datos)

#Cada observación corresponde a una persona (fila)
#Las variables

