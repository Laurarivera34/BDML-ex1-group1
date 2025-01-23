# Primer método: 

# Imputar valores faltantes con la mediana

ggplot(db, aes(y_salary_m)) +
  geom_histogram(color = "#000000", fill = "#0099F8") +
  ggtitle("Salary") +
  theme_classic() +
  theme(plot.title = element_text(size = 18))

# Identificar valores faltantes
is.na(db$y_salary_m) %>% table()

# De acuerdo a la gr+afica, y_salary_m es una variable continua, al tener tener una cola a la derecha, se usará la mediana

db <- db  %>%
  mutate(y_salary_m = ifelse(is.na(y_salary_m) == TRUE, median(db$y_salary_m, na.rm = TRUE) , y_salary_m))

print(db)

# Verificar valores faltantes
sum(is.na(db$y_salary_m))
