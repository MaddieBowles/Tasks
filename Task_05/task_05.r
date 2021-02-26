setwd('C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Task_05')

install.packages("learnPopGen")
library(learnPopGen)
install.packages("coala")
library(coala)
install.packages("phytools")
library(phytools)
??coalescent.plot

coalescent.plot(n=5, ngen=10, colors=NULL)
avg <- mean(coalescent.plot(n=5, ngen=10, colors=NULL))
#yeah, no, this didn't work like I hoped it would

coalescent.plot(n=10, ngen=10, colors=NULL)
coalescent.plot(n=5, ngen=15, colors=NULL)
coalescent.plot(n=10, ngen=15, colors=NULL)

#1. Each of the individuals are haploid, so the number of alleles depends on your individuals
#in this case I have 5-10 individuals listed between the plots (n=5, n= 10)

#2. It takes anywhere between 5-10 generations to go to fixation (I've found 
# this also depends on population size, like a population of 100 will take longer to go to fixation than 10)

#3. Using the first plot, I found an average of about 1 offspring and a variance of about 0.76

#4. The fitness of each allele originally starts with the same frequency at gen 0
# then as the generations continue, one or two alleles begin to have a higher fitness 
# which eventually leads to fixation of an allele by generation 5-10

# If we're talking about the locus that goes to fixation by generation 10 then yes, it is possible
# that the MCRA was present in generation 0


model <- coal_model(sample_size = 5, loci_number = 10, loci_length = 500, ploidy = 2) +
feat_mutation(10) +
feat_recombination(10) +
sumstat_trees()+
sumstat_nucleotide_div()

stats <- simulate(model, nsim = 1)
head(stats)
Diversity <- stats$pi
Diversity
Nloci <- length(stats$trees)
t1 <- read.tree (text = stats$trees[[1]][1])
plot(t1)
axisPhylo()

#Question 6
# Maybe my sample size is how many I started with in the  0 generation and then it went another 
# generation to end up at 10

Age1 <- max(nodeHeights(t1))
t2 <- read.tree(text=stats$trees[[2]][1])
plot(t2)
axisPhylo()

# Question 7
# They have the same number of starting samples and ending points but the way they connect is different

par(mfrow=c(1, 2))
plot(t1)
axisPhylo()
plot(t2)
axisPhylo()
compare.chronograms(t1, t2)

t1_1 <- read.tree(text=stats$trees[[1]][1])
t1_2 <- read.tree(text=stats$trees[[1]][2])
compare.chronograms(t1_1, t1_2)

??read.tree

for(locus in 1:Nloci) {
ntrees <- length(stats$trees[[locus]])
for(n in 1:ntrees) {
if (locus == 1 && n==3) {
outPhy <- read.tree(text = stats$trees[[locus]][n])
}
else {
outPhy <- ape ::: c.phylo(outPhy, read.tree(text=stats$trees[[locus]][n]))
}
}
}
par(mfrow=c(1,1))
densityTree(outPhy)

#this is in no way doing what I think it will do

model3 <- coal_model(10, 50) +
feat_mutation (par_prior("theta", sample.int(100, 1))) +
sumstat_nucleotide_div()
stats <- simulate(model3, nsim = 40)
meanpi <- sapply(stats, function(x) mean(x$pi))
theta <- sapply(stats, function(x) x$pars[["theta"]])

plot(meanpi, theta, pch=16, cex = 1.3, col = "blue", main = "Meanpi vs Theta")
abline(lm(meanpi ~ theta))
