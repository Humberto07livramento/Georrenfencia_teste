# Instalar e carregar os pacotes necessários
install.packages("leaflet")
install.packages("htmlwidgets")
library(leaflet)
library(htmlwidgets)

# Dados simulados dos postos de saúde em Salvador, BA
postos_saude <- data.frame(
  Nome = c("Posto Saúde 1", "Posto Saúde 2", "Posto Saúde 3", "Posto Saúde 4", "Posto Saúde 5"),
  Latitude = c(-12.9714, -12.9764, -12.9674, -12.9734, -12.9654),
  Longitude = c(-38.5014, -38.5054, -38.4904, -38.5104, -38.4954)
)

# Criar o mapa
mapa <- leaflet(postos_saude) %>%
  addTiles() %>%
  addMarkers(~Longitude, ~Latitude, popup = ~Nome) %>%
  setView(lng = mean(postos_saude$Longitude), lat = mean(postos_saude$Latitude), zoom = 13)

# Salvar o mapa como HTML
saveWidget(mapa, file = "mapa_postos_saude_salvador.html")

# Para exibir o mapa diretamente em um R Markdown ou R script, use:
mapa
