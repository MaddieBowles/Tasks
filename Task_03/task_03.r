setwd('C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Task_03')

trueMean1 <- 5
trueSD1 <- 5
population1 <- rnorm(1e6, trueMean1, trueSD1)

trueMean2 <- 4
trueSD2 <- 5
population2 <- rnorm(1e6, trueMean2, trueSD2)

Size <- 50
Sample1 <- sample(population1, Size)
Sample2 <- sample(population2, Size)

head(Sample1)
head(Sample2)

source("http://jonsmitchell.com/code/simFxn04.R")

MatGrandma <- makeFounder("grandma_mom")
MatGrandpa <- makeFounder("grandpa_mom")
PatGrandma <- makeFounder("grandma_da")
PatGrandpa <- makeFounder("grandpa_da")

head(MatGrandma)
nrow(MatGrandma)
MatGrandma
#wanted to see how long it was, a mistake 
head(MatGrandpa)

Alan <- makeBaby(PatGrandma, PatGrandpa)
Brenda <- makeBaby(MatGrandma, MatGrandpa)
Focus <- makeBaby(Brenda, Alan)
head(Focus)

ToMom <- length( grep("mom", Focus))/ length(Focus)
ToMomMom <- length( grep("grandma_mom", Focus))/ length(Focus)
ToMomDad <- length(grep("grandpa_mom", Focus))/ length(Focus)

Sibling_01 <- makeBaby(Brenda, Alan)
ToSib <- length(intersect(Focus, Sibling_01))/ length(Focus)
ManySiblings <- replicate(1e3, length(intersect(Focus, makeBaby(Brenda, Alan)))/ length(Focus))

quantile(ManySiblings)
mean(ManySiblings)

plot(density(ManySiblings), main="", xlab="proportion shared genes")
HWE <- function(p) {
aa <- p^2
ab <- 2 * p * (1 - p)
bb <- (1-p)^2
return(c(aa=aa, ab=ab, bb=bb))
}
HWE(0.5)

plot(1, 1, type="n", xlim=c(0, 1), ylim=c(0,1), xlab="freq. allele a", ylab="geno.freq")
p <- seq(from = 0, to =1, by= 0.01)
GenoFreq <- t(sapply(p, HWE))
lines(p, GenoFreq[, "aa"], lwd=2, col="red")
lines(p, GenoFreq[, "ab"], lwd=2, col="purple")
lines(p, GenoFreq[, "bb"], lwd=2, col="blue")
legend("top", legend=c("aa", "ab", "bb"), col=c("red", "purple", "blue"), lty=1, lwd=2, bty="n")
Pop <- simPop(500)

points(Pop[, "freqa"], Pop[,"Genotypes.aa"]/500, pch=21, bg="red")

#I do believe that the points match the expectation, since they follow the hardy-weinberg equilibrium lines 

Pop <- simPop(50)
points(Pop[, "freqa"], Pop[,"Genotypes.aa"]/50, pch=22, bg="red")
#The new smaller population has a higher allele frequency than the larger population. 
#Why?

install.packages("learnPopGen")
library(learnPopGen)
x <- genetic.drift(Ne=200, nrep=5, pause=0.01)
X <- genetic.drift(Ne=100, nrep=5, pause=0.01)
X <- genetic.drift(Ne=200, nrep=2.5, pause=0.01)
X <- genetic.drift(Ne=200, nrep=2.5, pause=0.001)

PopSizes <- 5:50
Samples <- rep(PopSizes, 5)
tExt <- sapply(Samples, function(x) nrow(simPop(x, 500)))
Line <- lm(tExt ~ Samples)
summary(Line)
Line$coef
plot(Samples, tExt)
abline(Line)
Line2 <- lm(tExt ~ Samples + 0)

head(Line2)

#extra credit

install.packages("dplyr")
install.packages("ggplot2")
install.packages("wooldridge")
library(dplyr)
library(ggplot2)
library(wooldridge)

data("saving")
saving <- saving %>%
filter(sav > 0, 
inc < 20000, 
sav < inc)

ggplot(saving, aes(x = inc, y=sav)) +
geom_point() +
geom_smooth(method = "lm", se = FALSE) +
labs(x = "Annual income", y = "Annual Savings")
model <- lm(sav ~ inc, data = saving)
summary(model)
library("lmtest")
library("sandwich")
waldtest(model, model_unres, vcov = vcovHC(model_unres, type ="HC0"))