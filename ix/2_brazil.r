brazil<-subset(owid_covid_data,location=="Brazil")
brazil$date<-format(as.Date(brazil$date, format = "%m/%d/%Y"), "%Y-%m-%d")
brazil$year <- strftime(brazil$date, "%Y")    
brazil$month <- strftime(brazil$date, "%m")
brazil$dates<- strftime(brazil$date, "%d")

brazil_2020<-subset(brazil,(year=="2020"))
brazil_2021<-subset(brazil,(year=="2021"))
brazil_2022<-subset(brazil,(year=="2022"))

brazil_2020_9<-subset(brazil_2020,(month=="09"))
brazil_2020_10<-subset(brazil_2020,(month=="10"))
brazil_2020_7<-subset(brazil_2020,(month=="07"))

brazil_2021_1<-subset(brazil_2021,(month=="01"))
brazil_2021_9<-subset(brazil_2021,(month=="09"))
brazil_2021_10<-subset(brazil_2021,(month=="10"))
brazil_2021_7<-subset(brazil_2021,(month=="07"))

brazil_2022_1<-subset(brazil_2022,(month=="01"))

library(ggplot2)

ggplot(brazil_2020_9,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 9/2020 cua Brazil") + geom_smooth()
print(cor(brazil_2020_9$new_cases,brazil_2020_9$new_deaths))

ggplot(brazil_2020_10,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 10/2020 cua Brazil") +  geom_smooth()
print(cor(brazil_2020_10$new_cases,brazil_2020_10$new_deaths)) 

ggplot(brazil_2020_7,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 7/2020 cua Brazil") + geom_smooth()
print(cor(brazil_2020_7$new_cases,brazil_2020_7$new_deaths)) 

ggplot(brazil_2021_1,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 1/2021 cua Brazil") + geom_smooth()
print(cor(brazil_2021_1$new_cases,brazil_2021_1$new_deaths)) 

ggplot(brazil_2021_9,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 9/2021 cua Brazil")+ geom_smooth()
print(cor(brazil_2021_9$new_cases,brazil_2021_9$new_deaths)) 

ggplot(brazil_2021_10,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 10/2021 cua Brazil")+  geom_smooth()
print(cor(brazil_2021_10$new_cases,brazil_2020_10$new_deaths)) 

ggplot(brazil_2021_7,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 7/2021 cua Brazil")+ geom_smooth()
print(cor(brazil_2021_7$new_cases,brazil_2021_7$new_deaths)) 

ggplot(brazil_2022_1,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 1/2022 cua Brazil")+ geom_smooth()
print(cor(brazil_2022_1$new_cases,brazil_2022_1$new_deaths)) 