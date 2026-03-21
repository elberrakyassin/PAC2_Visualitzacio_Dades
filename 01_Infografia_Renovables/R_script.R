# install.packages("tidyverse") 
library(tidyverse)

# Llegir les dades
dades_brutes <- read_csv("renewable-share-energy.csv")

head(dades_brutes)

# 1. Definim la llista de països de la UE que apareixen al fitxer
llista_ue <- c("Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", 
               "Czechia", "Denmark", "Estonia", "Finland", "France", 
               "Germany", "Greece", "Hungary", "Ireland", "Italy", 
               "Latvia", "Lithuania", "Luxembourg", "Netherlands", "Poland", 
               "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden")

# 2. Creem la dada de la Unió Europea fent la mitjana
ue_agregat <- dades_brutes %>%
  filter(Entity %in% llista_ue) %>%
  summarise(
    Entity = "Unió Europea",
    Year = max(Year), # Agafem l'any més recent
    Renewables = mean(Renewables, na.rm = TRUE) # Mitjana de renovables
  )

# 3. Mirem el resultat (hauriem de tenir una sola fila amb la mitjana)
print(ue_agregat)

# 4. L'exportem a CSV per a Infogram
write_csv(ue_agregat, "dades_infografia_neta.csv")


# 5. Creem un rànquing dels països de la UE que tenim al fitxer
ranking_ue <- dades_brutes %>%
  filter(Entity %in% llista_ue) %>%
  arrange(desc(Renewables)) # Ordenem de major a menor

# 5.1. Agafem els 5 millors i els 5 pitjors per no saturar el gràfic (Ràtio dades/tinta)
top_bottom_ue <- bind_rows(
  head(ranking_ue, 5),
  tail(ranking_ue, 5)
)

# 5.2. Exportem aquest rànquing
write_csv(top_bottom_ue, "dades_barres_comparativa.csv")
