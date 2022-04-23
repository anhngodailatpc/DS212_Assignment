getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#8.Nuoc co luong du lieu thu thap nho nhat
iso_data$Country<-by_nation$Country
iso_data<-iso_data[,c("iso_code","Country","Observations")]
iso_data[which.min(iso_data$Observations),]