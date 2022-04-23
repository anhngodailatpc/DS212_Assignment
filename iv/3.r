library("dplyr")
file<-read.csv(path, header = TRUE, sep = ",")
for(x in 1:length(file[[1]])){
  if(file$new_cases[x]<0&&!is.na(file$new_cases[x])){file$new_cases[x]<-abs(file$new_cases[x])}
  if(file$new_deaths[x]<0&&!is.na(file$new_deaths[x])){file$new_deaths[x]<-abs(file$new_deaths[x])}
}
data<-subset(file, file$continent!="")
library("ggplot2")
library("lubridate")
library("gridExtra")
library("scales")

#Bai 4.3
date<-seq(as.Date("2022-02-13"),as.Date("2022-02-19"),by="day")
data4.3<-data.frame(date,Brazil_cases=NA,Chile_cases=NA,Venezuela_cases=NA)
rm(date)
temp<-subset(data, data$location=="Brazil")
for(x in 1:7){
  for(y in 1:length(temp[[1]])){
    if(data4.3$date[x]==as.Date(temp$date[y],"%m/%d/%Y")){
      data4.3$Brazil_cases[x]<-temp$new_cases[y]
    }
  }
}
temp<-subset(data, data$location=="Chile")
for(x in 1:7){
  for(y in 1:length(temp[[1]])){
    if(data4.3$date[x]==as.Date(temp$date[y],"%m/%d/%Y")){
      data4.3$Chile_cases[x]<-temp$new_cases[y]
    }
  }
}
temp<-subset(data, data$location=="Venezuela")
for(x in 1:7){
  for(y in 1:length(temp[[1]])){
    if(data4.3$date[x]==as.Date(temp$date[y],"%m/%d/%Y")){
      data4.3$Venezuela_cases[x]<-temp$new_cases[y]
    }
  }
}

library("reshape2")
map<-melt(data4.3, id="date")
m<-ggplot(map,aes(date,value,color=variable))+
  geom_line()+
  geom_point()+
  labs(title="Dữ liệu nhiễm bệnh",x="Ngày",y="Số trường hợp")
m + scale_y_continuous(labels = scales::comma)