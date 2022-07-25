library(naniar)
library(tidyverse)

#1. Cargar y Explorar base de datos.
Data <- read_csv("all_csv sorted.csv")
##Con el código glimpse(Data) en consola, se puede observar que hay una columna sin un nombre asignado a lo que R
##responde con una asignación de nombre de columna "...1". Además se especifica que 6 de nuestros datos
##son de tipo character y otros 5 son de tipo dbl. Vemos también mejor el nombre de las columnas y sabemos también 
##que tenemos 13 columnas y 243 filas 
head(Data, 10)
##Las primeras 10 filas corresponden a los países de: Israel, Kyrgyzstan, Fiji, Italy, Sudan, 
##Russia, Maldova, Bangladesh, Sri Lanka y Chile.


#2. Datos faltantes por columna.
Datos_vacios <- data.frame(miss_var_summary(Data))
##Se crea una data que contiene 13 filas y 3 columnas, las 3 columnas corresponden a:
##nombre de la variable, número de datos faltantes y porcentaje de datos faltantes por cada
##una de las variables. Hay 5 variables sin datos faltantes (Se incluye la columna "...1",
##que solo corresponde a la númeración de los datos de la base desde 0).


##3. Manipulación de datos.
Data %>%
  mutate("Variacion_porcentual" = (as.numeric(`Average price of 1GB (USD  at the start of 2021)`)-
           as.numeric(`Average price of 1GB (USD – at start of 2020)`))/as.numeric(`Average price of 1GB (USD – at start of 2020)`)*100) %>%
  arrange(desc(Variacion_porcentual)) %>%
  head(10)
##Los países con mayor incremento en el precio son: 
##1. Santa Helena, Ascención y Trristán de Acuña.
##2. Malaui.
##3. Santo Tomé y Príncipe.
##4. Mauricio.
##5. España.
##6. Polinesia Francesa.
##7. Eswatini.
##8. Grecia.
##9. Gibraltar.
##10. Trinidad y Tobago.

##El código arroja un "warning message" debido a la existencia de datos faltantas y debido a que 
##en algunos caso en el espacio del dato aparace "NO PACKAGES" lo que impide hacer una operación y 
##por lo tanto, se introducen NAs.


##4. Manipulación de datos - Parte 2
Data%>%
  group_by(`Continental region`) %>%
  summarise(velocidad_promedio=mean(`Avg \n(Mbit/s)Ookla`, na.rm=TRUE)) %>%
  arrange(velocidad_promedio)

## La región con el internet más lento es: África Subsahariana.


##5. Gráfico en ggplot
Data2 <- Data %>%
  mutate("porcentaje_usuarios" = `Internet users` / Population * 100)

##Se crea una base nueva, agregando la columna de porcentaje de usuarios para realizar el 
##ggplot correspondiente. Se divide el número de usuarios en internet con el total de la población
##y se multiplica x 100.

ggplot(Data2, aes(x = `Avg \n(Mbit/s)Ookla`,
                 y = porcentaje_usuarios)) +
  geom_point()

##Existe una correlación creciente entre estas dos variables, pues pese a la dispersión de los
##datos, se aprecia que la velocidad promedio aumenta conforme aumenta el porcentaje de los usuarios
##en internet. 
