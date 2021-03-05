#Hypothesis 1 - Tusk size (length/weight) gets larger in proportion as the body size gets larger. 

setwd('C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Hypothesis')
folder <- "C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Hypothesis"
file_list <- list.files(path=folder, pattern="*.csv")
Data <- read.csv ('C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Hypothesis\\Black et al. 2019 Head Measurements.csv',stringsAsFactors=F) 


head(Data)
tail(Data)