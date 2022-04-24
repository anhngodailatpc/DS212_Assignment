owid_covid_data<-read.csv ("owid-covid-data.csv", header=TRUE)
owid_covid_data[is.na(owid_covid_data)]<- 0

brazil<-subset(owid_covid_data,location=="Brazil")
   require(tidyr)
   brazil$cases_tichluy<-cumsum(replace_na(brazil$new_cases, 0))
   brazil$death_tichluy<-cumsum(replace_na(brazil$new_deaths, 0))
   brazil$cases_pc<-brazil$cases_tichluy/sum(brazil[, ’new_cases’], na.rm = TRUE)*100
   brazil$death_pc<-brazil$death_tichluy/sum(brazil[, ’new_deaths’], na.rm = TRUE)*100
   brazil$date<-format(as.Date(brazil$date, format = "%m/%d/%Y"), "%Y-%m-%d")
   library(ggplot2)
   ggplot()+geom_line(data=brazil,aes(x=date,y=cases_pc,group=1,col="red")) +geom_line(data=brazil,aes(x=date,y=death_pc,group=1,col="blue")) +labs(x="Thoi gian", y="%")+ggtitle("Bieu do the hien phan tram giua nhiem benh tich luy tren tong nhiem benh v phan tram tu vong tich luy tren tong so tu vong cua Brazil trong giai doan tu 26/2/2020 den 19/2/2022") +scale_color_manual(labels = c("Tu vong", "Nhiem benh"), values = c("blue", "red")) +scale_x_discrete(breaks=c("2020-02-26","2020-10-19","2021-06-15","2022-02-19")) +scale_color_manual(labels = c( "Nhiem benh","Tu Vong"), values= c("red", "blue"))