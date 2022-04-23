getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)

#6.Chau luc co luong du lieu thu thap nho nhat
con_data[which.min(con_data$Observations),]
