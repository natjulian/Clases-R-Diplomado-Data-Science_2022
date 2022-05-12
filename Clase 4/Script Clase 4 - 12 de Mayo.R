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
