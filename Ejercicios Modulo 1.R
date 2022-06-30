#Grupo formado por: Tatiana Escalante Guarin y Andrea Huertas Pedreros

#Ejercicios Modulo 1

#PUNTO 1 : VECTORES Y LISTAS

##A. ¿Cuál es la principal diferencia entre los vectores creados con la función 
#c() y las listas creadas con la función list()?.

#RTA: La principal dferencia entre estos vectores es que en c() solo permte la 
#entrada de un tipo de datos (character, numeric, logical, etc), mientras que la 
#entrada de datos en la función list() no tiene restricción en el tipo de datos.

A <- c(5,"texto", 20, FALSE, 8)
class(A) #Pese a que tenemos numeros, logicals y caracteres, la clase solo nos 
#indica que supuestamente hay datos unicamente de caracteres.
class(A[[1]])

B <- list("Andrea", 8, 3.5, FALSE)
class(B[[3]]) #Permite señalar que el elemento 3 de la lista B es un "numeric"
class(B[[1]]) #Señala que el elemento 1 de la lista B es un "character"


#B. Suponga que tiene una lista de n elementos llamada mi_lista. ¿Cuál es la 
#diferencia entre ejecutar mi_lista[0] y mi_lista[[0]]?

mi_lista <- list("Sol", 1, 15, "Manzana", 3.7, TRUE, 6)

mi_lista[1] #Esto devuelve una lista de los elementos en la posición.
mi_lista[[1]] #Devuelve el elemento que se indica de la lista, más no una lista de elementos.



#PUNTO 2: EXTRACCIÓN DE ELEMENTOS

matriz <- matrix(rep(1:7, 4), ncol = 4, nrow = 7, byrow = TRUE)

#Escriba los comandos para extraer:

#A. La segunda columna únicamente.
matriz[,2] #Devuelve los resultados en un vector
matriz[,2, drop=FALSE] #Devuelve los resultados manteniendo su forma de matriz 
#con el argumento "drop".


#B.La tercera fila únicamente.
matriz[3,] #Resultados en vector.
matriz[3, , drop=FALSE] #Resultados manteniendo forma de matriz.


#C. De la fila 3 a la fila 7.
matriz[3:7,]


#D.Las columnas 2 a 4 de las filas 1 y 2.
matriz[1:2, 2:4]



#PUNTO 3: IF
# Usando un loop if y condicionales, escriba una serie de comandos que determinen 
#si un número específico es par o impar.

numero <- 5

if (numero%%2==0) {
  print("El número es par")
} else if (numero%%2>0) {
  print("El número es impar")
}

##Ejemplo numero par
numero2 <- 28

if (numero2%%2==0) {
  print("El número es par")
} else if (numero2%%2>0) {
  print("El número es impar")
}



#PUNTO 4 : FOR
#Usando un vector con una serie de nombres, escriba el código correspondiente 
#para un loop for que imprima en consola el mensaje Bienvenido {nombre} para cada nombre.

nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")

# Solución:
for (nombre in nombres) {
  print(paste("Bienvenido", nombre))
}



#PUNTO 5 : FUNCIONES
#Escriba una función que reciba dos argumentos - el número a y el número b -, 
#que devuelva el número a elevado al número b. Por ejemplo, si a = 2, y b = 3, 
#la función devería devolver 8.
#Además, si el usuario no define el número b, la función debería asignar un 
#valor por defecto de 1 a esta variable.


mi_funcion <- function(a, b=1) {
  return(a^b)
}

respuesta <- mi_funcion(5,4)

