owid_covid_data<-read.csv ("owid-covid-data.csv", header=TRUE) 
owid_covid_data[is.na(owid_covid_data)]<- 0
owid_covid_data$new_cases<-abs(owid_covid_data$new_cases)
owid_covid_data$new_deaths<-abs(owid_covid_data$new_deaths)

m<-function(x){
  n <- length(x)
  y <- rep(0,n)
  for (i in 1:n){
    if (i <= 6){
      y[i] = mean(x[1:i])
    }else{
      y[i] = mean(x[(i-6):i])
    }
  }
  y
}


chile<-subset(owid_covid_data,location=="Chile")
chile$date<-format(as.Date(chile$date, format = "%m/%d/%Y"), "%Y-%m-%d")
chile$year <- strftime(chile$date, "%Y")    
chile$month <- strftime(chile$date, "%m")
chile$dates<- strftime(chile$date, "%d")

chile$new_cases_tb<-m(chile$new_cases)
chile$new_cases_tb<-ceiling(chile$new_cases_tb)
chile$new_deaths_tb<-m(chile$new_deaths)
chile$new_deaths_tb<-ceiling(chile$new_deaths_tb)

chile_2020<-subset(chile,(year=="2020"))
chile_2021<-subset(chile,(year=="2021"))
chile_2022<-subset(chile,(year=="2022"))

chile_2020_9<-subset(chile_2020,(month=="09"))
chile_2020_10<-subset(chile_2020,(month=="10"))
chile_2020_7<-subset(chile_2020,(month=="07"))

chile_2021_1<-subset(chile_2021,(month=="01"))
chile_2021_9<-subset(chile_2021,(month=="09"))
chile_2021_10<-subset(chile_2021,(month=="10"))
chile_2021_7<-subset(chile_2021,(month=="07"))

chile_2022_1<-subset(chile_2022,(month=="01"))

library(ggplot2)

ggplot(chile_2020_7,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 7/2020 cua chile") + geom_smooth()
print(cor(chile_2020_7$new_cases_tb,chile_2020_7$new_deaths_tb)) 

ggplot(chile_2020_9,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 9/2020 cua chile") + geom_smooth()
print(cor(chile_2020_9$new_cases_tb,chile_2020_9$new_deaths_tb))

ggplot(chile_2020_10,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 10/2020 cua chile") +  geom_smooth()
print(cor(chile_2020_10$new_cases_tb,chile_2020_10$new_deaths_tb)) 



ggplot(chile_2021_1,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 1/2021 cua chile") + geom_smooth()
print(cor(chile_2021_1$new_cases_tb,chile_2021_1$new_deaths_tb)) 

ggplot(chile_2021_7,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 7/2021 cua chile")+ geom_smooth()
print(cor(chile_2021_7$new_cases_tb,chile_2021_7$new_deaths_tb)) 

ggplot(chile_2021_9,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 9/2021 cua chile")+ geom_smooth()
print(cor(chile_2021_9$new_cases_tb,chile_2021_9$new_deaths_tb)) 

ggplot(chile_2021_10,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 10/2021 cua chile")+  geom_smooth()
print(cor(chile_2021_10$new_cases_tb,chile_2021_10$new_deaths_tb)) 



ggplot(chile_2022_1,(aes(x=new_cases_tb,y=new_deaths_tb)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 1/2022 cua chile")+ geom_smooth()
print(cor(chile_2022_1$new_cases_tb,chile_2022_1$new_deaths_tb))




