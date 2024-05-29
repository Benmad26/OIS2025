# Installer les packages nécessaires (si non déjà installés)
if (!require(ggplot2)) {
  install.packages("ggplot2")
}
if (!require(dplyr)) {
  install.packages("dplyr")
}
if (!require(ggthemes)) {
  install.packages("ggthemes")
}

# Charger les packages
library(ggplot2)
library(dplyr)
library(ggthemes)

# Utiliser le dataset intégré mtcars
data("mtcars")

# Ajouter une colonne 'carb_factor' pour facetter par le nombre de carburateurs
mtcars <- mtcars %>%
  mutate(carb_factor = factor(carb))

# Créer le graphique
p <- ggplot(mtcars, aes(x = wt, y = mpg, color = carb_factor)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "black") +
  facet_wrap(~carb_factor) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8),
    legend.position = "bottom"
  ) +
  labs(
    title = "Fuel Efficiency vs Weight",
    subtitle = "Facetted by Number of Carburetors",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon (mpg)",
    color = "Number of Carburetors",
    caption = "Source: mtcars dataset"
  )

# Afficher le graphique
print(p)

