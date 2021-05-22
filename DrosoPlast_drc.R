##############################################################################/
##############################################################################/
#Dose response curve analyses
##############################################################################/
##############################################################################/


#loading the packages necessary for the analysis
source("DrosoPlast_load.R")


##############################################################################/
#Model comparing populations####
##############################################################################/

#model using the nonlinear mixed model
mod1<-metadrm(nb_mtot/(nb_mtot+nb_vi)~dose,
              data=dataDroPla,
              ind=ech_id,
              cid2=population,
              fct=LN.3u())
summary(mod1)
#comparison of the CL50
EDcomp(mod1,c(50,50))



# This doesn't work
# dataDroPla$CALC<-dataDroPla$nb_mtot/(dataDroPla$nb_mtot+dataDroPla$nb_vi)
# dataDroPla$dose<-as.numeric(dataDroPla$dose)
# #comparison using the generalized nonlinear least-squares model
# mod2<-medrm(CALC~dose,
#             curveid=b + c + d + e ~ population, 
#             data=dataDroPla, 
#             fct=LN.4(), 
#             random=b + c + d + e ~ 1|ech_id, 
#             start=c(0.5,0.01,1,6,0.5,0.01,1,5))
# summary(mod2)


##############################################################################/
#END
##############################################################################/