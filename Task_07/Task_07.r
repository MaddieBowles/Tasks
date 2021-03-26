
library(phytools)
library(ape)

text.string <- "(((((((cow, pig), whale), (bat, (lemur, human))), (robin, iguana)), coelacanth), (gold_fish, trout)), shark);"
vert.tree <- read.tree(text=text.string)
plot(vert.tree, edge.width=2)

nodelabels(frame="circle", bg='white', cex=1)

#The gold fish is more closely related to the human. They have a more recent common ancestor
# at node 14, whereas the shark has a more distant common ancestor at node 13.  

vert.tree

#No, there are no branch lengths. 

str(vert.tree)

tree <- read.tree(text="(((A, B), (C, D)), E);")
tree <- compute.brlen(tree)
plotTree(tree, offset=1)
tiplabels(frame="circle", bg='lightblue', cex=1)
nodelabels(frame="circle", bg='white', cex=1)

#########################################################################################
which(tree$edge.length == min(tree$edge.length))
tree$edge.length
which(tree$edge[,2] <= Ntip(tree))
tree$edge.length[which(tree$edge[,1] <= Ntip(tree))]
tipLengths <- tree$edge.length[which(tree$edge[,2] <= Ntip(tree))] 
which(tipLengths == min(tipLengths))
plot(drop.tip(tree, c(1, 2)))
########################################################################################



AnolisTree<- force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))

par(las=1)
hist(AnolisTree$edge.length, col='black', border='white', main="", xlab="edge lengths for the Anolis tree", ylim=c(0, 50), xlim=c(0, 6))

tipEdges <- which(AnolisTree$edge[,2] <= Ntip(AnolisTree))
Lengths <- AnolisTree$edge.length
names(Lengths) <- AnolisTree$tip.label
names(Lengths)[which(Lengths == min(Lengths))]

plot(AnolisTree, cex=0.25)
Labs <- sapply(AnolisTree$edge.length, round, digits=2)
edgelabels(text=Labs, cex=0.25)

?plot.phylo

#Q3: A tree with no tip labels
tree <- read.tree(text="(((A, B), (C, D)), E);")
tree <- compute.brlen(tree)
plotTree(tree, offset=1, show.tip.label = FALSE)


#Q4: A tree that is plotted as a circle, instead of facing right or left
plot(unroot(vert.tree), type = "unrooted", no.margin = TRUE, lab4ut = "axial", edge.width = 2)



#Q5: A tree with the tips colored red instead of black
tree <- read.tree(text="(((A, B), (C, D)), E);")
tree <- compute.brlen(tree)
plotTree(tree, offset=1)
tiplabels(frame="circle", bg='red', cex=1)
nodelabels(frame="circle", bg='white', cex=1)


#Q6: Which living, named species has the shortest edge length
#Q7: Drop that tip from the tree
#Q8: Plot the resulting tree
which(AnolisTree$edge.length == min(AnolisTree$edge.length))
AnolisTree$edge.length
which(AnolisTree$edge[,0.25] <= Ntip(AnolisTree))
tree$edge.length[which(tree$edge[,0.25] <= Ntip(tree))]
tipLengths <- AnolisTree$edge.length[which(AnolisTree$edge[,0.25] <= Ntip(AnolisTree))] 
which(tipLengths == min(tipLengths))
plot(drop.tip(AnolisTree, c(9, 10)))




ltt(AnolisTree)
abline(0, 1, lwd=2, col='red', lty=2)
#The line grows linearly with time, not exponentially, showing that that new species appear
# frequently over time. If we have new species appearing that makes me think there is not a lot of
# gene flow between certain groups allowing them to differentiate. 

#Q10: 
?fit.bd()
fit.bd(AnolisTree, rho = 0.2)