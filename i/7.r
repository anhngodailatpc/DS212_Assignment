getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#7.Chau luc co luong du lieu thu thap lon nhat
con_data[which.max(con_data$Observations),]
