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


vector_na<-c(10, 20, NA, 50, -1, -10)


# opcion 1

mean(vector_na, na.rm=TRUE)

mean(vector_na) #error


vector_na<-c(10, 20, NA, 50, -1, -10)
vector_na2<-c(4, 10, 20, 60, NA, 20)

data<-data.frame(vector_na, vector_na2)

mean(data$vector_na2, na.rm=TRUE)

summary(data)


vector_nombres<-c('Natalie', 'Pablo', 'Giselle', 'MAite')
vector_letras<-c('A', 'b', 'C', 'F')


data_texto<-data.frame(vector_nombres, vector_letras)

tolower(data_texto) ###### BUSCAR FUNCION PARA HACER MINUSCULA TODA LA BASE: BUSCARLO!!!


data_texto<-data.frame(tolower(vector_nombres), tolower(vector_letras))


1:10  >=5

1:10 ==5


### IMPORTAR BASES DE DATOS 

### base 1

library(readxl)
empresas <- read_excel("C:/Users/Naty/Downloads/202010_PUB_TRAM5_ACT.xlsx", 
                       sheet = "Datos", na = "*", skip = 4)
View(empresas)

names(empresas)

nombres_originales<-names(empresas)


empresas$`Número de trabajadores dependientes de género masculino informados` #nombres feos :c

install.packages('janitor') #instalar el paquete janitor

library(janitor)

empresas<-clean_names(empresas)

View(empresas)

empresas$numero_de_trabajadores_dependientes_informados

## base 2.) 

install.packages('openxlsx')

library(openxlsx)
?openxlsx::read.xlsx

robos<-openxlsx::read.xlsx("C:/Users/Naty/Downloads/robos.xlsx", 
                           fillMergedCells=TRUE, na.strings = 'Sin Información')


?openxlsx::read.xlsx
