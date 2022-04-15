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
BRA$new_cases<-abs(BRA$new_cases)
BRA$new_deaths<-abs(BRA$new_deaths)
BRA$date<-format(as.Date(BRA$date, format = "%m/%d/%Y"), "%Y-%m-%d")
BRA$year <- strftime(BRA$date, "%Y")    
BRA$month <- strftime(BRA$date, "%m")
BRA$dates<- strftime(BRA$date, "%d")
BRA$new_cases_tb<-m(BRA$new_cases)
BRA$new_cases_tb<-ceiling(BRA$new_cases_tb)
BRA$new_deaths_tb<-m(BRA$new_deaths)
BRA$new_deaths_tb<-ceiling(BRA$new_deaths_tb)
BRA_Made<-subset(BRA,(month=="01")|(month=="07")|(month=="09")|(month=="10"))
BRA_Made_2020<-subset(BRA_Made,(year=="2020"))
BRA_Made_2021<-subset(BRA_Made,(year=="2021"))
BRA_Made_2022<-subset(BRA_Made,(year=="2022"))

ggplot()+geom_line(data=BRA_Made_2020,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=BRA_Made_2020,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 03,06,07-2020 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue")) 
ggplot()+geom_line(data=BRA_Made_2021,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=BRA_Made_2021,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 01,03,06,07-2021 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue"))  
ggplot()+geom_line(data=BRA_Made_2022,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=BRA_Made_2022,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 01-2022 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue"))  

CHL_DATA <- CHL
CHL$new_cases<-abs(CHL$new_cases)
CHL$new_deaths<-abs(CHL$new_deaths)
CHL$date<-format(as.Date(CHL$date, format = "%m/%d/%Y"), "%Y-%m-%d")
CHL$year <- strftime(CHL$date, "%Y")    
CHL$month <- strftime(CHL$date, "%m")
CHL$dates<- strftime(CHL$date, "%d")
CHL$new_cases_tb<-m(CHL$new_cases)
CHL$new_cases_tb<-ceiling(CHL$new_cases_tb)
CHL$new_deaths_tb<-m(CHL$new_deaths)
CHL$new_deaths_tb<-ceiling(CHL$new_deaths_tb)
CHL_Made<-subset(CHL,(month=="01")|(month=="07")|(month=="09")|(month=="10"))
CHL_Made_2020<-subset(CHL_Made,(year=="2020"))
CHL_Made_2021<-subset(CHL_Made,(year=="2021"))
CHL_Made_2022<-subset(CHL_Made,(year=="2022"))

ggplot()+geom_line(data=CHL_Made_2020,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=CHL_Made_2020,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 03,06,07-2020 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue")) 
ggplot()+geom_line(data=CHL_Made_2021,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=CHL_Made_2021,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 01,03,06,07-2021 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue"))  
ggplot()+geom_line(data=CHL_Made_2022,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=CHL_Made_2022,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 01-2022 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue"))  


VEN_DATA <- VEN
VEN$new_cases<-abs(VEN$new_cases)
VEN$new_deaths<-abs(VEN$new_deaths)
VEN$date<-format(as.Date(VEN$date, format = "%m/%d/%Y"), "%Y-%m-%d")
VEN$year <- strftime(VEN$date, "%Y")    
VEN$month <- strftime(VEN$date, "%m")
VEN$dates<- strftime(VEN$date, "%d")
VEN$new_cases_tb<-m(VEN$new_cases)
VEN$new_cases_tb<-ceiling(VEN$new_cases_tb)
VEN$new_deaths_tb<-m(VEN$new_deaths)
VEN$new_deaths_tb<-ceiling(VEN$new_deaths_tb)
VEN_Made<-subset(VEN,(month=="01")|(month=="07")|(month=="09")|(month=="10"))
VEN_Made_2020<-subset(VEN_Made,(year=="2020"))
VEN_Made_2021<-subset(VEN_Made,(year=="2021"))
VEN_Made_2022<-subset(VEN_Made,(year=="2022"))

ggplot()+geom_line(data=VEN_Made_2020,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=VEN_Made_2020,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 03,06,07-2020 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue")) 
ggplot()+geom_line(data=VEN_Made_2021,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=VEN_Made_2021,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 01,03,06,07-2021 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue"))  
ggplot()+geom_line(data=VEN_Made_2022,(aes(x = dates, y = new_cases_tb,group=1,col="red")))+geom_line(data=VEN_Made_2022,(aes(x = dates, y = new_deaths_tb,group=1,col="blue")))  +facet_wrap( ~ month)  +labs(title = "Bieu do the hien thu thap nhiem benh va tu vong vao cac thang 01-2022 cua Brazil",subtitle = "Theo trung binh 7 ngay gan nhat",y = "So ca",x = "Ngay",color = "Chu thich")+scale_x_discrete(breaks=c("10","20","31"))+scale_color_manual(labels = c("Tu Vong", "Nhiem benh"), values= c("red", "blue"))  
