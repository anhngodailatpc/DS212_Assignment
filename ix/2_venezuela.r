venezuela<-subset(owid_covid_data,location=="Venezuela")
venezuela$date<-format(as.Date(venezuela$date, format = "%m/%d/%Y"), "%Y-%m-%d")
venezuela$year <- strftime(venezuela$date, "%Y")    
venezuela$month <- strftime(venezuela$date, "%m")
venezuela$dates<- strftime(venezuela$date, "%d")

venezuela_2020<-subset(venezuela,(year=="2020"))
venezuela_2021<-subset(venezuela,(year=="2021"))
venezuela_2022<-subset(venezuela,(year=="2022"))

venezuela_2020_9<-subset(venezuela_2020,(month=="09"))
venezuela_2020_10<-subset(venezuela_2020,(month=="10"))
venezuela_2020_7<-subset(venezuela_2020,(month=="07"))

venezuela_2021_1<-subset(venezuela_2021,(month=="01"))
venezuela_2021_9<-subset(venezuela_2021,(month=="09"))
venezuela_2021_10<-subset(venezuela_2021,(month=="10"))
venezuela_2021_7<-subset(venezuela_2021,(month=="07"))

venezuela_2022_1<-subset(venezuela_2022,(month=="01"))

library(ggplot2)

ggplot(venezuela_2020_7,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 7/2020 cua venezuela") + geom_smooth()
print(cor(venezuela_2020_7$new_cases,venezuela_2020_7$new_deaths)) 

ggplot(venezuela_2020_9,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 9/2020 cua venezuela") + geom_smooth()
print(cor(venezuela_2020_9$new_cases,venezuela_2020_9$new_deaths))

ggplot(venezuela_2020_10,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 10/2020 cua venezuela") +  geom_smooth()
print(cor(venezuela_2020_10$new_cases,venezuela_2020_10$new_deaths)) 



ggplot(venezuela_2021_1,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 1/2021 cua venezuela") + geom_smooth()
print(cor(venezuela_2021_1$new_cases,venezuela_2021_1$new_deaths)) 


ggplot(venezuela_2021_7,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 7/2021 cua venezuela")+ geom_smooth()
print(cor(venezuela_2021_7$new_cases,venezuela_2021_7$new_deaths)) 

ggplot(venezuela_2021_9,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 9/2021 cua venezuela")+ geom_smooth()
print(cor(venezuela_2021_9$new_cases,venezuela_2021_9$new_deaths)) 

ggplot(venezuela_2021_10,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 10/2021 cua venezuela")+  geom_smooth()
print(cor(venezuela_2021_10$new_cases,venezuela_2020_10$new_deaths)) 




ggplot(venezuela_2022_1,(aes(x=new_cases,y=new_deaths)))+geom_point(shape=1, color="blue")+facet_wrap( ~ month)+ ggtitle("Bieu do tuong quan giua ca nhiem va tu vong thang 1/2022 cua venezuela")+ geom_smooth()
print(cor(venezuela_2022_1$new_cases,venezuela_2022_1$new_deaths)) 