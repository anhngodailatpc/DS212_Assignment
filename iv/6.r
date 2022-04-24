    Brazil_data <- subset(countries_covid_data, location == "Brazil") 
    Q1=quantile(Brazil_data$new_deaths,0.25) 
    Q2=quantile(Brazil_data$new_deaths,0.5) 
    Q3=quantile(Brazil_data$new_deaths,0.75) 
    Outliers_new.deaths_Brazil=sum(Brazil_data$new_deaths<Q1-1.5*(Q3-Q1)) + sum(Brazil_data$new_deaths>Q3+1.5*(Q3-Q1))
    
    Chile_data <- subset(countries_covid_data, location == "Chile") 
    Q1=quantile(Chile_data$new_deaths,0.25) 
    Q2=quantile(Chile_data$new_deaths,0.5) 
    Q3=quantile(Chile_data$new_deaths,0.75) 
    Outliers_new.deaths_Chile=sum(Chile_data$new_deaths<Q1-1.5*(Q3-Q1)) + sum(Chile_data$new_deaths>Q3+1.5*(Q3-Q1))
    
    Venezuela_data <- subset(countries_covid_data, location == "Venezuela") 
    Q1=quantile(Venezuela_data$new_deaths,0.25) 
    Q2=quantile(Venezuela_data$new_deaths,0.5) 
    Q3=quantile(Venezuela_data$new_deaths,0.75) 
    Outliers_new.deaths_Venezuela=sum(Venezuela_data$new_deaths<Q1-1.5*(Q3-Q1)) + sum(Venezuela_data$new_deaths>Q3+1.5*(Q3-Q1))
    
    Outliers_new.deaths=c(Outliers_new.deaths_Brazil, Outliers_new.deaths_Chile, Outliers_new.deaths_Venezuela)
    
    barplot(Outliers_new.deaths,
            main = "Outliers of new deaths",
            xlab = "Country",
            ylab = "Outliers",
            names.arg = c('Brazil', 'Chile', 'Venezuela'),
            col=topo.colors(3))