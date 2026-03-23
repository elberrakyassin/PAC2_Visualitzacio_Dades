# 1. Carregar llibreries
library(tidyverse)

# 2. Llegir les dades
dades_rd <- read_csv("research-spending-gdp.csv")

# 3. Definir la llista oficial de la UE (amb variants per evitar errors de nom)
llista_ue <- c(
  "Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", 
  "Czechia", "Czech Republic", "Denmark", "Estonia", "Finland", 
  "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", 
  "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", 
  "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden"
)

# 4. Transformació i Neteja (ETL)
# Busquem l'any més recent amb dades suficients (per exemple, 2022)
any_estudi <- 2022 

dades_final_rd <- dades_rd %>%
  # Simplifiquem el nom de la columna de despesa
  rename(percent_rd = `Research and development expenditure (% of GDP)`) %>%
  # Filtrem per l'any escollit
  filter(Year == any_estudi) %>%
  # Classifiquem: Si està a la llista és "Unió Europea", si no, "Resta del Món"
  mutate(Grup = if_else(Entity %in% llista_ue, "Unió Europea", "Resta del Món")) %>%
  # Eliminem files sense dades per evitar errors al gràfic
  filter(!is.na(percent_rd))

# 5. Generació del Box Plot
ggplot(dades_final_rd, aes(x = Grup, y = percent_rd, fill = Grup)) +
  # Dibuixem la caixa amb una mica de transparència
  geom_boxplot(outlier.shape = NA, alpha = 0.7, width = 0.6) +
  # Afegim els punts (jitter) per veure cada país individualment
  geom_jitter(width = 0.2, alpha = 0.5, size = 2) +
  # Personalització de colors (Verd UE vs Gris Resta)
  scale_fill_manual(values = c("Unió Europea" = "#2ecc71", "Resta del Món" = "#bdc3c7")) +
  # Etiquetes i títols
  labs(
    title = "Distribució de la despesa en R+D (% del PIB)",
    subtitle = paste("Comparativa entre la UE i la mitjana global - Any", any_estudi),
    x = "Àrea Geogràfica",
    y = "Inversió en R+D (% sobre el PIB)",
    caption = "Font: Our World in Data | Elaboració pròpia amb RStudio"
  ) +
  # Millora de l'estètica visual
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(face = "bold", size = 14),
    axis.title = element_text(size = 11)
  )