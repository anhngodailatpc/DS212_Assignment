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

#Bai 4.1
data4.1<-data.frame(distinct(data[2]),num_of_country=NA)
for(x in 1:length(data4.1[[1]])){
  temp<-subset(data, data$continent==data4.1$continent[x])
  temp2<-distinct(temp[3])
  data4.1$num_of_country[x]<-length(temp2[[1]])
}
temp<-data4.1[order(data4.1$num_of_country,decreasing=FALSE),]
temp<-data.frame(temp,sum=NA)
sum<-0
for(x in 1:length(temp[[1]])){
  sum<-sum+temp$num_of_country[x]
  temp$sum[x]<-sum
}
ggplot(temp,aes(y=sum,x = 1:6,group=1))+
  geom_bar(col="Blue",fill="Blue",stat="identity")+
  labs(title="Biểu đồ tần số tích lũy quốc gia",x="Số châu lục",y="Số quốc gia")

