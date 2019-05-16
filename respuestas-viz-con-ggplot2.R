###################################################################
## Ejercicio - Diamonds
###################################################################
# 1. Genera una gráfica con la función `ggplot` en donde los datos sea
# la base `diamonds` y la estética sea $x = price$. Especifica como geometría
# una densidad.
# 2. Cambia el color y el relleno de la geometría a gris (`grey50`)
# 3. Cambia la geometría a `ribbon`, cambia los parámetros necesarios
# para que funcione.
# 4. Agrega una faceta para que se haga un gráfico para cada uno de los subconjuntos
# definidos por la variable `cut`.
# 5. Agrega a la gráfica el comando `coord\_flip` para que el precio este
# en el eje $y$.


# Respuestas
# 1
g <- ggplot(diamonds, aes(x = price)) + stat_density()
g
# 2
g +
  stat_density(fill = "grey50", colour = "grey50") 
# 3
g <- g +
  stat_density(aes(ymax = ..density..,  ymin = -..density..),
               fill = "grey50", colour = "grey50",
               geom = "ribbon", position = "identity")
g
# 4
g <- g  +
  facet_grid(. ~ cut) 
g
# 5
g + coord_flip()

###################################################################
## Ejercicio - iris
###################################################################
# 1. Realiza un histograma de `Petal.Length`.
# 2. Realiza una grafica de puntos con `Petal.Length` en el eje x y `Petal.Width` en el eje y. 
# 3. Usa la grafica en 2 y agrega la variable `species` como color en la estetica. 
# 4. Cambia la posicion de la leyenda abajo del grafico. Hint: agrega `theme`, con el parametro `legend.position = 'bottom')`.

# 1
ggplot(iris, aes(Petal.Length)) + geom_histogram()

# 2
ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_point()

# 3 
ggplot(iris, aes(Petal.Length, Petal.Width, color=Species)) +
  geom_point()

# 4
ggplot(iris, aes(Petal.Length, Petal.Width, color=Species)) +
  geom_point() + theme(legend.position="bottom") 


###################################################################
## Ejercicio - SKI
###################################################################
# 1. Utiliza la grafica base
# 
# `ggplot(SpeedSki, aes(x=Speed, fill=Sex)) + 
#   geom_histogram()`
# 
# Revisa el warning. Cambia el binwidth para que deje de mostrarte una advertencia.
# 
# 2. Cambia los limites de la grafica agregando `xlim` y definiendo un dominio.
# 
# 3. Agrega etiquetas al eje x y y (usa `xlab` y `ylab`)
# 
# 4. Agrega una faceta para la variable `Sex`.
# 
# 5. Elimina la leyenda.
# 
# 6. Haz un `facet_grid` con las variables `Sex` y `Event`.

## Respuestas
data(SpeedSki, package = "GDAdata")
tbl_df(SpeedSki)

# 1
ggplot(SpeedSki, aes(x=Speed, fill=Sex)) + 
  geom_histogram(binwidth=2.5)

# 2

ggplot(SpeedSki, aes(x=Speed, fill=Sex)) + 
  geom_histogram(binwidth=2.5) +
  xlim(160, 220)

# 3
ggplot(SpeedSki, aes(x=Speed, fill=Sex)) + xlim(160, 220) +
  geom_histogram(binwidth=2.5) + xlab("Speed (km/hr)") +
  ylab("")

# 4
ggplot(SpeedSki, aes(x=Speed, fill=Sex)) + xlim(160, 220) +
  geom_histogram(binwidth=2.5) + 
  xlab("Speed (km/hr)") +
  ylab("") +
  facet_wrap(~Sex, ncol=1)

# 5
ggplot(SpeedSki, aes(x=Speed, fill=Sex)) + xlim(160, 220) +
  geom_histogram(binwidth=2.5) + 
  xlab("Speed (km/hr)") +
  ylab("") +
  facet_wrap(~Sex, ncol=1) +
  theme(legend.position="none")

# 6
ggplot(SpeedSki, aes(x=Speed, fill=Sex)) +
  geom_histogram(binwidth=2.5) + 
  xlab("Speed (km/hr)") +
  ylab("") +
  facet_grid(Sex ~ Event) +
  theme(legend.position="none")






