getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#4.Gia tri thu thap theo chau luc
con_data<-dplyr::count(sim_con,continent)
colnames(con_data)[2]<-"Observations"
all_con<-c("All",sum(con_data$Observations))
con_full<-rbind(con_data,all_con)

