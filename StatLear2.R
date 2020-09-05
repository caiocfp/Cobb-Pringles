getwd()
setwd('C:/Users/game/Desktop/Putz consultoria/estatistica')


x = c(1,6,2)
y = c(1,4,3)


#soma os elementos de cada conjunto desde que tenham os mesmos elementos#

length(x)
length(y)


x + y

#usando sapply e somando mais 3 em cada elemento dos conjuntos x e y#
sapply(c(x,y),function(x)(x+3))


#acusa todos os objetos no ambiente...pode ser funcoes, matrizes etc#

ls()


#apagando tudo###
rm(list = ls())



# matriz #

?matrix

#normalmente a matriz eh escrita em colunas#
x = matrix(data = c(1,2,3,4),
           nrow = 2,
           ncol = 2)
x


#mas se usar o "byrow" escreve a matriz por linha#

x = matrix(data = c(1,2,3,4),
           nrow = 2,
           ncol = 2,
           byrow = T)
x

#quadrados e raiz#

sqrt(x)
x^2

#rnorm cria uma serie com o tamanho da amostra#

x = rnorm(50)

y = x + rnorm(n = 50,
            mean = 50,
              sd = .1)
cor(x,y)   


#set seed trava a aleatoriedade#

set.seed(1303)

rnorm(n = 50)


set.seed(3)

y = rnorm(100)
mean(y)
var(y)
sd(y)

#se voce elevar ao quadrado e tirar a raiz da variancia# 
#temos os o desvio padrao#

sqrt(var(y))


#graficos#

?plot


#primeiro faz variaveis#

x = rnorm(100)
y = rnorm(100)

#plot#

plot(x,y,
     xlab = "eixo x",
     ylab = "eixo y",
     main = "Gr?fico de Dispers?o",
     pch = 19,
     col = "purple")


# sequencia #

#divide um espa?o em 10 que vai de 0 a 1#
x = seq(0,1,
        length = 10)

#sequencia de inteiros de 1 a 10#

x = 1:10

# divide um espa?o em 50 que vai de -pi at? pi #

x = seq(-pi,pi,
        length = 50)
x


# tr?s dimensoes onde z equivale as coordenadas
# atraves de x e y
y = x

# usa o outer para o produto di?tico de X e Y
f = outer(x,y,
          function(x,y)cos(y)/(1 + x^2))


#contour interprets the z matrix as a table of f(x[i], y[j])]
#values, so that the x axis corresponds to row number
#and the y axis to column number#


contour(x,y,f,
        nlevels = 45,
        add = T)

#subtrai a transposta t(f) da  funcao outer (f) 

fa = (f - t(f))/2


contour(x,y,fa,
        nlevels = 15)


# grafico em 3d ##

persp(x,y,fa,
      theta = 30,
      phi = 20)



#cobb#

X1 = seq(10, 150,
         length = 20)

X2 = seq(10, 100,
         length = 20)

Cobb = outer(X1,X2,
          function(X1,X2)(X1^0.5)*(X2^0.5))

Cobb2 = (Cobb - t(Cobb))/2

persp(X1,X2,Cobb2,
      theta = 70,
      phi = 30)



#pringles#

a <- 56
b <- 78

Pringles = outer(X1,X2,
                 function(X1,X2)(X1^2)/(a^2) - 
                            ((X2^2)/(b^2)))

Pringles2 = (Pringles - t(Pringles))/2

persp(X1,X2,Pringles2,
      theta = 70,
      phi = 30)
# indexar os dados #

#primeiramente, cria-se uma matriz#

A = matrix(1:16,
           nrow = 4,
           ncol = 4)


A

#podemos escolher a linha e coluna#

A[2,3]
A[1,4]

#varias linhas e colunas#

A[c(1,3),c(2,4)]

#escolhendo a sequencia de linhas de coluna#
A[1:3, 2:4]


# se eu n?o especifico a linha e o coluna, R usa todos os elementos #

A[1:2,]
A[,1:2]


A[-c(1,3),
  -c(1,3,4)]

# dim indica numero de linhas e numero de colunas #

dim(A)



#outer de novo#

d <- seq(from = 1, to = 20, by = 1)
f <- seq(from = 2, to = 40, by = 2)

df <- outer(d,f, function(d,f) (-d^2 + f))



df2 <- (df - t(df))/2

persp(d,f,df2,
      theta = 160,
      phi = 50)

###pacote que busca a data "AUTO"###

library(ISLR)

Auto <- as.data.frame(Auto)

dim(Auto)

#editor de dados direto#
fix(Auto)


#outros graficos usando#

plot(Auto$cylinders,
     Auto$mpg,
     xlab = "cilindros",
     ylab = "autonomia")

#cilindros tem cara de ser um fator, apesar de numerico#

class(Auto$cylinders)

cylinders = as.factor(Auto$cylinders)


#agora com os fatores#
#grafico com boxplots#


plot(cylinders,Auto$mpg,
     col = "red",
     xlab = "cilindros",
     ylab = "autonomia",
     varwidth = T)


plot(cylinders,Auto$mpg,
     col = "red",
     xlab = "cilindros",
     ylab = "autonomia",
     varwidth = T,
     horizontal = T)

#histograma#
attach(Auto)

hist(mpg,
     col = 2,
     breaks = 15)

#"pairs" cria um gr?fico de dispers?o para cada par
# de variaveis em um conjunto de variaveis

pairs(Auto)
pairs(~ mpg +
        displacement +
        horsepower +
        weight +
        acceleration,
      Auto)



