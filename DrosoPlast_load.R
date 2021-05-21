##############################################################################/
##############################################################################/
#Data and package loading for the analyses and figures plotting
##############################################################################/
##############################################################################/

#loading the packages necessary for the analysis
library(drc)
library(medrc)
library(plotrix)
library(gdata)
library(tidyr)
library(RColorBrewer)


##############################################################################/
#loading the bioassay dataset####
##############################################################################/

#load the global dataset
dataDroPla<-read.table(file="data/dsuz23.txt",stringsAsFactors=TRUE,
                       header=T,sep=";")

#changing the ID of the drosophila lines
levels(dataDroPla$ech_id)<-c("L8","L6","L1","L5","L2","L4",
                             "R1","R2","R3","R4","R5","R6")
#adding a column for the population
dataDroPla$population<-dataDroPla$ech_id
levels(dataDroPla$population)<-c(rep("Lyon",6),rep("Rennes",6))

#we compute the total number of individual tested and total number of 	
#dead individual for each date	
checkdat<-aggregate(cbind(dead,total)~date+sex+repet,data=dataDroz,"sum")	
checkdat<-checkdat[order(checkdat$repet),]	
plot(checkdat)


##############################################################################/
#Writing info session for reproducibility####
##############################################################################/

sink("session_info.txt")
print(sessioninfo::session_info())
sink()
#inspired by an R gist of François Briatte: 
#https://gist.github.com/briatte/14e47fb0cfb8801f25c889edea3fcd9b


##############################################################################/
#END
##############################################################################/