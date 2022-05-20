#Script en Vivo - Clase 5 - 19 de Mayo - Sección Johnson

# Nuestro equipo:

# - Natalie Julian (najulian@mat.uc.cl)
# - Maite Vergara (Maite.vergara@uc.cl) 
# - Esteban Rucan (errucan@uc.cl)


############################### ÚLTIMA CLASE :( 

library(tidyverse)
library(lubridate)
library(ggplot2)



# Actividad propuesta semana pasada -> Resolver con guía de los alumnos

# 1) Cargue las bases de datos en R.

load("Clase 4/Bases de datos/chart_chile.RData")
load("Clase 4/Bases de datos/chart_arg.RData")

View(base_argentina)

View(base_chile)


# 2) Vea si es necesario limpiar los nombres de las variables.


names(base_argentina)

names(base_chile)

base_argentina

base_chile


base_chile<-base_chile %>% as_tibble()

base_chile

str(base_chile)

glimpse(base_chile)

base_argentina<-base_argentina %>% as_tibble() 



# 3) Reemplace los espacios en blanco de artist y title por guión bajo "_".

base_chile <- base_chile %>% 
  mutate(artist=str_replace_all(artist, ' ', '_'),
         title=str_replace_all(title, ' ', '_'))


sum(str_detect(base_chile$title, ' '))
sum(str_detect(base_chile$artist, ' '))

base_chile %>%view()

base_argentina <- base_argentina %>% 
  mutate(artist=str_replace_all(artist, ' ', '_'),
         title=str_replace_all(title, ' ', '_'))

sum(str_detect(base_argentina$title, ' '))

sum(str_detect(base_argentina$artist, ' '))

sum(str_detect(base_argentina$title, ' ')|str_detect(base_argentina$artist, ' '))


##### FORMA 2) PERO INEFICIENTE :(

base_chile$title <- base_chile$title%>% 
  janitor::make_clean_names()


#### FORMA 3)

base_argentina$artist <- str_replace_all(base_argentina$artist, "[:space:]", "_")
base_chile$artist <- str_replace_all(base_chile$artist, "[:space:]", "_")


## en str_replace_all solo funcionan vectores ;C

str_replace_all(class(base_argentina['artist']))


# 4) Pase la variable date a formato date.

str(base_argentina)

str(base_chile)


View(base_argentina)


head(base_argentina$date, 10)

tail(base_argentina$date, 10)

head(base_chile$date, 10)

tail(base_chile$date, 10)

unique(base_chile$date)

#Forma 1:

base_argentina$date <- as.Date(base_argentina$date)

str(base_argentina)
  
base_chile$date <- as.Date(base_chile$date)


#Forma 2:

base_argentina <- base_argentina %>% 
  mutate(date = as.Date(date, format("%Y-%m-%d"))) 

str(base_argentina)

base_chile <- base_chile %>% 
  mutate(date = as.Date(date, format("%Y-%m-%d")))

str(base_chile)


# tambien se puede usar parse date time :) 
# parse_date_time(fechas, "ymd")


numero<-'1,3354'

numero<-str_replace(numero, ',', '.')

numero

numero<-as.numeric(numero)

numero

class(numero)

#dplyr
numero<-numero %>%
            mutate(var=as.numeric(str_replace(var, ",", ".")))



# 5) Cree una nueva variable que contenga el día del año al que corresponde date,
#y otra que contenga el año del Ranking.

base_chile <- base_chile %>% 
  mutate(dia_anio=yday(date), anio=year(date))

base_argentina <- base_argentina %>% 
  mutate(dia_anio=yday(date), anio=year(date))

#forma 2

(base_chile2 <- base_chile %>%
    mutate(dia=day(date), anio=year(date)) %>%
    select('date', 'dia', 'anio') %>% 
    group_by(date,dia))


# 6) Encuentre el día del año al que correspondió su cumpleaños el 2021.

cumple<-as.Date("2021-04-25")

yday(cumple)
year(cumple)
day(cumple)
month(cumple)
wday(cumple)

diassemanas<-c('Domingo','Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado')

diassemanas[wday(cumple)]

# 7) Separe para cada base el TOP 50 del día de su cumpleaños del año 2021 
#usando las variables creadas en 5.

base_argentina_c<-base_argentina %>%
                  filter(dia_anio==yday(cumple), anio==year(cumple)) 


base_chile_c<-base_chile %>%
  filter(dia_anio==yday(cumple), anio==year(cumple))

nrow(base_argentina_c); nrow(base_argentina_c)


base_argentin %>%
  arrange(rank) %>% 
  slice(1:50) %>%
  select(title)

# 8) Si quisieramos realizar entrecruzamientos entre las dos bases 
#creadas. ¿Qué variable nos serviría?

base_argentina_c

base_chile_c


#ranking: para saber el ranking n-n en chile y argentina y compararlos :)


View(full_join(base_argentina_c, base_chile_c, by='rank', suffix=c('.argentina', '.chile')))


cruce<-full_join(base_argentina_c, base_chile_c, by=c('rank'), suffix=c('.argentina', '.chile')) %>%
          select(rank, date.argentina, title.argentina, artist.argentina, title.chile, artist.chile)

View(cruce)


#########OTRA OPCION....


cruce <- base_argentina_c %>%
            full_join(., base_chile_c, by='rank', suffix=c('.argentina', '.chile')) 




# 9) 9. Con las dos bases y la variable detectada, genere los 
#entrecruzamientos vistos en clases y analice:

#inner join.
#left join.
#right join.
#full join.


### MÁS DUDAS? :3

#################################################### COMENZÓ EL TALLER! :D

## DINÁMICA DE GRUPOS DE 9 PERSONAS :D

# 1. Remueva las columnas y filas que solo contengan datos perdidos. 
#Y en el caso de la base detalle_tipologia elimine la primera columna que solo sirve de id.

#Hint: Puede servirle remove_empty de la librería janitor.


# 2. Seleccionar las siguientes variables renombrándolas como se señala
#(excluya el resto de variables):

#name: proyecto
#type: tipo
#region: region
#owner: empresa
#typology: cod_tipologia
#investment: inversion
#entry_date: fecha_entrada
#state: estado
#qualification_date: fecha_calificacion
#Hint: La función select de la librería dplyr le permite renombrar las variables al seleccionarlas.




# 3. Confirme que todas las variables están en el formato correcto.

#Hint: Revise los distintos formatos ocupando funciones como str o glimpse. 
#Tenga especial cuidado con los distintos formatos que puede contener 
#la variable fecha. Vea consistencia en las regiones.



# 4.  Genere una nueva variable a partir de estado que se llame estado_cat y 
#que categorice según la siguiente tabla:


#En admision ó En calificación ==> En proceso
# Aprobado ==> Aprobado
# Rechazado ==> Rechazado
# Abandonado ó Caducado ó Desistido ó Ingresados ó No Admitido a Tramitación ó 
# No calificado ó Revocado => Otro


# 5. ¿En qué estado se encuentran los proyectos ingresados el año 2015?. 
#Realice para cada año de entrada el mismo proceso.

#Hint: group_by puede ser usado para agrupar por categorías.


#6. Realice un full join entre SEA_projects.csv y detalle_tipologia.csv y 
#corrobore que está bien realizado.

#Hint: Explore el argumento by de la función full_join.



#7. Obtenga un resumen de la base de datos obtenida en el paso 6, 
#¿En promedio cuantos millones de dólares se invierten en los proyectos de Chile?

#Hint: Función summary.




#8. Realice un análisis de los NA de la variable fecha_calificacion 
#segregando por los distintos estados de los proyectos. 
#¿A qué se deben estos resultados? Comente.

#Hint: Puede servirle group_by.


#9. Calcule el número de proyectos de cada empresa y el monto total invertido. 
#Luego ordene según este monto, de mayor a menor.

#Hint: Las funciones group_by, count de la librería dplyr puede servirles.


#10. Visualización gráfica:

#a. Filtre los proyectos con fecha de entrada desde el 2015, 
#luego genere un gráfico de boxplot de las inversiones. Interprete lo obtenido.

#b. Repita lo anterior, pero esta vez filtre también las inversiones 
#con menos de 30 millones de dólares estadounidenses.