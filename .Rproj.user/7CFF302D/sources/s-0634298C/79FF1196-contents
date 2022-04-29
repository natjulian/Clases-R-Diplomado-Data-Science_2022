# Script Clase 2 - 28 de Abril, sección Johnson

vector1<-c(2,4,5)

vector1

vector2<-c(1/2, 5, 10)

vector2

vector3<-c('Ignacio', 'Javiera', 'Maite', 'Esteban')

vector3

class(vector1)
class(vector2)
class(vector3)


vector1[1]
vector1[0]
vector1[3]

length(vector3)



vector4<-c(-3, -6, 0.5)

vector5<-c('-3', '-6', '0.5')

class(vector4)
class(vector5)

min(vector5)
min(vector4) #minimo real


vector5<-as.numeric(vector5)

class(vector5)


class(1:10)

mean(c('-3', '-6', '0.5'))


vector5[1:4]

vector5[c(1,2,3,4)]

vector5[c(1,3)]

tail(vector5, 2) #los ultimos n elementos de tu vector
head(vector5, 3) #los primeros n elementos de tu vector


suspenso<-c(1, 'dos', 3) # no se aceptan mezclas

class(suspenso)

vectorlogic<-c(TRUE, FALSE, FALSE, TRUE) #vector de valores logicos

as.numeric(vectorlogic) #TRUE es 1, y FALSE es 0, en R (binario)

sum(vectorlogic)

vector5[vector5>0] #extraigo elementos con determinada condicion (que sean mayores a cero)

# Funciones para generar vectores

1:10 #secuencia del 1 al 10 simple

-100:100

1:10000

seq(-0.5, 3, 0.05) #by: salto entre los numeros

seq(-3, 7, length.out=10)  #vector de largo 10

?seq

#### Repeticion

rep(4, 100)

rep(c(2,10), 5) #se repite 5 veces el vector

rep(c(1,19,20), each=4) #se repite cada 4 veces cada elemento


########################### DESAFIO!!

# supongamos que queremos hacer un vector que diga:

# variable 1, hora 1, resultado 1, variable 2, hora 2, resultado 2, variable 3, hora 3, resultado 3

# variable 6, hora 6, resultado 6

#ideas?

rep(c('variable', 'hora', 'resultado'), 6)

rep(1:6, each=3)

paste(rep(c('variable', 'hora', 'resultado'), 6), rep(1:6, each=3)) #Lo hicimos!! Síi!

# funciones para vectores de texto

letters  #vector de letras minusculas

LETTERS #vector de letras en mayuscula

tolower(LETTERS)  #tolower: transforma a minúscula las letras

toupper(letters)  #toupper: transforma a mayúscula las letras

###funciones genericas

length(LETTERS)

is.vector(LETTERS)

a<-1   #Si defino un numero, este es un vector?

is.vector(a) #Para R sí! :D vector de largo 1

### Extraer elementos de los vectores

LETTERS[seq(1, 10, by=2)]  #Extrae elementos del 1 al 10 con saltos de 2

LETTERS[seq(20, 25)]

sample(1:10000, 100) #SELECCIONA ALEATORIAMENTE 100

tail(LETTERS, 5)  #printea los ultimos 5 elementos del vector LETTERS
head(LETTERS, 10) #printea los primeros 10 elementos del vector LETTERS


# CORCHETES REDONDOS (): CUANDO QUEREMOS APLICAR FUNCIONES
# CORECHETES CUADRADOS []: CUANOD QUEREMOS EXTRAER DIRECTAMENTE ELEMENTOS DE UN OBJETO

# MATRICES

matrix(1:9, ncol=2)


matrix(letters[1:9],ncol=3)

is.vector(matrix(letters[1:9],ncol=3))

is.matrix(1:9) #Pregunta si es una matriz

matriz1<-matrix(1:10, ncol=5)

dim(matriz1) #cantidad filas, cantidad columnas


matrix(letters[1:9],ncol=3, byrow=TRUE) # byrow=TRUE: llena por fila


colnames(matriz1) <-c('col 1', 'col 2', 'col 3', 'col 4', 'col 5')
#rownames()


nombres<-c('Ignacio', 'Gabriela', 'Maite', 'Giselle')

ndados<-c(3, 0, 1, 6)

(Matriz<-cbind(nombres, ndados))

Matriz[1 , 1] #elemento primera fila primera columna

Matriz[, 1] #primera columna

Matriz[4, ] #Cuarta fila

Matriz[c(1,3), ] #fila 1 y 3

Matriz[, 1:2] #primera y segunda columna

Matriz[c(1,3), 1]


# Dataframe

mtcars

class(mtcars)

DF_1<-data.frame(nombres, ndados) #creamos dataframe pero con los vectores previamente definidos

class(DF_1$ndados)
class(DF_1$nombres)

str(DF_1)

summary(DF_1)


#ejemplo: tambien podemos indicar adentro del dataframe los vectores!

tabla <- data.frame(   
  nombre = c("Andrea","Bastian","Camilo","Daniela"),
  grupo_s = c("AB", "0", "A", "B"),
  altura_cm = c(165, 180, 158, 170)
)

names(tabla)


tabla[1, 2] #extrae elemento de la fila 1, 2da columna


vect1<-c(2, 3, 4)
vect2<-c(10, 3, 7)

rbind(vect1, vect2) #lo agrega por fila :D


tabla[5, ]<-c(2, 3, 4) #Concatena debajo de la dataframe estos objetos

#ahora, hay funciones mejores para hacer esto, o tambien se podria usar un for(), ver mas adelante :)

#Se pueden extraer variables/columnas de las siguientes formas:

tabla$nombre
tabla[,1]
tabla [['nombre']] #<- esta es la menos usual, al menos en dataframes.


### TIBBLES



