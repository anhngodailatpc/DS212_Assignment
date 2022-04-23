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
twomonth=function(nation, year){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
  x1=subset(x, year(date)==year & (month(date)==11 | month(date)==12))
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation," in November and December ", year))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}


month_09_2020=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2020 & month(date)==09)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in September 2020 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}


month_10_2020=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2020 & month(date)==10)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in October 2020 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}

month_07_2020=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2020 & month(date)==07)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in July 2020 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}


month_01_2021=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2021 & month(date)==01)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in January 2021 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}

month_09_2021=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2021 & month(date)==09)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in September 2021 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}

month_10_2021=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2021 & month(date)==10)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in October 2021 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}

month_07_2021=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2021 & month(date)==07)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in July 2021 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}
?month_01_2022=function(nation){
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
  x=data.frame(x$date,case,death)
  names(x)=c("date","new_cases","new_deaths")
 
  x1=subset(x, year(date)==2022 & month(date)==01)
  x1plot=ggplot()+
    geom_line(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_point(x1, mapping=aes(x=date, y=new_cases, color="New cases"))+
    geom_line(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    geom_point(x1, mapping=aes(x=date, y=new_deaths, color="New deaths"))+
    labs(x="Date", y="New cases and new deaths", title=paste(nation,"in January 2022 "))+
    scale_color_manual(name="Variable", values=c("New cases"="blue", "New deaths"="red"))  
}
# 3 and 4
World20= twomonth("World", 2020)
World20
World21= twomonth("World", 2021)
World21
