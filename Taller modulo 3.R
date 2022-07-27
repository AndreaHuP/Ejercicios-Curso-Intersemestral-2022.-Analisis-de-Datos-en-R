##ANDREA HUERTAS PEDREROS Y TATIANA ESCALANTE

library(tidyverse)

Spotify <- read.csv("songs_normalize.csv")

##PUNTO 1.
grafico_1 <- ggplot(Spotify, aes(x = danceability, y = valence)) +
  geom_point(color = "blue", alpha = 0.3)

##PUNTO 2.
grafico_2 <- ggplot(Spotify, aes(x = as.factor(mode), y = energy, color = as.factor(mode))) +
  geom_boxplot(show.legend = FALSE)

##PUNTO 3.
install.packages("patchwork")
library(patchwork)

grafico_1 + grafico_2
