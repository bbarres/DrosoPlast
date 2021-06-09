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

datDroPlaS<-dataDroPla[dataDroPla$pest_sa_id=="SPINOSAD",]
datDroPlaP<-dataDroPla[dataDroPla$pest_sa_id!="SPINOSAD",]

#model using the nonlinear mixed model for spinosad
modS<-metadrm(nb_mtot/(nb_mtot+nb_vi)~dose,
              data=datDroPlaS,
              ind=ech_id,
              cid2=population,
              fct=LL.3u(),
              type="binomial",
              weights=(nb_mtot+nb_vi),
              struct = "UN")
summary(modS)

#comparison of the CL50 grouped by population
EDcomp(modS,c(50,50))
#no significant differences between populations

#model using the nonlinear mixed model for phosmet
modP<-metadrm(nb_mtot/(nb_mtot+nb_vi)~dose,
              data=datDroPlaP,
              ind=ech_id,
              cid2=population,
              fct=LL.3u(),
              type="binomial",
              weights=(nb_mtot+nb_vi),
              struct = "UN")
summary(modP)

#comparison of the CL50 grouped by population
EDcomp(modP,c(50,50))
#no significant differences between populations



#model for each drosophila lines
mod2<-drm(nb_mtot/(nb_mtot+nb_vi)~dose,
          data=dataDroPla,
          curveid=ech_id,
          fct=LN.3u(),
          type="binomial",
          weights=(nb_mtot+nb_vi))
summary(mod2)

#comparisons of the CL50
compParm(mod2,"e","-")
EDcomp(mod2,c(50,50))

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