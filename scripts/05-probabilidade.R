# Arquivo: 05-probabilidade.R
# Autor: Lívia Couto
# Data: 11/05/2026
# Objetivos:
# 1. Praticar cálculos básicos de probabilidades
# 2. Praticar conceitos básicos de simulação de Monte Carlo

# Configuracoes globais -----------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)


# Pacotes usados ------------------------------------------------------

library(tidyverse)
library(probs) # instale esse pacote


# Solução do exemplo 1

## A função tosscoin simula o lançamento de moedas

## Simula o lançamento de 3 moedas

# espaço amostral do lançamento de uma moeda 2 vezes
tosscoin(times = 3)


# Exemplo 2

## Em R, a função choose(n, k) calcula o número de combinações possíveis:

# para exibir os números sem notação científica
options(scipen = 999)

choose(60,6)

# para exibir os números sem notação científica
options(scipen = 999)

# prob. de acertar os 6 números da megasena com 1 aposta
1/choose(60,6)


# Simulando o lançamento de um dado:

# fixa a semente para reprodutibilidade
set.seed(123)

# cria um vetor de 1 até 6 (faces)
dado <- 1:6                                 

# define o n. de lançamentos do dado
n <- 10 

# simula os 10 lançamentos
lançamentos <- sample(dado, size = 10, replace = TRUE)
lançamentos

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada


# Exercícios:

# 100

# fixa a semente para reprodutibilidade
set.seed(123)

# define o n. de lançamentos do dado
n <- 100

# simula os n lançamentos
lançamentos <- sample(dado, size = 100, replace = TRUE)

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada


# 1.000

# fixa a semente para reprodutibilidade
set.seed(123)

# define o n. de lançamentos do dado
n <- 1000

# simula os n lançamentos
lançamentos <- sample(dado, size = 1000, replace = TRUE)

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada


# 10.000

# fixa a semente para reprodutibilidade
set.seed(123)

# define o n. de lançamentos do dado
n <- 10000

# simula os n lançamentos
lançamentos <- sample(dado, size = 10000, replace = TRUE)

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada


# 100.000

# fixa a semente para reprodutibilidade
set.seed(123)

# define o n. de lançamentos do dado
n <- 100000

# simula os n lançamentos
lançamentos <- sample(dado, size = 100000, replace = TRUE)

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------


### Script Completo ###


# Arquivo: 05-probabilidade.R
# Autor(a): <seu nome>
# Data: 11/05/2026
# Objetivos:
# 1. Praticar cálculos básicos de probabilidades
# 2. Praticar conceitos básicos de simulação de Monte Carlo


# Configuracoes globais -----------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)


# Pacotes usados ------------------------------------------------------

library(tidyverse)
library(probs) # instale esse pacote


# 1. Probabilidade clássica ---------------------------------------------

# Exemplo: lançar uma moeda equilibrada 3 vezes.
# A função tosscoin() cria o espaço amostral do experimento.
espaco_moeda_3 <- tosscoin(times = 3)
espaco_moeda_3

# Evento A: obter exatamente uma cara.
# No pacote probs, "H" representa cara (heads) e "T" representa coroa (tails).
evento_uma_cara <- rowSums(espaco_moeda_3 == "H") == 1
evento_uma_cara

# Número de resultados favoráveis ao evento A.
favoraveis_uma_cara <- sum(evento_uma_cara)
favoraveis_uma_cara

# Número total de resultados possíveis.
total_resultados_moeda <- nrow(espaco_moeda_3)
total_resultados_moeda

# Probabilidade clássica: casos favoráveis / casos possíveis.
prob_uma_cara <- favoraveis_uma_cara / total_resultados_moeda
prob_uma_cara


# 2. Combinações e probabilidade: Mega-Sena -----------------------------

# Na Mega-Sena, uma aposta simples escolhe 6 números entre 60.
# A função choose(n, k) calcula o número de combinações possíveis.
total_combinacoes <- choose(60, 6)
total_combinacoes

# Probabilidade de acertar os 6 números com uma aposta simples.
prob_megasena <- 1 / total_combinacoes
prob_megasena

# A mesma probabilidade em percentual.
prob_megasena_percentual <- prob_megasena * 100
prob_megasena_percentual


# 3. Simulação com sample(): lançamento de dado -------------------------

# Define os resultados possíveis de um dado equilibrado.
dado <- 1:6

# Fixa a semente para que a simulação possa ser reproduzida.
set.seed(123)

# Número de lançamentos que serão simulados.
n <- 10

# Simula n lançamentos independentes do dado.
# replace = TRUE indica que cada face continua disponível no próximo lançamento.
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE
)

# Valores observados nos lançamentos simulados.
lancamentos

# Média observada nos n lançamentos simulados.
media_lancamentos <- mean(lancamentos)
media_lancamentos


# 4. Lei dos Grandes Números: aumentando n ------------------------------

# Valor esperado teórico de um dado equilibrado.
valor_esperado_dado <- mean(dado)
valor_esperado_dado

# Tamanhos de simulação que serão comparados.
tamanhos_simulacao <- c(100, 1000, 10000, 100000)

# Gera uma sequência longa de lançamentos.
set.seed(123)
lancamentos_longos <- sample(
  x = dado,
  size = max(tamanhos_simulacao),
  replace = TRUE
)

# Calcula a média observada usando os primeiros n lançamentos da sequência.
resumo_lgn_dado <- tibble(
  n = tamanhos_simulacao
) |>
  mutate(
    media_observada = map_dbl(
      n,
      ~ mean(lancamentos_longos[1:.x])
    ),
    valor_esperado_teorico = valor_esperado_dado
  )

# exibe o resultado
resumo_lgn_dado





