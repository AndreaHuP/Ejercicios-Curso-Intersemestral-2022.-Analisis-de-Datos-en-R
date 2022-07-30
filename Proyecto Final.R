##ANDREA HUERTAS PEDREROS Y TATIANA ESCALANTE


##PARTE 1: FUNDAMENTOS DE R.
##1.1. Loop if
Calificacion <- 10
if (Calificacion>=0 & Calificacion<10){
  print("¡Hay mucho por mejorar!")
} else if (Calificacion>=10 & Calificacion<20){
  print("¡Bien! Pero podría ser excelente.")
} else if (Calificacion>=20 & Calificacion<=30){
  print("¡Excelente Servicio! Sigue así.")
}


##1.2. Funciones
suma_calificacion <- function(calidad = 10, decoracion = 5, servicio = 15){
  c <- calidad + decoracion + servicio
  return(c)
}

suma_calificacion(12,8,10)
suma_calificacion(8,4,)
suma_calificacion()



##PARTE 2: TIDYVERSE
library(tidyverse)

##2.1. Cargar datos.
precios <- read_csv("price_ratings.csv")
restaurantes <- read_csv("restaurant_locations.csv")

##Para la data de precios en consola se imprime el código glimpse() y se observa que tiene 
##672 filas y 3 columnas donde 2 son de tipo "dbl" y una es "chr". Sus primeras 8 filas son:
#     1 Price       43
#     1 Food        22
#     1 Decor       18
#     1 Service     20
#     2 Price       32
#     2 Food        20
#     2 Decor       19
#     2 Service     19

##Para la data de restaurantes se vuelve a usar glimpse() y se observa que hay 168 filas y
##3 columnas que tienen 2 datos de tipo "dbl" y 1 de tipo "chr". Sus primeras 8 filas son:
#             1 Daniella Ristorante     0
#             2 Tello's Ristorante      0
#             3 Biricchino              0
#             4 Bottino                 0
#             5 Da Umberto              0
#             6 Le Madri                0
#             7 Le Zie                  0
#             8 Pasticcio               1

##No se cumple con que amabas dataframes sean en la fila una observación y en cada
##columna una variable, porque la data de precios incluye todas las variables en una 
##unica columna.


##2.2. Pivot.
precio_wider <- precios %>%
  pivot_wider(names_from = Variable, values_from = Valor)


##2.3. Join.
Data_completa <- precio_wider%>%
  inner_join(restaurantes, by = c("Id" = "Id_restaurant"))


##2.4. Select y arrange.
Data_2.4 <- Data_completa %>%
  select(c(Restaurant, Price, Service))%>%
  arrange(Price)

Data_2.4 %>%
  head(1)

Data_2.4 %>%
  tail(1)

##Como el código de arrange ordena de menor a mayor, entonces tenemos que la
##primera fila corresponde al restaurante mas barato que es: Lamarca con un precio
##de 15, y el restaurante con precio más caro es: San Domenico con precio de 65.


##2.5. Group_by y Summarise
Data_2.5 <- Data_completa%>%
  group_by(East)%>%
  summarise(precio_promedio=mean(Food))

##La comida más cara es en el Este de Manhattan (1) con precio promedio de: 20.86792.
##Se hace aclaración de que al ser una variable de 0 y 1, el 0 representa la zona
##Oeste y el 1 representa la zona Este.



##PUNTO 3: ANÁLISIS ESTADISTICO
##3.1. Regresión lineal
regresion = lm((Price ~ Food + Decor + Service + East), 
               data = Data_completa)

summary(regresion)

##No todas las variables son estadísticamente significativas, pues la variable 
##Service no representa significancia ni al 0.05 ni al 0.10. Por otra parte, la 
##variable que parece influir más en el precio de la comida es "East" pues lo que nos 
##da a entender esta variable es que la comida del Oeste genera un mayor precio
##con un aumento de 2.06 sobre el precio final de la comida.



##PUNTO 4: VISUALIZACIÓN DE DATOS.

##4.1. Gráfico de densidad.
ggplot(Data_completa, aes(Service, linetype = factor(East)))+
  geom_density() +
  labs(
    title = "Gráfico de densidad del Servicio",
    x = "Servicio",
    y = "Densidad",
    linetype = "Este"
  )

##La zona que tiende a tener una mejor calificación en servicio es la del Este,
##que muestra un sesgo hacia la derecha con un pico en mejor calificación de 
##servicio que la zona Oeste.


##4.2. Gráfico de dispersión.
ggplot(Data_completa, aes(x = Price, y = Decor, color = factor(East))) +
  geom_point() +
  scale_color_manual(
    labels = c("Oeste", 
               "Este"),
    values = c("blue", 
               "green")
  )
  
##El restaurante con menor precio esta en la zona Oeste de Manhattan

