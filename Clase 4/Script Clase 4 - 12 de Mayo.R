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


viviendasRM%>%
  group_by(comuna, cat_banios)%>%
  count()
