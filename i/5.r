getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#5.Gia tri thu thap theo dat nuoc
iso_data<-dplyr::count(sim_nation,iso_code)
colnames(iso_data)[2]<-"Observations"
iso_data<-iso_data%>%arrange(factor(iso_code,levels=by_nation$iso_code))
all_iso<-c("All",sum(iso_data$Observations))
last_10_iso<-tail(iso_data,10)
last_10_iso<-rbind(last_10_iso,all_iso)

