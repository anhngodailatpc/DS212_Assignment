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
#6.7+6.8
#Tao ham ve bieu do tich luy theo thang
draw_accumulate_plot<-function(nation,variable,year){
  x_year<-subset(covid_data,year(date)==year&(month(date)==1|month(date)==7|month(date)==9|month(date)==10)&location==nation)  
  x_year_len<-dim(x_year)[1]
  acc_variable<-x_year[,c("date",variable)]
  for(i in 1:x_year_len){
    if(day(x_year[i,"date"])==1) acc_variable[i,variable]<-x_year[i,variable]
    else acc_variable[i,variable]<-acc_variable[i-1,variable]+x_year[i,variable]
  }
  x_acc_year<-ggplot()
  if(variable=="new_cases"){
    if(year==2021|year==2022) x_acc_year<-x_acc_year+geom_line(acc_variable[month(acc_variable$date)==1,],mapping=aes(x=day(date),y=new_cases,color="January"))
    if(year==2020|year==2021){
      x_acc_year<-x_acc_year+
      geom_line(acc_variable[month(acc_variable$date)==7,],mapping=aes(x=day(date),y=new_cases,color="July"))+
      geom_line(acc_variable[month(acc_variable$date)==9,],mapping=aes(x=day(date),y=new_cases,color="September"))+
      geom_line(acc_variable[month(acc_variable$date)==10,],mapping=aes(x=day(date),y=new_cases,color="October"))
    }
    x_acc_year<-x_acc_year+
      labs(x="Day",y="New cases",title=paste("New cases accumulated in ",nation," in ",year))+
      scale_x_continuous(breaks=seq(1,31,1))+scale_y_continuous(labels=comma)+
      scale_color_manual(name="Month",values=c("January"="green","July"="red","September"="blue","October"="orange"))+
      theme_light()
  }
  else{
    if(year==2021|year==2022) x_acc_year<-x_acc_year+geom_line(acc_variable[month(acc_variable$date)==1,],mapping=aes(x=day(date),y=new_deaths,color="January"))
    if(year==2020|year==2021){
      x_acc_year<-x_acc_year+
        geom_line(acc_variable[month(acc_variable$date)==7,],mapping=aes(x=day(date),y=new_deaths,color="July"))+
        geom_line(acc_variable[month(acc_variable$date)==9,],mapping=aes(x=day(date),y=new_deaths,color="September"))+
        geom_line(acc_variable[month(acc_variable$date)==10,],mapping=aes(x=day(date),y=new_deaths,color="October"))
    }
    x_acc_year<-x_acc_year+
    labs(x="Day",y="New deaths",title=paste("New deaths accumulated in ",nation," in ",year))+
    scale_x_continuous(breaks=seq(1,31,1))+scale_y_continuous(labels=comma)+
    scale_color_manual(name="Month",values=c("January"="green","July"="red","September"="blue","October"="orange"))+
    theme_light()
    }
}
#ket thuc ham
#Brazil
Brazil_cases_2020<-draw_accumulate_plot("Brazil","new_cases",2020)
Brazil_cases_2020
Brazil_deaths_2020<-draw_accumulate_plot("Brazil","new_deaths",2020)
Brazil_deaths_2020
Brazil_cases_2021<-draw_accumulate_plot("Brazil","new_cases",2021)
Brazil_cases_2021
Brazil_deaths_2021<-draw_accumulate_plot("Brazil","new_deaths",2021)
Brazil_deaths_2021
Brazil_cases_2022<-draw_accumulate_plot("Brazil","new_cases",2022)
Brazil_cases_2022
Brazil_deaths_2022<-draw_accumulate_plot("Brazil","new_deaths",2022)
Brazil_deaths_2022
#Chile
Chile_cases_2020<-draw_accumulate_plot("Chile","new_cases",2020)
Chile_cases_2020
Chile_deaths_2020<-draw_accumulate_plot("Chile","new_deaths",2020)
Chile_deaths_2020
Chile_cases_2021<-draw_accumulate_plot("Chile","new_cases",2021)
Chile_cases_2021
Chile_deaths_2021<-draw_accumulate_plot("Chile","new_deaths",2021)
Chile_deaths_2021
Chile_cases_2022<-draw_accumulate_plot("Chile","new_cases",2022)
Chile_cases_2022
Chile_deaths_2022<-draw_accumulate_plot("Chile","new_deaths",2022)
Chile_deaths_2022
#Venezuela
Venezuela_cases_2020<-draw_accumulate_plot("Venezuela","new_cases",2020)
Venezuela_cases_2020
Venezuela_deaths_2020<-draw_accumulate_plot("Venezuela","new_deaths",2020)
Venezuela_deaths_2020
Venezuela_cases_2021<-draw_accumulate_plot("Venezuela","new_cases",2021)
Venezuela_cases_2021
Venezuela_deaths_2021<-draw_accumulate_plot("Venezuela","new_deaths",2021)
Venezuela_deaths_2021
Venezuela_cases_2022<-draw_accumulate_plot("Venezuela","new_cases",2022)
Venezuela_cases_2022
Venezuela_deaths_2022<-draw_accumulate_plot("Venezuela","new_deaths",2022)
Venezuela_deaths_2022