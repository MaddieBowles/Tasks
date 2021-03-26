#Hypothesis 1 - Tusk size has declined over the years due to poaching, so smaller tusk sizes have been selected for as they are more likely to survive illegal poaching. 
#Apparently poaching didn't get bad until after the 1960s. This looks at tusk size over time, space, and different species. 

setwd('C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Hypothesis')
folder <- "C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Hypothesis"
file_list <- list.files(path=folder, pattern="*.csv")
Data <- read.csv ('C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Hypothesis\\Black et al. 2019 Head Measurements.csv',stringsAsFactors=F) 


head(Data)
tail(Data)

AfricanData <- read.csv('C:\\Users\\maddi\\Desktop\\Evolution\\Tasks\\Hypothesis\\African Elephants 1\\Head Measurements.csv')
African Data 1 <- which(AfricanData$Year 