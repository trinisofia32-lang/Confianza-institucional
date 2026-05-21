# ===============================
# Preparacion.R - Trabajo 3
# Confianza en medios e índice de confianza institucional
# ===============================

library(haven)
library(dplyr)

# Cargar base de datos
data <- read_dta("C:/Users/trini/OneDrive/Escritorio/Trabajo_R_OPT/input/ELSOC_2022.dta")

# Preparación y operacionalización de variables
data <- data %>%
  mutate(
    # -------------------------------
    # Variables principales del estudio
    # -------------------------------
    
    # Edad
    edad = as.numeric(edad),
    edad = ifelse(edad < 0, NA, edad),
    
    # Sexo
    sexo_num = as.numeric(sexo),
    sexo_num = ifelse(sexo_num %in% c(1, 2), sexo_num, NA),
    sexo = factor(sexo_num,
                  levels = c(1, 2),
                  labels = c("Hombre", "Mujer")),
    
    # Nivel educacional
    nivel_educ_num = as.numeric(nivel_educ),
    nivel_educ_num = ifelse(nivel_educ_num %in% c(1, 2, 3, 4), nivel_educ_num, NA),
    nivel_educ = factor(nivel_educ_num,
                        levels = c(1, 2, 3, 4),
                        labels = c("Básica", "Media", "Técnica", "Universitaria"),
                        ordered = TRUE),
    
    # Confianza en medios
    conf_medios_num = as.numeric(conf_medios),
    conf_medios_num = ifelse(conf_medios_num %in% c(1, 2, 3, 4, 5), conf_medios_num, NA),
    conf_medios = factor(conf_medios_num,
                         levels = c(1, 2, 3, 4, 5),
                         labels = c("Nada", "Poca", "Media", "Bastante", "Mucha"),
                         ordered = TRUE),
    
    # -------------------------------
    # Variables para índice institucional
    # -------------------------------
    
    # Confianza en gobierno
    conf_gob_num = as.numeric(conf_gob),
    conf_gob_num = ifelse(conf_gob_num %in% c(1, 2, 3, 4, 5), conf_gob_num, NA),
    
    # Confianza en partidos políticos
    conf_partidos_num = as.numeric(conf_partidos),
    conf_partidos_num = ifelse(conf_partidos_num %in% c(1, 2, 3, 4, 5), conf_partidos_num, NA),
    
    # Confianza en congreso
    conf_congreso_num = as.numeric(conf_congreso),
    conf_congreso_num = ifelse(conf_congreso_num %in% c(1, 2, 3, 4, 5), conf_congreso_num, NA)
  )

# Crear base con variables seleccionadas para el trabajo
data <- data %>%
  select(
    edad,
    sexo,
    sexo_num,
    nivel_educ,
    nivel_educ_num,
    conf_medios,
    conf_medios_num,
    conf_gob_num,
    conf_partidos_num,
    conf_congreso_num
  )


