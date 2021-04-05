setwd("C://Users//maddi//Desktop//Evolution//Tasks//Task_08")

library(phytools)
tree <- read.tree("https://jonsmitchell.com/data/anolis.tre")
plot(tree, type="fan")

tree$tip.label

#Q2: 
#82 tip labels are present 

data <- read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors=F, row.names=1)
head(data)
data
dim(data)

#Q2:
#This is the Anolis species and each of their snout lengths, it is 82x1 

svl <- setNames(data$svl, rownames(data))
svl

ancestors <- fastAnc(tree, svl, vars=TRUE, CI=TRUE)
ancestors
head(ancestors)
?fastAnc

#Q3:
# The CI95 is a value indicating whether a 95% confidence interval should be used, 
# and the data from the "re-rooting" of already calculated internal nodes are stored as a list already

#Q4:
# First assumption is using a 95% confidence interval and the second is that the state 
# computed root node and the MLE from the contrast algorithm is the same 

par(mar=c(0.1, 0.1, 0.1, 0.1))
plot(tree, type="fan", lwd=2, show.tip.label=F)
tiplabels(pch=16, cex=0.25*sv1[tree$tip.label])
nodelabels(pch=16, cex=0.25*ancestors$ace)

obj <- contMap(tree, svl, plot=F)
plot(obj, type="fan", legend=0.7*max(nodeHeights(tree)), sig=2, fsize=c(0.7, 0.9))

fossilData <- data.frame(svl=log(c(25.4, 23.2, 17.7, 19.7, 24, 31)), tip1=c("Anolis_aliniger", "Anolis_aliniger", "Anolis_occultus", "Anolis_ricordii", "Anolis_cristatellus", "Anolis_occultus"), tip2=c("Anolis_chlorocyanus", "Anolis_coelestinus", "Anolis_hendersoni", "Anolis_cybotes", "Anolis_angusticeps", "Anolis_angusticeps"))

#Q5:

fossilNodes <- c()
nodeN <- c()
{
for(i in 1:nrow(fossilData))
if (i == 1)
i <- 1
print(ancestors)
}
}
Node <- fastMRCA(tree, fossilData[i, "tip1"], fossilData[i, "tip2"])
fossilNodes[i] <- fossilData[i, "sv1"]
nodeN[i] <- Node
names(fossilNodes) <- nodeN

AncestorswithFossils <- fastAnc(tree, sv1, anc.states=fossilNodes, c1=TRUE, car=TRUE)



#Q8-10
# EB has the best fit of the data where it has the lowest AIC number
# BM is used in fastAnc to make its assumptions 

install.packages('geiger')
library(geiger)
?fitContinuous
?fastAnc

fitContinuous(tree, svl, model='EB')
fitContinuous(tree, svl, model='BM')
fitContinuous(tree, svl, model='OU')


fitContinuous(tree, svl, model='rate_trend')
fitContinuous(tree, svl, model='lambda')



