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
library(fmsb)
library(tidyr)
library(LDheatmap)
library(grid)
library(RColorBrewer)


##############################################################################/
#loading the bioassay dataset####
##############################################################################/

#load the dataset
dataDroz<-read.table("data/droso_data.txt",header=T,sep="\t",
                     stringsAsFactors=TRUE)

#creation of variable to distinguish between male and female and time 
#of exposure to pesticide
dataDroz<-cbind(dataDroz,"repet"=paste(dataDroz$date,dataDroz$sex, 
                                       dataDroz$exposition))


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