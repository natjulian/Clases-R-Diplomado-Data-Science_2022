### Clase 3 - 5 de Mayo - Script 

##2) cómo puedo agregarle el cero al principio a un vector

1:10-1

0:10

c(0, 1:10)

##3) ¿cuál es la diferencia entre [1] y [[1]]? en un dataframe


mtcars

class(mtcars)

mtcars[,1] #1era columna

mtcars$mpg

mtcars[1,]

mtcars[1] #subdataframe que contiene la columna 1

mtcars[[1]] #esto te extrae el primer vector (primera columna


## 4) el modelo del auto no es un variable, cómo puedo usarla para filtrar

rownames(mtcars) #acá extraigo los nombres de los modelos de los autos

mtcars.arreglada<-data.frame(nombre=rownames(mtcars), mtcars)

rownames(mtcars.arreglada)<-NULL

mtcars.arreglada$nombre

#Opción 1:

mtcars.arreglada$nombre %in% c('Mazda RX4 Wag')

mtcars.arreglada[mtcars.arreglada$nombre %in% c('Mazda RX4 Wag'),]


mtcars.arreglada$nombre %in% c('Mazda RX4 Wag','Volvo 142E')

mtcars.arreglada[mtcars.arreglada$nombre %in% c('Mazda RX4 Wag','Volvo 142E'),]

## como podemos filtrar modelos de auto que contengan por ejemplo toyota

grepl('toyota', mtcars.arreglada$nombre)


grepl('toyota', tolower(mtcars.arreglada$nombre))

mtcars.arreglada[grepl('toyota', tolower(mtcars.arreglada$nombre)), ]

#stringr <- trabajar con strings


mtcars.arreglada[1,] #extraigo el registro 1 completo

mtcars.arreglada[,2] #extraigo la columna 2 completa


#toyota , Toyota, TOyota, TOYOTA (caso feo :C pero lo resolvemos con tolower)


vector_na<-





