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

load(file = "Clase 4/Bases de datos/chart_chile.RData")
load(file = "Clase 4/Bases de datos/chart_arg.RData")



# 2) Vea si es necesario limpiar los nombres de las variables.

# 3) Reemplace los espacios en blanco de artist y title por guión bajo "_".

# 4) Pase la variable date a formato date.

# 5) Cree una nueva variable que contenga el día del año al que corresponde date,
#y otra que contenga el año del Ranking.

# 6) Encuentre el día del año al que correspondió su cumpleaños el 2021.

# 7) Separe para cada base el TOP 50 del día de su cumpleaños del año 2021 
#usando las variables creadas en 5.

# 8) Si quisieramos realizar entrecruzamientos entre las dos bases 
#creadas. ¿Qué variable nos serviría?

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