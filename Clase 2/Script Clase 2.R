# Script Clase 2

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

vectorlogic<-c(TRUE, FALSE, FALSE, TRUE)

as.numeric(vectorlogic)

sum(vectorlogic)

vector5[vector5>0]

# Funciones para generar vectores

1:10

-100:100

1:10000

seq(-0.5, 3, 0.05) #by: salto entre los numeros

seq(-3, 7, length.out=10) 

?seq

#### Repeticion

rep(4, 100)

rep(c(2,10), 5) #se repite 5 veces el vector

rep(c(1,19,20), each=4) #se repite cada 4 veces cada elemento


## DESAFIO!!

# supongamos que queremos hacer un vector que diga:

# variable 1, hora 1, resultado 1, variable 2, hora 2, resultado 2, variable 3, hora 3, resultado 3

# variable 6, hora 6, resultado 6

#ideas?



