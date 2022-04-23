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
BRA_DATA_Made<-subset(BRA_DATA,(month=="01")|(month=="07")|(month=="09")|(month=="10"))
BRA_DATA_Made_2020<-subset(BRA_DATA_Made,(year=="2020"))
BRA_DATA_Made_2021<-subset(BRA_DATA_Made,(year=="2021"))
BRA_DATA_Made_2022<-subset(BRA_DATA_Made,(year=="2022"))

ggplot(BRA_DATA_Made_2020,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao cac thang 03,06,07-2020 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 
ggplot(BRA_DATA_Made_2021,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao cac thang 01,03,06,07-2021 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 
ggplot(BRA_DATA_Made_2022,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao thang 01-2022 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 


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
CHL_DATA_Made<-subset(CHL_DATA,(month=="01")|(month=="07")|(month=="09")|(month=="10"))
CHL_DATA_Made_2020<-subset(CHL_DATA_Made,(year=="2020"))
CHL_DATA_Made_2021<-subset(CHL_DATA_Made,(year=="2021"))
CHL_DATA_Made_2022<-subset(CHL_DATA_Made,(year=="2022"))

ggplot(CHL_DATA_Made_2020,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao cac thang 03,06,07-2020 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 
ggplot(CHL_DATA_Made_2021,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao cac thang 01,03,06,07-2021 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 
ggplot(CHL_DATA_Made_2022,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao thang 01-2022 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 


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
VEN_DATA_Made<-subset(VEN_DATA,(month=="01")|(month=="07")|(month=="09")|(month=="10"))
VEN_DATA_Made_2020<-subset(VEN_DATA_Made,(year=="2020"))
VEN_DATA_Made_2021<-subset(VEN_DATA_Made,(year=="2021"))
VEN_DATA_Made_2022<-subset(VEN_DATA_Made,(year=="2022"))

ggplot(VEN_DATA_Made_2020,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao cac thang 03,06,07-2020 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 
ggplot(VEN_DATA_Made_2021,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao cac thang 01,03,06,07-2021 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 
ggplot(VEN_DATA_Made_2022,(aes(x = dates, y = new_deaths_tb))) + geom_line(aes(color = month),group=1) +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap tu vong vao thang 01-2022 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca tu vong",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31")) 

