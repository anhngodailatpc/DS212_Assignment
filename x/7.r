library("dplyr")
path<-"C:/Users/DELL/Documents/owid-covid-data.csv"
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
library("reshape2")


#Nam 2020
month<-c(1:12)
data10<-data.frame(month,Brazil=NA,Chile=NA,Venezuela=NA)
rm(month)

for(x in 2:12){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2020 & data$location=="Brazil")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
    sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Brazil[x]<-sum
}
for(x in 2:12){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2020 & data$location=="Chile")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Chile[x]<-sum
}
for(x in 3:12){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2020 & data$location=="Venezuela")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Venezuela[x]<-sum
}
data10$month<-month.abb[data10$month]
data10$month<-factor(data10$month, levels=month.abb)

map<-melt(data10, id="month")
m1<-ggplot(map,aes(month,value,group=variable,color=variable))+
  geom_line()+
  geom_point()+
  labs(title="Năm 2020", x="Tháng", y="Trường hợp", subtitle="Số ca tử vong")
# Nam 2021
month<-c(1:12)
data10<-data.frame(month,Brazil=NA,Chile=NA,Venezuela=NA)
rm(month)

for(x in 1:12){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2021 & data$location=="Brazil")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Brazil[x]<-sum
}
for(x in 1:12){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2021 & data$location=="Chile")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Chile[x]<-sum
}
for(x in 1:12){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2021 & data$location=="Venezuela")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Venezuela[x]<-sum
}
data10$month<-month.abb[data10$month]
data10$month<-factor(data10$month, levels=month.abb)

map<-melt(data10, id="month")
m2<-ggplot(map,aes(month,value,group=variable,color=variable))+
  geom_line()+
  geom_point()+
  labs(title="Năm 2021", x="Tháng", y="Trường hợp", subtitle="Số ca tử vong")
# Nam 2022
month<-c(1:12)
data10<-data.frame(month,Brazil=NA,Chile=NA,Venezuela=NA)
rm(month)

for(x in 1:2){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2022 & data$location=="Brazil")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Brazil[x]<-sum
}
for(x in 1:2){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2022 & data$location=="Chile")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Chile[x]<-sum
}
for(x in 1:2){
  temp<-subset(data, month(as.Date(data$date,"%m/%d/%Y"))==x & year(as.Date(data$date,"%m/%d/%Y"))==2022 & data$location=="Venezuela")
  sum<-0
  for(y in 1:length(temp[[1]])){
    if(!is.na(temp$new_deaths[y])){
      sum<-sum+temp$new_deaths[y]
    }
  }
  data10$Venezuela[x]<-sum
}
data10$month<-month.abb[data10$month]
data10$month<-factor(data10$month, levels=month.abb)

map<-melt(data10, id="month")
m3<-ggplot(map,aes(month,value,group=variable,color=variable))+
  geom_line()+
  geom_point()+
  labs(title="Năm 2022", x="Tháng", y="Trường hợp", subtitle="Số ca tử vong")
grid.arrange(m1,m2,m3,nrow=3)