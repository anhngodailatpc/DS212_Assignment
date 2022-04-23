install.packages("lubridate")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("scales")
library(ggplot2)
library(lubridate)
library(dplyr)
library(scales)
covid_data=read.csv("/Users/macos/Downloads/covidData.csv",header=TRUE)
covid_data$date=as.Date(covid_data$date,format="%m/%d/%Y")

cumulative2020=function(nation){
  x=subset(covid_data,location==nation)
  x_len=dim(x)[1]
  case=data.frame(x$new_cases)
  death=data.frame(x$new_deaths)
  for(i in 1:x_len){
    if(i<=7){
      case[i,1]=sum(x[1:i,"new_cases"])/i
      death[i,1]=sum(x[1:i,"new_deaths"])/i
    } 
    else{
      case[i,1]=sum(x[(i-6):i,"new_cases"])/7
      death[i,1]=sum(x[(i-6):i,"new_deaths"])/7
    }
  }
  for (i in 2:x_len){
    case[i,1]=case[i,1]+case[i-1,1]
    death[i,1]=death[i,1]+death[i-1,1]
  }
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2020 & (month(date)==11 | month(date)==12))
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste("D? li?u nhi?m b?nh và t? vong trên th? gi?i n?m 2020 tích lu? trong 2 tháng cu?i "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}

cumulative2021=function(nation){
  x=subset(covid_data,location==nation)
  x_len=dim(x)[1]
  case=data.frame(x$new_cases)
  death=data.frame(x$new_deaths)
  for(i in 1:x_len){
    if(i<=7){
      case[i,1]=sum(x[1:i,"new_cases"])/i
      death[i,1]=sum(x[1:i,"new_deaths"])/i
    } 
    else{
      case[i,1]=sum(x[(i-6):i,"new_cases"])/7
      death[i,1]=sum(x[(i-6):i,"new_deaths"])/7
    }
  }
  for (i in 2:x_len){
    case[i,1]=case[i,1]+case[i-1,1]
    death[i,1]=death[i,1]+death[i-1,1]
  }
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2021 & (month(date)==11 | month(date)==12))
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste("D? li?u nhi?m b?nh và t? vong trên th? gi?i n?m 2021 tích lu? trong 2 tháng cu?i "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}

# 5 and 6
CumuWorld_2020 = cumulative2020("World")
CumuWorld_2020
CumuWorld_2021 = cumulative2021("World")
CumuWorld_2021