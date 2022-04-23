getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#2.So dat nuoc va dinh danh cua moi dat nuoc
sim_nation<-subset(covid_data,substr(iso_code,1,5)!="OWID_")
by_nation<-unique(sim_nation[,c("iso_code","location")])
colnames(by_nation)[2]<-"Country"
first_10_nations<-head(by_nation,10)
count_nation<-dim(by_nation)[1]
cnt<-c("Count",as.character(count_nation))
first_10_nations<-rbind(first_10_nations,cnt)
