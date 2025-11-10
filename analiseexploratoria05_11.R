#Atividade em sala de aula
#Prática Estatística I

#Vitor Eduardo

# 1 ####
#Commit é um processo para salvar os arquivos e modificações
#feitas no computador usando o Rstudio no Github. Toda vez qque modifico
#crio ou deleto algum arquivo, preciso registrar essa mudança no histórico
#do Github. Ele funciona como um histórico de cada passo dado.

library(usethis)
use_git_config(user.name = "VitorEBFerreira",
               user.emai = "ferreiravitor@id.uff.br")

# 5 ####
library(readr)
library(readxl)
library(dplyr)
library(ggplot2)
#importar a base
dados = read_excel("Base_trabalho.xlsx")

#a - transformar 'escolaridade' e 'reincidente' em fatores####
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

#b - verificar se há dados faltantes####
print(sapply(dados,function(x) sum(is.na(x))))

#c - criando um histograma da distribuição de idade####
ggplot(dados, aes(x = idade)) + 
  geom_histogram(color = "black",binwidth = 5, fill = "skyblue") + 
  labs(title = "Distribuição Idade", x = "Idade", y = "Quantidade") +
  theme_bw()

#d - criando um boxplot da variável tempo_preso####
ggplot(dados, aes(y = tempo_preso)) + 
  geom_boxplot(fill = "skyblue") +
  labs(title = "Boxplot do Tempo Preso", y = "Tempo Preso (meses)") +
  theme_bw() + 
  theme(axis.text.x = element_blank())

#e - criando um boxplot da variável score_periculosidade por escolaridade####
ggplot(dados, aes(x = escolaridade, y = score_periculosidade, fill = escolaridade)) + 
  geom_boxplot() +
  labs(title = "Score de Periculosidade por Escolaridade",
       x = "Escolaridade",
       y = "Score de Periculosidade") +
  theme_bw() +
  theme(legend.position = "none")

#f - criando um gráfico de barras para a variável reincidente####

ggplot(dados, aes(x = reincidente, fill = reincidente)) +
  geom_bar() +
  labs(title = "Contagem de Reincidentes", x = "Reincidente (Não/Sim)", y = "Contagem") +
  theme_minimal()

