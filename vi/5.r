library(ggplot2)

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

BRA_DATA <- BRA
BRA_DATA$new_cases<-abs(BRA_DATA$new_cases)
BRA_DATA$new_deaths<-abs(BRA_DATA$new_deaths)
BRA_DATA$date<-format(as.Date(BRA_DATA$date, format = "%m/%d/%Y"), "%Y-%m-%d")
BRA_DATA$year <- strftime(BRA_DATA$date, "%Y")    
BRA_DATA$month <- strftime(BRA_DATA$date, "%m")
BRA_DATA$dates<- strftime(BRA_DATA$date, "%d")
BRA_DATA$new_cases_tb<-m(BRA_DATA$new_cases)
BRA_DATA$new_cases_tb<-ceiling(BRA_DATA$new_cases_tb)
BRA_DATA$new_deaths_tb<-m(BRA_DATA$new_deaths)
BRA_DATA$new_deaths_tb<-ceiling(BRA_DATA$new_deaths_tb)
BRA_DATA_2tc<-subset(BRA_DATA,(month=="11")|(month=="12"))
BRA_DATA_2tc_2020<-subset(BRA_DATA_2tc,(year=="2020"))
BRA_DATA_2tc_2021<-subset(BRA_DATA_2tc,(year=="2021"))

ggplot()+geom_line(data=BRA_DATA_2tc_2020, aes(x=date, y=new_deaths_tb,group=1,col="red"))+scale_x_discrete(breaks=c("2020-11-01","2020-12-01","2020-12-31"))+labs(title = "Bieu do the hien thu thap tu vong o Brazil thang 11,12/2020",x="Thoi gian", y="So ca tu vong moi")
ggplot()+geom_line(data=BRA_DATA_2tc_2021, aes(x=date, y=new_deaths_tb,group=1,col="red"))+scale_x_discrete(breaks=c("2021-11-01","2021-12-01","2021-12-31"))+labs(title = "Bieu do the hien thu thap tu vong o Brazil thang 11,12/2021",x="Thoi gian", y="So ca tu vong moi")


CHL_DATA <- CHL
CHL_DATA$new_cases<-abs(CHL_DATA$new_cases)
CHL_DATA$new_deaths<-abs(CHL_DATA$new_deaths)
CHL_DATA$date<-format(as.Date(CHL_DATA$date, format = "%m/%d/%Y"), "%Y-%m-%d")
CHL_DATA$year <- strftime(CHL_DATA$date, "%Y")    
CHL_DATA$month <- strftime(CHL_DATA$date, "%m")
CHL_DATA$dates<- strftime(CHL_DATA$date, "%d")
CHL_DATA$new_cases_tb<-m(CHL_DATA$new_cases)
CHL_DATA$new_cases_tb<-ceiling(CHL_DATA$new_cases_tb)
CHL_DATA$new_deaths_tb<-m(CHL_DATA$new_deaths)
CHL_DATA$new_deaths_tb<-ceiling(CHL_DATA$new_deaths_tb)
CHL_DATA_2tc<-subset(CHL_DATA,(month=="11")|(month=="12"))
CHL_DATA_2tc_2020<-subset(CHL_DATA_2tc,(year=="2020"))
CHL_DATA_2tc_2021<-subset(CHL_DATA_2tc,(year=="2021"))

ggplot()+geom_line(data=CHL_DATA_2tc_2020, aes(x=date, y=new_deaths_tb,group=1,col="red"))+scale_x_discrete(breaks=c("2020-11-01","2020-12-01","2020-12-31"))+labs(title = "Bieu do the hien thu thap tu vong o Chile thang 11,12/2020",x="Thoi gian", y="So ca tu vong moi")
ggplot()+geom_line(data=CHL_DATA_2tc_2021, aes(x=date, y=new_deaths_tb,group=1,col="red"))+scale_x_discrete(breaks=c("2021-11-01","2021-12-01","2021-12-31"))+labs(title = "Bieu do the hien thu thap tu vong o Chile thang 11,12/2021",x="Thoi gian", y="So ca tu vong moi")


VEN_DATA <- VEN
VEN_DATA$new_cases<-abs(VEN_DATA$new_cases)
VEN_DATA$new_deaths<-abs(VEN_DATA$new_deaths)
VEN_DATA$date<-format(as.Date(VEN_DATA$date, format = "%m/%d/%Y"), "%Y-%m-%d")
VEN_DATA$year <- strftime(VEN_DATA$date, "%Y")    
VEN_DATA$month <- strftime(VEN_DATA$date, "%m")
VEN_DATA$dates<- strftime(VEN_DATA$date, "%d")
VEN_DATA$new_cases_tb<-m(VEN_DATA$new_cases)
VEN_DATA$new_cases_tb<-ceiling(VEN_DATA$new_cases_tb)
VEN_DATA$new_deaths_tb<-m(VEN_DATA$new_deaths)
VEN_DATA$new_deaths_tb<-ceiling(VEN_DATA$new_deaths_tb)
VEN_DATA_2tc<-subset(VEN_DATA,(month=="11")|(month=="12"))
VEN_DATA_2tc_2020<-subset(VEN_DATA_2tc,(year=="2020"))
VEN_DATA_2tc_2021<-subset(VEN_DATA_2tc,(year=="2021"))

ggplot()+geom_line(data=VEN_DATA_2tc_2020, aes(x=date, y=new_deaths_tb,group=1,col="red"))+scale_x_discrete(breaks=c("2020-11-01","2020-12-01","2020-12-31"))+labs(title = "Bieu do the hien thu thap tu vong o Venezuela thang 11,12/2020",x="Thoi gian", y="So ca tu vong moi")
ggplot()+geom_line(data=VEN_DATA_2tc_2021, aes(x=date, y=new_deaths_tb,group=1,col="red"))+scale_x_discrete(breaks=c("2021-11-01","2021-12-01","2021-12-31"))+labs(title = "Bieu do the hien thu thap tu vong o Venezuela thang 11,12/2021",x="Thoi gian", y="So ca tu vong moi")

