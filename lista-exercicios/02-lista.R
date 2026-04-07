# Arquivo: 02-lista.R
# Autor(a): <Lívia Couto Arantes>
# Data: <07/04/2026>
# Objetivo:
# 1. Resolver os exercícios da lista 2


# Configurações globais ---------------------------------------------------

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# carrega os pacotes necessários

library(here) 
library(tidyverse) 
library(janitor)

# Exercicio 1 -------------------------------------------------------------


## a) 


## b) Importar o arquivo dados-marketing.csv da pasta dados/brutos usando as 
## funções here() do pacote here e a função read_csv do pacote readr. Os dados 
## importados devem ser armazenados em um objeto chamado dados_marketing

caminho_csv <- here("dados/brutos/dados-marketing.csv")

dados_marketing <- read_csv(caminho_csv)


## c) Em seguida, execute glimpse(dados_marketing) e analise a estrutura do 
## objeto dados_marketing para entender como os dados foram registrados 
## pela linguagem R

glimpse(dados_marketing)


# Exercicio 2 -------------------------------------------------------------

## a) o que cada linha (observação) do arquivo representa?

## Cada linha representa uma semana de observação. Então, as observações
## correspondem a registros semanais com informações sobre investimentos em 
## diferentes canais de marketing, ocorrência de promoção, atividade concorrente 
## e receita de vendas.


## b) quantas observações e quantas variáveis há no objeto dados_marketing?

## Observações = 156
## Variáveis = 9


# Exercicio 3 -------------------------------------------------------------

## a) Use clean_names() para padronizar os nomes das colunas e crie um novo 
## objeto chamado dados_marketing_limpos a partir de dados_marketing

dados_marketing_limpos <- dados_marketing |> 
  clean_names()


## b) escreva e execute names(dados_marketing_limpos) e verifique os 
## novos nomes das variáveis/colunas

names(dados_marketing_limpos)


# Exercicio 4 -------------------------------------------------------------

## Utilizando o objeto dados_marketing_limpos, use a função select do dplyr 
##para criar um pipeline (sequência de operações) que mostre apenas 
## as seguintes variáveis

dados_marketing_limpos |> 
  select(data, mes, gasto_tv, gasto_radio, promocao, receita_vendas)


# Exercicio 5 -------------------------------------------------------------

## Use mutate() para criar uma nova variável chamada gasto_total no objeto 
## dados_marketing_limpos, correspondente à soma dos gastos

dados_marketing_limpos <- dados_marketing_limpos |> 
  mutate(gasto_total = gasto_tv + gasto_radio + gasto_redes_sociais + gasto_email)


## Exiba as colunas data, mes, gasto_total e receita_vendas

dados_marketing_limpos |> 
  select(data, mes, gasto_total, receita_vendas)


## Escreva e execute View(dados_marketing_limpos) para visualizar o objeto 
## com a nova variável criada

View(dados_marketing_limpos)


# Exercicio 6 -------------------------------------------------------------

## Use mutate() e ifelse() para criar as seguintes novas variáveis no objeto 
## dados_marketing_limpos:

## a) status_promocao, com os valores "Com promoção" e "Sem promoção"

dados_marketing_limpos <- dados_marketing_limpos |> 
  mutate(status_promocao = ifelse(promocao == 1, "Com promoção", "Sem promoção"))


## b) status_concorrencia, com os valores "Com concorrência" e "Sem concorrência"

dados_marketing_limpos <- dados_marketing_limpos |> 
  mutate(status_concorrencia = ifelse(atividade_concorrente == 1, "Com concorrência", "Sem concorrência"))


# Exercicio 7 -------------------------------------------------------------


# define o caminho relativo para salvar o arquivo rds

caminho_rds <- here("dados/limpos/dados_marketing_limpos.rds")


# salva os dados limpos no formato rds

write_rds(dados_marketing_limpos, caminho_rds)


# visualiza a base de dados no RStudio

View(dados_marketing_limpos)


# Exercicio 8 -------------------------------------------------------------


# filtra semanas com promocao e receita maior que 1000

dados_marketing_limpos |>
  filter(promocao == 1 & receita_vendas > 1000) |>
  select(data, mes, receita_vendas, status_promocao)


# Exercicio 9 -------------------------------------------------------------


# cria um objeto com o resumo dos dados por mês

resumo_mensal <- dados_marketing_limpos |>
  group_by(mes) |>
  summarise(
    receita_media = mean(receita_vendas),
    receita_total = sum(receita_vendas),
    gasto_total_medio = mean(gasto_total),
    semanas_com_promocao = sum(promocao)
  ) |>
  arrange(desc(receita_media))

# mostra o resultado ordenado
resumo_mensal

# visualiza o resultado no RStudio
View(resumo_mensal)

# os três meses com maior receita média são:
# mes 12, mes 11 e mes 10






