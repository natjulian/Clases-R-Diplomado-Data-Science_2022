#Script en Vivo - Clase 4 - 12 de Mayo - Sección Johnson

# Nuestro equipo:

# - Natalie Julian (najulian@mat.uc.cl)
# - Maite Vergara (Maite.vergara@uc.cl) 
# - Esteban Rucan (errucan@uc.cl)

library(readxl)
library(tidyverse)
library(janitor)

viviendasRM <- read_excel("Clase 4/Bases de datos/viviendasRM.xlsx")
View(viviendasRM)

head(viviendasRM)

## que era lo primero que haciamos al cargar una base de datos........

names(viviendasRM)

viviendasRM<- viviendasRM %>% clean_names()

names(viviendasRM) #ahora sí :)

## revisar formato de las variables

summary(viviendasRM)

viviendasRM%>%
  select(n_estacionamientos)

unique(viviendasRM$n_estacionamientos)

# cambiar los No por cero

viviendasRM<-viviendasRM%>% 
  mutate(n_estacionamientos=ifelse(tolower(n_estacionamientos)=='no',0, n_estacionamientos))


viviendasRM%>%
  select(n_estacionamientos)

viviendasRM<-viviendasRM%>%
                  mutate(n_estacionamientos=as.numeric(n_estacionamientos))

viviendasRM%>%
  select(n_estacionamientos)


viviendasRM<-viviendasRM%>% 
  mutate(n_estacionamientos=as.numeric(ifelse(tolower(n_estacionamientos)=='no',0, n_estacionamientos)))

viviendasRM%>%
  select(n_estacionamientos)%>%
  summarise(mean(n_estacionamientos, na.rm=TRUE), min(n_estacionamientos, na.rm = TRUE))

##### GRAFICOS

##a) qué tipo de gráfico poodemos usar para el n_estacionamientos: graficos barras


tablafrq<-viviendasRM%>%group_by(n_estacionamientos)%>%count()

maxconteo<-max(tablafrq$n)

ggplot(data=viviendasRM, aes(x=n_estacionamientos))+
  geom_bar(fill='orange')+
  theme_classic()+
  ylab('Cantidad de Casas en venta en la Región Metropolitana')+
  xlab('Número de estacionamientos')+
  scale_x_continuous(breaks=seq(min(viviendasRM$n_estacionamientos, na.rm=TRUE),  
                                max(viviendasRM$n_estacionamientos, na.rm=TRUE), by=1))+
  scale_y_continuous(breaks=seq(0, maxconteo, by=100))+
  ggtitle('Cantidad  de casas en venta en RM según \nNúmero de Estacionamiento')+ ## añadir un salto 
  labs(subtitle = 'Fuente: Google')

#podemos cambiar nombre de una variable

viviendasRM<-viviendasRM%>%
  rename(sitioweb=link)

names(viviendasRM)  

#podemos filtrar

unique(viviendasRM$comuna)

viviendasRM%>%
  filter(comuna == 'San Joaquín'| comuna=='Maipú')


tablafrq2<-viviendasRM%>% filter(comuna == 'San Joaquín'| comuna=='Maipú') %>%
  group_by(n_estacionamientos)%>%count()

maxconteo2<-max(tablafrq2$n)


ggplot(data=viviendasRM%>%
         filter(comuna == 'San Joaquín'| comuna=='Maipú'), aes(x=n_estacionamientos))+
  geom_bar(fill='darkblue')+
  theme_classic()+
  ylab('Cantidad de Casas en venta en la Región Metropolitana')+
  xlab('Número de estacionamientos')+
  scale_x_continuous(breaks=seq(min(viviendasRM$n_estacionamientos, na.rm=TRUE),  
                                max(viviendasRM$n_estacionamientos, na.rm=TRUE), by=1))+
  scale_y_continuous(breaks=seq(0, maxconteo2, by=2))+
  ggtitle('Cantidad  de casas en venta en RM según \nNúmero de Estacionamiento comunas San Joaquín y Maipú')+ ## añadir un salto 
  labs(subtitle = 'Fuente: Google')


viviendasRM%>% filter(comuna == 'San Joaquín'| comuna=='Maipú') %>%
  group_by(n_estacionamientos)%>% summarise(n=n()) %>%
  arrange(n)

viviendasRM%>%
  group_by(comuna)%>%
  summarise(prom_sup=mean(total_superficie_m2, na.rm=TRUE),
            max_estacionamiento=max(n_estacionamientos, na.rm = TRUE))%>%
  arrange(max_estacionamiento)%>%
  slice(1:5)


viviendasRM<- viviendasRM%>%
  mutate(cat_banios=case_when(n_banos==0 ~ 'Sin banio',
                              n_banos>0 & n_banos<3 ~ 'Entre 1 y 2 banios',
                              n_banos>=3 & n_banos<7 ~ 'Entre 3 y 6 banios',
                              TRUE ~ 'Otro caso'))


View(viviendasRM%>%
  group_by(comuna, cat_banios)%>%
  count())


#################### ACTIVIDAD EN GRUPOS =D

########################## SERÁN SEPARADOS EN GRUPOS, Y DEBEN PONERSE DE ACUERDO CON QUIÉN
######## DE USTEDES VA A PROYECTAR SU R Y AVANZAR EN LAS 6 PREGUNTILLAS DE LA ACTIVIDAD
######## TENDRÁN UNOS 15 MINUTOS PARA TERMINAR LA ACTIVIDAD Y SEGUIREMOS CON LA CLASE :D

######## DINÁMICA DE GRUPOS: DE 20.15 A 20.30

#1. Cambie el nombre de la variable Quien_Vende por Vendedor.
#2. Ordene la base de datos según la cantidad de baños y luego entregue la información de las primeras diez viviendas.
#3. Agrupe la base según la cantidad de estacionamientos e indique la cantidad de viviendas para cada grupo.
#4. Calcule la media de los valores en UF y en CLP usando dplyr.
#5. Genere una nueva variable que clasifique la cantidad de habitaciones de 2 o menos (pocas_hab), de 3 a 5 (varias_hab) y de 6 o más (muchas_hab)
#6. Cree una nueva variable que contenga la superficie sin construir. ¿qué ocurre?


viviendasRM<-viviendasRM%>%
                mutate(sup_sin_con=total_superficie_m2-superficie_construida_m2)

viviendasRM%>%
  select(total_superficie_m2, superficie_construida_m2)

unique(viviendasRM$superficie_construida_m2)

str_detect(viviendasRM$superficie_construida_m2, 'ha')

sum(str_detect(viviendasRM$superficie_construida_m2, 'ha'), na.rm=TRUE)

########### como determinar si r encuentra texto en mi vector

str_remove_all(viviendasRM$superficie_construida_m2, '[:alpha:]')

str_remove_all(viviendasRM$comuna, '[:alpha:]')


############# redefinir la variable superficie construida

viviendasRM<-viviendasRM%>%
                mutate(superficie_construida_m2=as.numeric(str_remove_all(viviendasRM$superficie_construida_m2, '[:alpha:]')))


summary(viviendasRM)



#creamos la variable pedida


viviendasRM<-viviendasRM%>%
  mutate(sup_sin_con=total_superficie_m2-superficie_construida_m2)

viviendasRM%>%
  select(sup_sin_con)


viviendasRM$comuna[str_detect(viviendasRM$comuna, '[:alpha:]')]


ejemplos<-c(123, 'holi', '12 q tal', 90)


str_detect(ejemplos, '[:alpha:]')


unique(ejemplos[str_detect(ejemplos, '[:alpha:]')])



names(viviendasRM)

str_replace_all(names(viviendasRM), 'n', 'num') #mal :(


str_replace_all(names(viviendasRM), '^[n]', 'num')


str_replace_all(names(viviendasRM), '[a]$', 'holi')



############# Manejo de fechas


as.Date("1982-01-13")
as.Date("Jan-13-82", format = "%b-%d-%y")
as.Date("13 January, 1982", format = "%d %B, %Y")

library(lubridate)

fecha<-c("2022-05-10", "2020-10-4", "2019-03-03")

fecha<-as.Date(fecha)

year(fecha)

month(fecha)

day(fecha)

wday(fecha)


fechas <- c("95-04-09", "87-12-03", "89-09-09")
parse_date_time(fechas, "ymd")
parse_date_time(fechas, "y m d")
parse_date_time(fechas, "%y%m%d")


fechas <- c("1995-04-09", "09091989", "03-04-1987")
fechas <- parse_date_time(fechas, c("dmy", "ymd"))

fechas

var<-c(1,10,15)

data<-data.frame(fechas, var)

ggplot(data, aes(x=fechas, y=var))+
  geom_line()+
  geom_point()+
  theme_minimal()


#cruce de bases de datos

#highcharter

load('Clase 4/Bases de datos/nombres1.RData')

load('Clase 4/Bases de datos/nombres2.RData')


(nombresv1<-nombres1%>%slice(3:10))
(nombresv2<-nombres2%>%slice(1:7))


dim(nombresv1) #8
dim(nombresv2) #7

inner_join(nombresv1, nombresv2, by='nombre')

#la dimension en un inner join será de a lo más la minima dimension entre A y B

#left join

left_join(nombresv1, nombresv2, by='nombre')

#se queda con la misma dimension de la base A (nombresv1)

#full join

#right join

right_join(nombresv1, nombresv2, by='nombre')

#se queda con la misma dimensión de la base B(nombresv2)

#full join
