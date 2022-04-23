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
#Bai 7.6

date<-seq(as.Date("2020-11-01"),as.Date("2020-12-31"),by='day')
world<-data.frame(date,new_deaths=NA,tich_luy=NA,tan_so=NA)
rm(date)
temp<-subset(file, file$location=="World")
count=1
for(x in 1:length(temp[[1]])){
  if(as.Date(temp$date[x],"%m/%d/%Y")==world$date[count]){
    world$new_deaths[count]<-temp$new_deaths[x]
    if(count<61){count<-count+1}
  }
}
rm(count)
sum=0
for(x in 1:length(world[[1]])){
  sum<-sum + world$new_deaths[x]
  world$tich_luy[x]<-sum
}
for(x in 1:length(world[[1]])){
  world$tan_so[x]<-(world$tich_luy[x]/sum)* 100
}
rm(sum)
rm(temp)
map1<-ggplot(world,aes(x=date,y=tan_so))+
  geom_line(col="red",size=2)+
  labs(title="Tháng 11 và 12 năm 2020", x="Ngày", y="%", subtitle="Tử vong")
date<-seq(as.Date("2021-11-01"),as.Date("2021-12-31"),by='day')
world<-data.frame(date,new_deaths=NA,tich_luy=NA,tan_so=NA)
rm(date)
temp<-subset(file, file$location=="World")
count=1
for(x in 1:length(temp[[1]])){
  if(as.Date(temp$date[x],"%m/%d/%Y")==world$date[count]){
    world$new_deaths[count]<-temp$new_deaths[x]
    if(count<61){count<-count+1}
  }
}
rm(count)
sum=0
for(x in 1:length(world[[1]])){
  sum<-sum + world$new_deaths[x]
  world$tich_luy[x]<-sum
}
for(x in 1:length(world[[1]])){
  world$tan_so[x]<-(world$tich_luy[x]/sum)* 100
}
rm(sum)
rm(temp)
map2<-ggplot(world,aes(x=date,y=tan_so))+
  geom_line(col="red",size=2)+
  labs(title="Tháng 11 và 12, năm 2021", x="Ngày", y="%", subtitle="Tử vong")
grid.arrange(map1,map2,nrow=1,ncol=2)