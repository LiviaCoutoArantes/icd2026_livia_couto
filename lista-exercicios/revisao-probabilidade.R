# Arquivo: revisao-probabilidade.R
# Autor: Lívia Couto Arantes
# Data: 08/06/2026
# Objetivos:
# Exercícios de revisão para a avaliação 2

# Configurações globais -------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)

# Orientação:
# Nos Exercícios 1, 2 e 3, escreva as respostas como comentários.
# No Exercício 4, complete e execute o código em R.


# Exercício 1 -----------------------------------------------------
# Experimento, evento e variável aleatória

## Qual é um possível espaço amostral desse experimento?

# a) S = (realizou a compra, não realizou a compra)


## Defina um evento associado à realização de compra

# b) A = realizou a compra


## Escreva a probabilidade desse evento usando notação matemática

# c) P(A) ou P(realizou a compra)


## Antes de definir uma variável aleatória, o resultado observado é diretamente
## numérico? Justifique

# d) Não, é qualitativo ou categórico, somente depois que define uma variável
# aleatória, dessa forma se tem o resultado númerico


## Defina uma variável aleatória indicadora para representar a compra

# e) X = 1, se o cliente realizou a compra
#    x = 0, se o cliente não realizou a compra


# Com essa definição, o evento A = {compra} também pode ser escrito
# como X = 1. Assim, P(A) = P(X = 1)




# Exercício 2 -----------------------------------------------------
# Valor esperado em uma decisão simples

# a) Valores possíveis de X: 500 ou 0

# X = 500, quando a garantia é acionada
# X = 0, quando a garantia não é acionada


# b) P(X = 500) = 0.04


# c) P(X = 0) = 0.96


## Calcule o valor esperado de X:

# d) E(X) = 0.04 x 500 + 0.96 x 0 = 20


# Correção, pode ser assim também:

# E(X) = X1 * P(X = 500) + X2 * P(X = 0)
# E(X) = 500 * 0,04 + 0 * 0,96 
# E(X) = R$ 20



# e) Interpretação do valor esperado:

# O custo esperado da garantia é R$ 20 por produto vendido.
# Isso não significa que cada produto terá custo de R$ 20.
# Individualmente, o custo será R$ 0 ou R$ 500.
# O valor esperado resume o custo médio por produto quando pensamos
# em muitos produtos vendidos sob as mesmas condições.





# Exercício 3 -----------------------------------------------------
# Escolha de distribuição de probabilidade



# Observar se um cliente realizou ou não uma compra após receber uma campanha:

# a) Bernoulli, ela assume apenas valores 0 e 1, no caso realizou ou não
# realizou uma compra

# Correção: 
# Bernoulli: há uma única observação com dois resultados possíveis
# compra ou não compra




# Contar quantos clientes converteram entre 300 clientes contatados: 

# b) Binomial, ela assume um número fixo de contatos independentes, no caso
# 300 clientes

# Correção:
# Binomial: conta o número de sucessos em um número fixo de tentativas
# semelhantes, neste caso 300 clientes contatados




# Contar quantos clientes chegam a uma unidade de atendimento em uma hora de pico:

# c) Poisson, modela contagens em uma unidade fixa de tempo, no caso uma hora de pico

# correção:
# Poisson: conta ocorrências em um intervalo fixo de tempo,
# neste caso o número de chegadas em uma hora de pico





# Modelar a variação percentual mensal de um custo em relação ao orçamento, 
# assumindo valores aproximadamente simétricos em torno de uma média

# d) Normal, porque a variação percentual do custo é contínua, pode assumir 
# valores negativos e positivos, e é plausivelmente simétrica em torno de um valor
# típico

# Correção:
# Normal: variável numérica contínua, com valores aproximadamente
# simétricos em torno de uma média.






# Exercício 4 -----------------------------------------------------
# Simulação com distribuição de Poisson
# escreva, complete e execute o código fornecido


# fixa a semente para que a simulação possa ser reproduzida

set.seed(123)

# parâmentros da simulação

lambda <- 12
capacidade <- 15

# quantidade de valores de x que serão simulados

n_simulacoes <- 1000

# simula 1000 valores de x

clientes <- rpois(n = n_simulacoes, lambda = lambda)

# exibe as primeiras contagens simuladas de clientes

head(clientes)

# média simulada 

media_simulada <- mean(clientes)
media_simulada

# proporção de simulações acima da capacidade

prop_acima_capacidade <- mean(clientes > capacidade)
prop_acima_capacidade

# percentil 95

percentil_95 <- quantile(clientes, 0.95)
percentil_95



# e) Interpretação da capacidade atual

# interpretação:

# A média simulada ficou próxima de 12 clientes por hora, como esperado
# pelo modelo Poisson(lambda = 12).
#
# A capacidade de 15 clientes foi excedida em cerca de 14,4% dos valores
# simulados. Portanto, em uma hora de pico sob esse modelo, a unidade ficaria
# acima da capacidade com alguma frequência.
#
# O percentil 95 foi igual a 18. Nesta simulação, isso indica que uma
# capacidade de 18 clientes por hora cobriria cerca de 95% das simulações.
#
# Assim, se a prioridade for reduzir saturação no horário de pico,
# a capacidade atual de 15 clientes por hora parece limitada. Se a unidade
# aceitar alguma espera em parte das horas de pico, essa capacidade ainda
# pode ser defendida, mas com risco operacional visível.




