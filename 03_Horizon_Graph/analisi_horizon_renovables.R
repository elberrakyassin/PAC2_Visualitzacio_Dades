# ==========================================================================
# 3. HORIZON GRAPH: EVOLUCIÓ HISTÒRICA DE RENOVABLES (2000-2024)
# ==========================================================================

# 1. Instal·lació i càrrega de llibreries
if(!require(ggHoriPlot)) install.packages("ggHoriPlot")
if(!require(ggthemes)) install.packages("ggthemes")

library(tidyverse)
library(ggHoriPlot)
library(ggthemes)

# 2. Lectura i preparació del dataset (Sèrie temporal)
# Fem servir el dataset original de renovables
dades_raw <- read_csv("renewable-share-energy.csv")

# 3. Filtratge i Neteja (ETL)
paisos_seleccio <- c("Sweden", "Denmark", "Spain", "Germany", "France", "Italy")

dades_horizon <- dades_raw %>%
  # Canviem el nom de la columna de dades per un de manejable
  rename(Renovables = `Renewables`) %>%
  # Filtrem països i rang d'anys
  filter(Entity %in% paisos_seleccio) %>%
  filter(Year >= 2000) %>%
  # Assegurem tipus de dada i eliminem buits
  mutate(Year = as.numeric(Year),
         Renovables = as.numeric(Renovables)) %>%
  filter(!is.na(Renovables)) %>%
  arrange(Entity, Year)

# 4. Generació del Horizon Graph
# Utilitzem 'cutpoints' automàtics basats en la distribució de la dada
ggplot(dades_horizon, aes(x = Year, y = Renovables)) +
  # geom_horizon plega l'àrea sobre si mateixa per estalviar espai
  geom_horizon(origin = "min", horizonfill = "#27ae60") +
  # Creem una franja horitzontal per a cada país
  facet_grid(Entity ~ ., switch = "y") +
  # Paleta de colors: Verds (com més fosc, més renovable)
  scale_fill_hcl(palette = "Greens", reverse = TRUE) +
  # Configuració d'eixos i etiquetes
  scale_x_continuous(expand = c(0, 0), breaks = seq(2000, 2024, 4)) +
  labs(
    title = "Evolució de la producció d'energia renovable (2000-2024)",
    subtitle = "Horizon Graph: La intensitat del color indica el creixement de la quota sobre el mix total",
    x = "Any",
    y = NULL,
    caption = "Font: Our World in Data | PAC2 Visualització de Dades"
  ) +
  # Estètica professional (Neteja d'elements innecessaris)
  theme_few() +
  theme(
    panel.spacing.y = unit(0.2, "lines"),
    strip.text.y.left = element_text(angle = 0, hjust = 1, face = "bold"),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    legend.position = "none",
    plot.title = element_text(face = "bold", size = 14),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
  )