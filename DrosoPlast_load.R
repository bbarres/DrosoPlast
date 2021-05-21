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
dataDroPla<-read.table(file="data/dsuz23.txt",
                       header=T,sep=";")



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