getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#9.Nuoc co luong du lieu thu thap lon nhat
iso_data[which.max(iso_data$Observations),]
