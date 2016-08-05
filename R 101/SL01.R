# Script para iniciar uso de R a través de un ejemplo con Second Life
# Datos capturados desde: https://marketplace.secondlife.com/
# 
# @date August 5, 2016
# @author Denis Parra

# Version de R y paquetes por defecto
sessionInfo()

# Carguemos el archivo
# CARGAR ARCHIVOS ----
getwd() # if necessary setwd() setwd("~/Documents/github/DataScience-Day1/R 101")
dfsl <- read.csv(file="sl_products_dsdpuc.csv", header = TRUE, stringsAsFactors = FALSE)

# ¿ Qué variables/campos/columnas describen a este archivo ?
names(dfsl)
str(dfsl)

# Cómo veo un resumen rápido de esta información, por ejemplo
# medidas de tendencia central ?
summary(dfsl)

# Es esa la mejor forma? (Hint: No -> paquete psych)
# PSYCH/describe ----
install.packages("psych")
library(psych)
describe(dfsl)

# se ve bien, pero algunas columnas no tienen sentido, cómo elegir las columnas
# filtrar por columna
describe( dfsl[ ,c("description_polarity","product_avg_rating") ] )
describe( dfsl[ ,c(4,5) ] ) # lo mismo, con indices numerico

# filtremos algunas filas: removamos productos que no tienen ratings
describe( dfsl[ product_n_ratings > 10 , c(4,5) ] )
# Problemas? usar attach() o usar siempre el dataframe
describe( dfsl[ dfsl$product_n_ratings > 10 , c(4,5) ] )

pairs.panels(dfsl[ dfsl$product_n_ratings > 20 , c(3,4,5,6) ], pch=21, jiggle = TRUE)

# CATEGORIAS ----
# para usar categorias necesitamos tener tipo factor
# usemos product_category
dfsl$product_category <- factor(dfsl$product_category)

describeBy( dfsl[ dfsl$product_n_ratings > 10 , c(4,5) ], dfsl[ dfsl$product_n_ratings > 10 ,  ]$product_category)

violinBy(dfsl[ , c(4,5) ], dfsl$product_category,grp.name=c("An","Ar","AuVi","Sc","V"),main="Density Plot by product categories")
error.bars(dfsl[,5])
error.bars.by( dfsl[,5], dfsl$product_category )

# Podemos hacer un test de Hipotesis?
# Compares Audio/Video contra scripts
hist(dfsl[,4])
hist(dfsl[dfsl$product_category == "Vehicles",4])
hist(dfsl[dfsl$product_category == "Scripts",4])

t.test(dfsl[dfsl$product_category == "Vehicles",4], dfsl[dfsl$product_category == "Scripts",4]) # polarity
t.test(dfsl[dfsl$product_category == "Vehicles",5], dfsl[dfsl$product_category == "Scripts",5]) # rating

pairwise.t.test(dfsl$description_polarity,dfsl$product_category)
pairwise.t.test(dfsl$description_polarity,dfsl$product_category, p.adjust.method = "bonferroni")
pairwise.t.test(dfsl$product_avg_rating,dfsl$product_category, p.adjust.method = "bonferroni")

# Y una regresion lineal?
# tratemos de predecir rating en funcion de otras variables 

lm1 <- lm( product_avg_rating ~ product_category + description_polarity + product_price_cat + permissions ,data=dfsl)

summary(lm1)

# Cómo visualizar el efecto de al menos una IV sobre la DV?
plot( dfsl$description_polarity, dfsl$product_avg_rating, xlab="Sentiment Polarity", ylab="Avg Rating", xlim=c(-1,1), ylim=c(0,5), main="Sentiment Polarity vs Ratings", pch=".", cex.main=1.5, frame.plot=FALSE, col=ifelse(dfsl$product_category == "Vehicles", "red", ifelse(dfsl$product_category == "Scripts","blue","gray") ) )
lm1<-lm(product_avg_rating ~ description_polarity, data = dfsl[dfsl$product_category == "Vehicles",])
abline(lm1 ,col="red")
lm2 <- lm( product_avg_rating ~ description_polarity, data = dfsl[dfsl$product_category == "Scripts",])
abline(lm2 ,col="blue")

