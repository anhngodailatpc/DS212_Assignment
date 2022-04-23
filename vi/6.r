install.packages("lubridate")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("scales")
library(ggplot2)
library(lubridate)
library(dplyr)
library(scales)
covid_data<-read.csv("owid-covid-data.csv",header=TRUE)
covid_data[is.na(covid_data)]=0
covid_data$date<-as.Date(covid_data$date,format="%m/%d/%Y")
#6.6
#Tao ham ve bieu do 2 thang cuoi
draw_2_month_plot<-function(nation,year){
  x<-subset(covid_data,location==nation)
  x_len<-dim(x)[1]
  cases_x<-data.frame(x$new_cases)
  deaths_x<-data.frame(x$new_deaths)
  for(i in 1:x_len){
    if(i<=7){
      cases_x[i,1]<-sum(x[1:i,"new_cases"])/i
      deaths_x[i,1]<-sum(x[1:i,"new_deaths"])/i
    } 
    else{
      cases_x[i,1]<-sum(x[(i-6):i,"new_cases"])/7
      deaths_x[i,1]<-sum(x[(i-6):i,"new_deaths"])/7
    }
  }
  x<-data.frame(x$date,cases_x,deaths_x)
  names(x)<-c("date","new_cases","new_deaths")
  x_year<-subset(x,year(date)==year&(month(date)==11|month(date)==12))
  x_year_plot<-ggplot()+
    geom_line(x_year, mapping=aes(x=date,y=new_cases,color="New cases"))+
    geom_point(x_year, mapping=aes(x=date,y=new_cases,color="New cases"))+
    geom_line(x_year, mapping=aes(x=date,y=new_deaths,color="New deaths"))+
    geom_point(x_year, mapping=aes(x=date,y=new_deaths,color="New deaths"))+
    labs(x="Date",y="New cases and new deaths", title=paste(nation," in November and December ",year))+
    scale_color_manual(name="Variable",values=c("New cases"="blue","New deaths"="red"))  
}
#Ket thuc ham
#Brazil
Brazil_2020<-draw_2_month_plot("Brazil",2020)
Brazil_2020
Brazil_2021<-draw_2_month_plot("Brazil",2021)
Brazil_2021
#Chile
Chile_2020<-draw_2_month_plot("Chile",2020)
Chile_2020
Chile_2021<-draw_2_month_plot("Chile",2021)
Chile_2021
#Venezuela
Venezuela_2020<-draw_2_month_plot("Venezuela",2020)
Venezuela_2020
Venezuela_2021<-draw_2_month_plot("Venezuela",2021)
Venezuela_2021
