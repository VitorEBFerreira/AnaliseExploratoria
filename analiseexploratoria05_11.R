#Atividade em sala de aula
#Prática Estatística I

#Vitor Eduardo

# 1 ####
#Commit é um processo para salvar os arquivos e modificações
#feitas no computador usando o Rstudio no Github. Toda vez qque modifico
#crio ou deleto algum arquivo, preciso registrar essa mudança no histórico
#do Github. Ele funciona como um histórico de cada passo dado.

# 2, 3 e 4 feitos

# 5 ####
library(readr)
library(readxl)
library(dplyr)
library(ggplot2)
#importar a base
dados = read_excel("Base_trabalho.xlsx")

#transformar 'escolaridade' e 'reincidente' em fatores
dados = dados %>%
  mutate(escolaridade = as.factor(escolaridade),
         reincidente = as.factor(reincidente))

#verificar se há dados faltantes
print(sapply(dados,function(x) sum(is.na(x))))














