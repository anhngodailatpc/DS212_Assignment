getwd()
install.packages("lubridate")
install.packages("dplyr")
library(lubridate)
library(dplyr)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)
#1.Du lieu duoc thu thap vao cac nam
covid_data$date<-as.Date(covid_data$date,format="%m/%d/%Y")
year_fac=unique(factor(year(covid_data$date)))
year_fac