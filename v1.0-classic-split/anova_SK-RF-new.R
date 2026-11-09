#Hyperparameter Tuning - Artigo 
#ANOVA e Scott-Knott 
#Autor: Andr? Luiz C. Ottoni
#Data: Dezembro de 2023

#Limpa dados
rm(list=ls())

#-----------------Leitura dos dados
dados <- read.delim("C:/Dados/DriveUFRB/Dados/Pesquisa/Hypertuning/Artigo-Wirelles/novaanalise04072024/dados0407.txt")
attach(dados)

#-------------------Pacotes 
#Scott-Knott Clustering Algorithm
library(ScottKnott)

#------------------Modelos de ANOVA
modelo<-aov(yrmse~factor(Comb))

modelo1<-aov(yrmse~factor(maxdepth)*factor(maxsamples)*factor(maxleafnodes))
modelo2<-aov(yrmse~factor(maxsamples)*factor(maxdepth)*factor(maxleafnodes))
modelo3<-aov(yrmse~factor(maxleafnodes)*factor(maxsamples)*factor(maxdepth))


#Informa??es do Modelo
summary(modelo)
summary(modelo1)
summary(modelo2)
summary(modelo3)

#-----------Teste de Normalidade e Homogeneidade

#Normalidade dos Res?duos 
ks.test(resid(modelo),'pnorm',mean(resid(modelo)),sd(resid(modelo)))
ks.test(resid(modelo1),'pnorm',mean(resid(modelo1)),sd(resid(modelo1)))
ks.test(resid(modelo2),'pnorm',mean(resid(modelo2)),sd(resid(modelo2)))
ks.test(resid(modelo3),'pnorm',mean(resid(modelo3)),sd(resid(modelo3)))

#Teste de Homogeneidade 
bartlett.test(yrmse~factor(Comb))
bartlett.test(yrmse~interaction(maxdepth,maxsamples,maxleafnodes))

#Res?duos do Modelo
residuals(modelo)
plot(residuals(modelo),     
     xlab = "Observation Order",
     ylab = "Residual",
     cex.main = 0.9,
     font = 1,
     family = "serif")
hist(residuals(modelo),      
     xlab = "Residuals",
     main = "Histogram of Residuals",
     cex.main = 0.9,
     font = 1,
     family = "serif")

#-------Scott-Knott - Grupos de Hiperpar?metros

sk <- SK(modelo) #Combina??es
sk1 <- SK(modelo1) #Max Depth
sk2 <- SK(modelo2) #Max Samples
sk3 <- SK(modelo3) #Max Leaf Nodes

summary(sk)
summary(sk1)
summary(sk2)
summary(sk3)

#Gr?ficos dos grupos
#Gr?fico das Combina??es
plot(sk,
     col=rainbow(max(sk$groups)),
     rl=FALSE,
     id.las=2,
     cex.main = 0.9,
     title="",
     font = 1,
     family = "serif",
     xlab = "Hyperparameter Combinations",
     ylab = "RMSE (mean)")
#Gr?fico de Max Depth
plot(sk1,
     col=rainbow(max(sk1$groups)),
     rl=FALSE,
     id.las=2,
     cex.main = 0.9,
     title="",
     font = 1,
     family = "serif",
     xlab = "Max Depth",
     ylab = "RMSE (mean)")
#Gr?fico de Max Samples
plot(sk2,
     col=rainbow(max(sk2$groups)),
     rl=FALSE,
     id.las=2,
     cex.main = 0.9,
     title="",
     font = 1,
     family = "serif",
     xlab = "Max Samples",
     ylab = "RMSE (mean)")
#Gr?fico de Max Leaf Nodes
plot(sk3,
     col=rainbow(max(sk3$groups)),
     rl=FALSE,
     id.las=2,
     cex.main = 0.9,
     title="",
     font = 1,
     family = "serif",
     xlab = "Max Leaf Nodes",
     ylab = "RMSE (mean)")


#factor(maxdepth)*factor(maxsamples)*factor(maxleafnodes)
#SK.nest: para modelo fatorial 
nsk<-SK.nest(modelo2,
             which='factor(maxdepth):factor(maxsamples)',
             fl1 =3)
summary(nsk)
plot(nsk, 
     title="",
     xlab = "Max Depth X Max Samples",
     ylab = "MAE (mean)")

nsk2<-SK.nest(modelo3,
             which='factor(maxdepth):factor(maxleafnodes)',
             fl1 =3)
summary(nsk2)
plot(nsk2,   
     title="",
     xlab = "Max Depth X Max Leaf Nodes",
     ylab = "MAE (mean)")

#-----------------------------------

boxplot(yrmse~factor(Comb))

#------------------------------------

