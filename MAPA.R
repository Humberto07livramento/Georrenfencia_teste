# Instalar e carregar os pacotes necessários
install.packages("leaflet")
install.packages("htmlwidgets")
library(leaflet)
library(htmlwidgets)



# Dados de exemplo com coordenadas mais afastadas
postos_saude <- data.frame(
  Nome = c("Posto Saúde A", "Posto Saúde B", "Posto Saúde C"),
  Latitude = c(-23.5505, -23.5605, -23.5705),
  Longitude = c(-46.6333, -46.6433, -46.6533)
)

# Criar o mapa
mapa <- leaflet(postos_saude) %>%
  addTiles() %>%
  addMarkers(~Longitude, ~Latitude, popup = ~Nome) %>%
  setView(lng = mean(postos_saude$Longitude), lat = mean(postos_saude$Latitude), zoom = 12)

# Salvar o mapa como HTML
saveWidget(mapa, file = "mapa_postos_saude.html")

# Para exibir o mapa diretamente em um R Markdown ou R script, use:
mapa
 
