### Programación Clase 4: 12 de Mayo / Sección Johnson 

#Descripción de la clase: En esta clase ya estamos a un nivel más avanzado en manejo de funciones, conocemos
#R base y además nos estamos familiarizando con 'pipe' %>% y el lenguaje de tidyverse. Exploraremos dos
#paquetes bastante útiles: stringr (para manejo de texto/strings) y lubridate para manejo de fechas, 
#finalmente introduciremos el concepto de cruce de tablas y veremos los distintos tipos de cruces.


# Nuestro equipo:

# - Natalie Julian (najulian@mat.uc.cl)
# - Maite Vergara (Maite.vergara@uc.cl) 
# - Esteban Rucan (errucan@uc.cl)

#Recuerden que ya sabemos cómo crear carpetas en nuestro proyecto

dir.create("Clase 4")

#Y además, vamos a crear una carpeta adentro de la carpeta Clase 4, que se llame base de datos:

dir.create('Clase 4/Base de datos')

#En esta carpeta iremos dejando las bases de datos que vamos a utilizar el día de hoy :)

################################## ANTES DE EMPEZAR AL CLASE!!

#Preguntas:

#a) ¿Todos recibieron el mail que envié aclarando las dos dudas de la clase pasada?

#b) ¿Hay alguna duda de la clase pasada? Que hable ahora o calle para.... bueno para siempre no, la pueden
# consultar en cualquier momento :D pero si tienen alguna duda comenten no más

#c) Recuerdo que vale tuvo un problema para importar archivos la clase pasada, reinició R? reinstaló R? qué pasó?


################################## AHORA SÍ :D


# Repaso de funciones 

# Carguemos nuestra base viviendasRM

library(readxl)
viviendasRM <- read_excel("Clase 4/Bases de datos/viviendasRM.xlsx")
View(viviendasRM)

head(viviendasRM)

#¿qué paso sigue?......

# a) arreglar los nombres no?

library(janitor)

(viviendasRM<-viviendasRM%>%clean_names()) #nombres arregladossssss *0*

# b) Reemplazar los No de N°estacionamientos por 0

library(dplyr)

viviendasRM<-viviendasRM%>%
             mutate(n_estacionamientos=as.numeric(ifelse(n_estacionamientos=='No', 0, n_estacionamientos)))

viviendasRM %>% select(n_estacionamientos) #arregladisimo!!

viviendasRM %>% select(n_estacionamientos)%>%summary()

library(ggplot2)

#qué tipo de gráfico sería adecuado... para el n° de estacionamientos?? **DISCUSION**

ggplot(data=viviendasRM, aes(x=n_estacionamientos))+
  geom_bar()+ 
  ylab('Cantidad de Casas en Venta de RM')+ #nombre eje y
  xlab('Cantidad de estacionamientos') #nombre eje x


#Podemos enchular nuestro gráfico!!

ggplot(data=viviendasRM, aes(x=n_estacionamientos))+
  geom_bar(fill="orange", col='red')+  #listado de colores: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
  ylab('Cantidad de Casas en Venta de RM')+ #nombre eje y
  xlab('Cantidad de estacionamientos') + #nombre eje x
  scale_x_continuous(breaks = seq(0, max(viviendasRM$n_estacionamientos, na.rm=TRUE), by=1))+
  scale_y_continuous(breaks = seq(0, 600, by=100))+
  theme_minimal()+
  ggtitle('Cantidad de estacionamientos de casas en Venta en RM - 2022') #hermoso no? :D


# Podemos renombrar nuestras variables

viviendasRM<- viviendasRM %>%
  rename(sitioweb=link)  #A la variable llamada link le cambiamos el nombre a sitioweb


# Podemos filtrar
unique(viviendasRM$comuna) # con esto conocemos las comunas que tenemos en nuestra base de datos

viviendasRM%>%
  filter(comuna=='Cerro Navia'|comuna=='Lampa')


## y podriamos hacer el mismo grafico anterior, pero solo a estas comunas:

ggplot(data=viviendasRM%>%
         filter(comuna=='Cerro Navia'|comuna=='Lampa')
       , aes(x=n_estacionamientos))+
  geom_bar(fill="orange", col='red')+  #listado de colores: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
  ylab('Cantidad de Casas en Venta de RM')+ #nombre eje y
  xlab('Cantidad de estacionamientos') + #nombre eje x
  scale_x_continuous(breaks = seq(0, max(viviendasRM$n_estacionamientos, na.rm=TRUE), by=1))+
  scale_y_continuous(breaks = seq(0, 45, by=2))+
  theme_minimal()+
  ggtitle('Cantidad de estacionamientos de casas en Venta en RM - 2022') #hermoso no? :D


#Para hacer un grafico de porcentajes

ggplot(data=viviendasRM%>%
         filter(comuna=='Cerro Navia'|comuna=='Lampa')
       , aes(x=n_estacionamientos))+
  geom_bar(aes(y = (..count..)/sum(..count..)),fill="orange", col='red')+  #listado de colores: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
  ylab('Cantidad de Casas en Venta de RM')+ #nombre eje y
  xlab('Cantidad de estacionamientos') + #nombre eje x
  scale_x_continuous(breaks = seq(0, max(viviendasRM$n_estacionamientos, na.rm=TRUE), by=1))+
  scale_y_continuous(breaks = seq(0, 1, by=0.05))+
  theme_minimal()+
  ggtitle('Cantidad de estacionamientos de casas en Venta en RM - 2022') #hermoso no? :D



### :D yap, mucho de ggplot, debemos continuar!

#Slide 7: Otras operaciones


#Si queremos estadisticas por comuna...


viviendasRM%>%
  group_by(comuna)%>%
  summarise(prom_sup=mean(total_superficie_m2), 
                                           prom_nbanos=mean(n_banos),
                                           max_n_estacion=max(n_estacionamientos))

#Hay NA!!! omitamoslo en las estadisticas descriptivas

viviendasRM%>%
  group_by(comuna)%>%
  summarise(prom_sup=mean(total_superficie_m2, na.rm=TRUE), 
            prom_nbanos=mean(n_banos, na.rm=TRUE),
            max_n_estacion=max(n_estacionamientos, na.rm=TRUE))

#podemos ordenar por cierta variable...

viviendasRM%>%
  group_by(comuna)%>%
  summarise(prom_sup=mean(total_superficie_m2, na.rm=TRUE), 
            prom_nbanos=mean(n_banos, na.rm=TRUE),
            max_n_estacion=max(n_estacionamientos, na.rm=TRUE))%>%
            arrange(desc(prom_sup))


#si queremos conocer las 5 comunas con mayor promedio de metros cuadrados:

viviendasRM%>%
  group_by(comuna)%>%
  summarise(prom_sup=mean(total_superficie_m2, na.rm=TRUE), 
            prom_nbanos=mean(n_banos, na.rm=TRUE),
            max_n_estacion=max(n_estacionamientos, na.rm=TRUE))%>%
  arrange(desc(prom_sup))%>%
  slice(1:5)

#ultima función! Similar a ifelse, pero se suele usar para categorizar variables numericas o
#agrupar variables categóricas

viviendasRM%>%
  mutate(cat_banio=case_when(n_banos==0 ~'Sin banio',
            n_banos>0 && n_banos<3 ~'Entre 1 y 3 banios',
            TRUE ~ 'Otro caso'))

#Seleccionamos las columnas para ver:

viviendasRM%>%
  mutate(cat_banio=case_when(n_banos==0 ~'Sin banio',
                             n_banos>0 & n_banos<3 ~'Entre 1 y 3 banios',
                             TRUE ~ 'Otro caso')) %>%
  select(comuna, sitioweb, n_banos, cat_banio)

#Y ahora podriamos agrupar las comunas según categoria de baños y concoer cuántas casas hay por cada caso


viviendasRM%>%
  mutate(cat_banio=case_when(n_banos==0 ~'Sin banio',
                             n_banos>0 & n_banos<3 ~'Entre 1 y 3 banios',
                             TRUE ~ 'Otro caso')) %>%
  group_by(comuna, cat_banio)%>%
  count()%>%
  arrange(comuna, n)

#Espectacular no?  


##################### BIEN! AHORA PASAREMOS A LA ACTIVIDAD GUIADA, ESPERO PODER HACER DINÁMICA DE GRUPOS
##### 7-8 PERSONAS POR SALA, Y LOS AYUDANTES SE IRÁN MOVIENDO ENTRE LAS SALAS RESPONDIENDO DUDAS :D


#SOLUCIONARIO: no ver sin antes intentarlo >:c

#1.Cambie el nombre de la variable Quien_Vende por Vendedor.

viviendasRM<- viviendasRM %>%
  rename(vendedor=quien_vende) 


#3. Ordene la base de datos según la cantidad de baños y luego entregue la 
#información de las primeras diez viviendas.

viviendasRM%>%
  arrange(desc(n_banos))%>%
  slice(1:10)

#4. Agrupe la base según la cantidad de estacionamientos e 
#indique la cantidad de viviendas para cada grupo.

viviendasRM%>%
  group_by(n_banos)%>%
  count()

#5. Calcule la media de los valores en UF y en CLP usando dplyr.

viviendasRM%>%
  summarise(prom_uf=mean(valor_uf), prom_clp=mean(valor_clp))

#6. Genere una nueva variable que clasifique la cantidad de habitaciones 
#según la siguiente tabla:


viviendasRM%>%
  mutate(cat_banio=case_when(n_habitaciones<2 ~'pocas_hab',
                             n_habitaciones>=3 & n_habitaciones<=5 ~'varias_hab',
                             TRUE ~ 'muchas_hab'))

viviendasRM%>%
  mutate(cat_habit=case_when(n_habitaciones<2 ~'pocas_hab',
                             n_habitaciones>=3 & n_habitaciones<=5 ~'varias_hab',
                             TRUE ~ 'muchas_hab'))%>%
  select(n_habitaciones, cat_habit)

######################################### PREGUNTA SORPRESA

# Cree una nueva variable que contenga la superficie sin construir.

viviendasRM<- viviendasRM%>%
  mutate(sup_sin_cons=total_superficie_m2-superficie_construida_m2)

#arroja error D:

#Veamos la naturaleza de estas variables

viviendasRM%>%
  select(total_superficie_m2, superficie_construida_m2)%>%
  summary()

#La varuable superficie construida m2 esta en formato character T_T

#Veamos si hay algun valor extraño:

unique(viviendasRM$superficie_construida_m2)

#qué ocurre?????? 

#hay casos donde aparece 'ha' luego del numero! (se equivocaron en tipear seguramente)

#qué tendríamos que hacer para solucionarlo??????

#reemplazar todos los ha por NULL y luego setear el formato a numerico

## ACÁ PASAMOS AL PAQUETE STRINGR


library(stringr)

#con str_detect podemos determinar cuántos registros contienen 'ha'

str_detect(tolower(viviendasRM$superficie_construida_m2), 'ha')

sum(str_detect(tolower(viviendasRM$superficie_construida_m2), 'ha'), na.rm=TRUE) #solo hay 1 caso

#con str_remove() podemos eliminar estos pedazos 'ha' que aparecen:


str_remove(tolower(viviendasRM$superficie_construida_m2), 'ha')

#ahora aplicamos formato numerico...

as.numeric(str_remove(tolower(viviendasRM$superficie_construida_m2), 'ha'))

# AHORA. esto solo sirve cuando hay 'ha', si queremos eliminar cualquier texto que aparezca, 
#podemos usar...

str_remove_all(tolower(viviendasRM$superficie_construida_m2), '[:alpha:]')

## aqui hay mas patrones: https://stringr.tidyverse.org/articles/regular-expressions.html



#y ahora.... nos toca reemplazar esta variable!

viviendasRM<-viviendasRM%>%
                        mutate(superficie_construida_m2=as.numeric(str_remove(tolower(superficie_construida_m2),  '[:alpha:]')))

#y ahora si podemos calcular la variable

viviendasRM<-viviendasRM%>%
  mutate(sup_sin_cons=total_superficie_m2-superficie_construida_m2)

viviendasRM$sup_sin_cons

#ready :)

####################### EN QUÉ MÁS PODEMOS USAR STR??

#por ejemplo, para cambiar los nombres de una base de datos

names(viviendasRM)

#supongamos que n_habitaciones queremos que diga num_habitaciones....

str_replace(names(viviendasRM), 'n', 'num')

#Qué pasa???

#Puchaaaaa remplaza todas las n!

str_replace(names(viviendasRM), '^[n_]', 'num') #taraaaaaaaa :)

#solo falta caambiar los nombres


names(viviendasRM)<- str_replace(names(viviendasRM), '^[n_]', 'num') 

head(viviendasRM) #tamos ready :)

#si lo queremos al final...

str_replace(names(viviendasRM), '[a]$', 'num') 


#si lo queremos al final... y con una palabra

str_replace(names(viviendasRM), 'vivienda$', 'num') 


### y asi... muchos patrones! toca googlear para encontrar mas!


########################## FECHAS

as.Date("1982-01-13")
as.Date("Jan-13-82", format = "%b-%d-%y")
as.Date("13 January, 1982", format = "%d %B, %Y")


#paquete lubridate!!

fecha <- "1995-04-09" #chr
fecha <- as.Date(fecha) #date

library(lubridate)

year(fecha);month(fecha);day(fecha)


fechas <- c("95-04-09", "87-12-03", "89-09-09")
parse_date_time(fechas, "ymd")
parse_date_time(fechas, "y m d")
parse_date_time(fechas, "%y%m%d")


#parse time: si me doy cuenta de que la fecha viene con dos o  mas formatos diferentes:

fechas <- c("1995-04-09", "09091989", "03-04-1987")
fechas <- parse_date_time(fechas, c("dmy", "ymd"))

fechas

day(fechas)

#Graficos de fechas

var<-c(1, 10, 15)

data<-data.frame(var, fechas)

ggplot(data, aes(x=fechas, y=var)) +
  geom_line( color="steelblue")

ggplot(data, aes(x=fechas, y=var)) +
  geom_line( color="steelblue") + 
  geom_point() #le agrego los puntitos

ggplot(data, aes(x=fechas, y=var)) +
  geom_line( color="steelblue") + 
  geom_point() + #le agrego los puntitos
  theme_minimal() #agrego un tema
  

#aqui mas ejemplos: https://r-graph-gallery.com/279-plotting-time-series-with-ggplot2.html


####################### CRUCES de tablas CON DPLYR

load(file = "Clase 4/Bases de datos/nombres1.RData")
load(file = "Clase 4/Bases de datos/nombres2.RData")

#para hacer un poco más entretenido el ejercicio, vamos a usar algunos nombres de las bases:

(nombresv1<-nombres1%>% slice(3:10))
(nombresv2<-nombres2%>% slice(1:7))


# INNER JOIN: va a tomar todos los registros que están en A y B, simultáneamente

dim(nombresv1)
dim(nombresv2)

# cuando hacemos un INNER: la dimensión resultante es a lo más la dimensión más pequeña 
#entre las dos bases

inner_join(nombresv1, nombresv2) #reconoce automáticamente que debe cruzar por nombre :D


# LEFT JOIN: probablemente el más usado :) denominado cruce por la izquierda

# A la base A, se le va a complementar con la información de la base B

left_join(nombresv1, nombresv2) 

#al hacer un left join, la dimensión resultante es igual a la de la primera base
#los casos que no encuentra en la base B, quedan con NA


# RIGHT JOIN: lo mismo pero desde la base B

right_join(nombresv1, nombresv2) 


#FULL JOIN:

#como su nombre indica, es el universo completo! considerará todos los registros de A o B

full_join(nombresv1, nombresv2) 


#su dimensión máxima será la dimensión de A + dimensión de B (en caso de que ningun registro cruce)


#ACTIVIDAD!


############################### SOLUCIONARIO 
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
#############################################NO VER#################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
#############################################NO VER#################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
#############################################SOLO VER SI SE INTENTÓ HACER ##########################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################



#1. Cargue las bases de datos en R

load(file = "Clase 4/Bases de datos/chart_chile.RData")
load(file = "Clase 4/Bases de datos/chart_arg.RData")


#2. Vea si es necesario limpiar los nombres de las variables.

head(base_chile)

names(base_chile)


head(base_argentina)

names(base_argentina)

#3. Reemplace los espacios en blanco de artist y title por guión bajo "_".

base_chile<- base_chile%>%
                      mutate(artist=str_replace(artist, ' ', '_'),
                             title=str_replace(title, ' ', '_'))

base_argentina<- base_argentina%>%
  mutate(artist=str_replace(artist, ' ', '_'),
         title=str_replace(title, ' ', '_'))

#4. Pase la variable date a formato date.


base_argentina<- base_argentina%>%
  mutate(date=as.Date(date))

base_chile<- base_chile%>%
  mutate(date=as.Date(date))


#5. Cree una nueva variable que contenga el día del año al que corresponde date, 
#y otra que contenga el año del Ranking.


base_argentina<- base_argentina%>%
  mutate(dayofyear=yday(date), year=year(date))

base_chile<- base_chile%>%
  mutate(dayofyear=yday(date), year=year(date))

head(base_argentina)
head(base_chile)

#6. Encuentre el día del año al que correspondió su cumpleaños el 2021.

cumple <- as.Date("2021-04-25")
yday(cumple)


#7. Separe para cada base el TOP 50 del día de su cumpleaños del año 2021 
#usando las variables creadas en 5.


base_argentina<- base_argentina %>%
  filter(dayofyear==yday(cumple), year==2021)

head(base_argentina)

base_chile<- base_chile %>%
  filter(dayofyear==yday(cumple), year==2021)

head(base_chile)

#8. Si quisieramos realizar entrecruzamientos entre las dos bases creadas. ¿Qué variable nos serviría?


#Depende...... de qué queremos?

#Si queremos conocer el raking 1 en argentina y chile, cruzariamos por ranking:

left_join(base_chile, base_argentina, by='rank', suffix=c('.chile', '.argentina'))

head(left_join(base_chile, base_argentina, by='rank', suffix=c('.chile', '.argentina')))


#Si queremos, saber el ranking que tuvo cada título en ambos paises, cruzamos por título

left_join(base_chile, base_argentina, by='title', suffix=c('.chile', '.argentina'))

head(left_join(base_chile, base_argentina, by='title', suffix=c('.chile', '.argentina')))


#y así... dependerá de lo que queramos


#9. Con las dos bases y la variable detectada, genere los entrecruzamientos vistos en clases y analice:

#inner join.
#left join.
#right join.
#full join.


# esta sí queda de tarea :) es ver los cambios con cada cruce, tal como hicimos en clases.

