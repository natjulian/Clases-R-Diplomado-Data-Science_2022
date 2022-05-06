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
summary(robos)

?openxlsx::read.xlsx


## base 3.)

install.packages('rio')

library(rio)


data_list<-import_list("C:/Users/Naty/Downloads/ocupacion.xlsx")

data_list$Antofagasta

data_list$Aysén

clean_names(data_list) #no funciona T_T todo se derrumbó :'(


data.frame('Tarapacá', data_list$Tarapacá) #se podria hacer un for y recorrer todos los elemtnso de la lista :)

#### TIDYVERSE

install.packages('tidyverse')

library(tidyverse)

funcion3(funcion2(clean_names(empresas)))

empresas %>% 
  clean_names() %>%
  filter(ano_comercial==2019)


empresas_nuevo%>%
  clean_names()%>%
  filter(ano_comercial==2019)%>%
  summarize(mean(ano_comercial), 
            min(ano_comercial), 
            max(ano_comercial), 
            median(ano_comercial))


empresas%>%
  clean_names()%>%
  select(actividad_economica)%>%
  slice(1:10)

empresas %>%
  clean_names()%>%
  filter(tramo_segun_ventas_5_tramos=='Micro')%>%
  summarise(mean(numero_de_empresas))


empresas %>%
  clean_names()%>%
  group_by(tramo_segun_ventas_5_tramos)%>%
  summarise(mean(numero_de_empresas), mean(numero_de_trabajadores_dependientes_informados))%>%
  arrange(desc(tramo_segun_ventas_5_tramos))

empresas %>%
  clean_names()%>%
  mutate(venta_clp=ventas_anuales_en_uf*32227)%>%
  select(venta_clp)

options(scipen=999) ########## BUSCAR COMO CAMBIAR NOTACION CIENTIFICA tarea para mi

empresas2<-empresas %>%
  clean_names()%>%
  mutate(venta_clp=ventas_anuales_en_uf*32227)%>%
  select(venta_clp)

empresas3<-empresas %>%
  clean_names()%>%
  mutate(venta_clp=ventas_anuales_en_uf*32227)


############################# actividad

#1. 

library(readxl)
viviendasRM <- read_excel("C:/Users/Naty/Downloads/viviendasRM.xlsx")
View(viviendasRM)


#2. 


viviendasRM

viviendasRM<-viviendasRM %>% clean_names()

names(viviendasRM)


#3.

#a)

viviendasRM %>% slice(4)

#b) 

viviendasRM %>% slice(8) %>% select(n_banos)

#c)

viviendasRM %>% slice(14) %>% select(n_estacionamientos)


viviendasRM$n_estacionamientos[viviendasRM$n_estacionamientos=='No']<-0


viviendasRM %>% slice(14) %>% select(n_estacionamientos)


viviendasRM$n_estacionamientos<-as.numeric(viviendasRM$n_estacionamientos)


viviendasRM %>% slice(14) %>% select(n_estacionamientos)


#d) 

viviendasRM %>% slice(5:10) %>% select(total_superficie_m2, valor_uf)

#e)

viviendasRM%>%filter(total_superficie_m2==100)%>%
  select(total_superficie_m2, corredor, valor_uf)%>%
  summarise(mean(valor_uf), min(valor_uf), median(valor_uf), max(valor_uf))

