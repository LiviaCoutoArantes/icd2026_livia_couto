# Arquivo: 04-lista-resolucao.R
# Autor(a): Lívia Couto Arantes
# Data: 12/05/2026
# Objetivo: Resolução da Lista de Exercícios 4

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)




# Exercício 2 ------------------------------------------------

# a)
# total de conjuntos diferentes de 20 números sorteados entre 100
total_resultados <- choose(100, 20)
total_resultados


# b)
# resultados favoráveis: os 20 números sorteados precisam estar
# dentro dos 50 números escolhidos na aposta
resultados_favoraveis <- choose(50, 20)
resultados_favoraveis


# c)
# probabilidade de acertar os 20 números
prob_acertar_20 <- resultados_favoraveis / total_resultados
prob_acertar_20



# d)
# Escreva sua interpretação como comentário.

## A probabilidade é baixa, pois o valor encontrado foi de aproximadamente
## 0.00000008793 , isso siginifica que a chance de uma aposta acertar os 20 
## números sorteados é muito baixa






# Exercício 3 ------------------------------------------------

# 100

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- 2 / 6
prob_teorica

# resultados possíveis do dado, criar um vetor
dado <- c(1, 2, 3, 4, 5, 6)

# número de lançamentos
n <- 100

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE,
  prob = rep(1/6, 6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <-mean(evento_A)
freq_relativa



# Depois de completar para n = 100, altere n para 1000 e 10000.


# 1000

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- 2 / 6
prob_teorica

# resultados possíveis do dado, criar um vetor
dado <- c(1, 2, 3, 4, 5, 6)

# número de lançamentos
n <- 1000

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE,
  prob = rep(1/6, 6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <-mean(evento_A)
freq_relativa


# 10000

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- 2 / 6
prob_teorica

# resultados possíveis do dado, criar um vetor
dado <- c(1, 2, 3, 4, 5, 6)

# número de lançamentos
n <- 10000

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE,
  prob = rep(1/6, 6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <-mean(evento_A)
freq_relativa


## As frequências relativas simuladas não precisam ser exatamente iguais
## à probabilidade teórica, especialmente quando n é pequeno.
## Em geral, quando n aumenta, a frequência relativa tende a se aproximar
## da probabilidade teórica.




# Exercício 5 ------------------------------------------------


# Cálculo do valor esperado com R

# parâmetros do modelo
prob_incendio <- 0.01
indenizacao <- 150000
carregamento <- 0.25

# valor esperado de indenização por residência
valor_esperado <- prob_incendio * indenizacao

# exibe o resultado
valor_esperado

# prêmio anual por residência com acréscimo
premio <- valor_esperado * (1 + carregamento)

# exibe o resultado
premio


# a) O valor esperado de indenização é de R$ 1500,00 por residência por ano.
## Ele representa a média teórica das indenizações por residência em uma 
## carteira grande de riscos semelhantes


# b) O valor esperado não significa que toda residência terá indenização de
## 1.500. Para uma residência individual, a indenização será 0 se não houver
## incêndio ou 150.000 se houver incêndio.


# c) O cáculo é simplificado. Ele ignora despesas administrativas, impostos,
## corretagem, inadimplência, capital regulátorio, resseguro, eventos extremos, 
## e possíveis erros na estimativa da probabilidade de incêndio.



# Exercício 6 ------------------------------------------------

# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- n * premio
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira



# Depois de completar para n = 100, altere n para 10000 e 100000.



# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 10000

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- n * premio
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira




# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100000

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- n * premio
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira



# a) Quando n aumenta, a média das indenizações por residência tende a ficar
## mais próxima do valor esperado teórico, conforme previsto pela lei dos
## grandes números.


# b) A média das indenizações tende a se aproximar de 1.500, que é o valor 
## esperado de indenização por residência.


# c) Uma carteira maior tende a tornar a média das indenizações mais previsível
## porque a frequência relativa de incêndios tende a se aproximar da 
## probabilidade teórica de 1%. Isso é uma aplicação da lei dos grandes números.


# d) O risco não desaparece completamente. A seguradora ainda pode ser afetada
## por eventos extremos, dependência entre riscos, erro na estimativa da
## probabilidade de incêndio e custos que não foram incluídos neste modelo 
## simples.


