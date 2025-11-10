library(readxl)
library(ggplot2)
library(dplyr)

dados = read_excel("Base_trabalho.xlsx")

# Transformar qualitativas em fatores####
dados = dados %>%
  mutate(escolaridade = as.factor(escolaridade),
         reincidente = as.factor(reincidente))

dados = dados %>%
  mutate(sexo = factor(sexo,
                       levels = c(0,1),
                       labels = c("Feminino","Masculino")))

dados = dados %>%
  mutate(filhos = factor(filhos,
                         levels = c(0,1),
                         labels = c("Não","Sim")))

dados = dados %>%
  mutate(casado = factor(casado,
                         levels = c(0,1),
                         labels = c("Não","Sim")))

dados = dados %>%
  mutate(reincidente = factor(reincidente,
                              levels = c(0,1),
                              labels = c("Não","Sim")))

dados = dados %>%
  mutate(escolaridade = factor(escolaridade,
                               levels = c(1,2,3),
                               labels = c("Fundamental","Médio","Superior")))

# Selecionar variáveis de interesse####
vars_numericas = dados %>%
  select(score_periculosidade, idade, tempo_preso)

# média, 1º e 3º quartil e mediana já tem no summary####
print(summary(vars_numericas))

# c - Gráfico de dispersão####
 ggplot(dados, aes(x = tempo_preso, y = score_periculosidade)) +
  geom_point(alpha = 0.9) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Dispersão: Tempo Preso vs. Score Periculosidade",
       x = "Tempo Preso (meses)",
       y = "Score de Periculosidade") +
  theme_minimal()

# d - Correlação####
cor(dados$tempo_preso, dados$score_periculosidade)

# e - Medidas de dispersão####
#variância
print(lapply(vars_numericas, var))

#Desvio padrão
print(lapply(vars_numericas, sd))

#amplitude
print(lapply(vars_numericas, function(x) {
  max(x) - min(x)
}))
