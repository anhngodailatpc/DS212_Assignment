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

#Bai 4.2
data4.2<-data.frame(data4.1,percent=NA)
sum<-0
for(x in 1:length(data4.2[[1]])){
  sum<-sum+data4.2$num_of_country[x]
}

for(x in 1:length(data4.2[[1]])){
  data4.2$percent[x]<-data4.2$num_of_country[x]/sum*100
}
ggplot(data4.2,aes(x=continent,y=percent))+
  geom_bar(fill="Blue",stat="identity")+
  labs(title="Biểu đồ tần số tương đối",x="Châu lục",y="%")