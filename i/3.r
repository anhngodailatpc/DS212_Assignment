getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#3.So luong chau luc trong tap mau
sim_con<-subset(covid_data,continent!="")
continent_fac<-factor(unique(sim_con$continent))
by_continent<-data.frame(continent_fac)
names(by_continent)<-"continent"
vie_con<-c("Chau A","Chau Au","Chau Phi","Bac My","Nam My","Chau Dai Duong")
continent_count<-nlevels(continent_fac)
by_continent$vie_con<-vie_con
colnames(by_continent)[2]<-as.character(continent_count)
