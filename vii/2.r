library(readr)
library(tidyverse)
library(dbplyr)
library(ggplot2)

owid_covid_data<-read.csv ("owid-covid-data.csv", header=TRUE)
owid_covid_data[is.na(owid_covid_data)]<- 0
#Seperate data for 1,2
owid_covid_data$new_cases<-abs(owid_covid_data$new_cases)
owid_covid_data$new_deaths<-abs(owid_covid_data$new_deaths)
owid_covid_data$date<-format(as.Date(owid_covid_data$date, format = "%m/%d/%Y"), "%Y-%m-%d")
owid_covid_data$year <- strftime(owid_covid_data$date, "%Y")    
owid_covid_data$month <- strftime(owid_covid_data$date, "%m")
vii<-subset(owid_covid_data, (month=="01")|(month=="07")|(month=="09")|(month=="10"))
vii<-summarise(vii, date, new_cases, new_deaths, month, year)
names(vii)<-c("date", "new_cases", "new_deaths", "month", "year")
View(vii)

vii_2020<-subset(vii, (year=="2020"))
vii_2020<-aggregate(cbind(vii_2020$new_cases, vii_2020$new_deaths), by = list (Date = vii_2020$date), FUN=sum)
vii_2021<-subset(vii, (year=="2021"))
vii_2021<-aggregate(cbind(vii_2021$new_cases, vii_2021$new_deaths), by = list (Date = vii_2021$date), FUN=sum)
vii_2022<-subset(vii, (year=="2022"))
vii_2022<-aggregate(cbind(vii_2022$new_cases, vii_2022$new_deaths), by = list (Date = vii_2022$date), FUN=sum)

#2020
plot(vii_2020$V2[1:31], type = "l", col = "red", ylim = c(0, max(vii_2020$V2)), xlab = "Day", ylab = "New deaths", main = "New deaths in the world in 2020")
lines(vii_2020$V2[32:62], col = "yellow", type = "l")
lines(vii_2020$V2[63:92], col = "green", type = "l")
lines(vii_2020$V2[93:123], col = "blue", type = "l")
legend("topleft", legend = c("January", "July", "September", "October"), lty = 1, col = c("red","yellow", "green", "blue"), ncol = 1, bty = "o", text.col = c("red","yellow", "green", "blue"))
#2021
plot(vii_2021$V2[1:31], type = "l", col = "red", ylim = c(0, max(vii_2021$V2)), xlab = "Day", ylab = "New deaths", main = "New deaths in the world in 2021")
lines(vii_2021$V2[32:62], col = "yellow", type = "l")
lines(vii_2021$V2[63:92], col = "green", type = "l")
lines(vii_2021$V2[93:123], col = "blue", type = "l")
legend("bottomright", legend = c("January", "July", "September", "October"), lty = 1, col = c("red","yellow", "green", "blue"), ncol = 1, bty = "o", text.col = c("red","yellow", "green", "blue"))
#2022
plot(vii_2022$V2, type = "l", col = "red", ylim = c(0, max(vii_2022$V2)), xlab = "Day", ylab = "New deaths", main = "New deaths in the world in 2022")
legend("topleft", legend = c("January"), lty = 1, col = c("red"), ncol = 1, bty = "o", text.col = c("red"))

