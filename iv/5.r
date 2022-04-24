    #Brazil
    Brazil_data <- subset(countries_covid_data, location == "Brazil") 
    Q1=quantile(Brazil_data$new_cases,0.25) 
    Q2=quantile(Brazil_data$new_cases,0.5) 
    Q3=quantile(Brazil_data$new_cases,0.75) 
    Outliers_new.cases_Brazil=sum(Brazil_data$new_cases<Q1-1.5*(Q3-Q1)) + sum(Brazil_data$new_cases>Q3+1.5*(Q3-Q1))
    
    #Chile
    Chile_data <- subset(countries_covid_data, location == "Chile") 
    Q1=quantile(Chile_data$new_cases,0.25) 
    Q2=quantile(Chile_data$new_cases,0.5) 
    Q3=quantile(Chile_data$new_cases,0.75) 
    Outliers_new.cases_Chile=sum(Chile_data$new_cases<Q1-1.5*(Q3-Q1)) + sum(Chile_data$new_cases>Q3+1.5*(Q3-Q1))
    
    #Venezuela
    Venezuela_data <- subset(countries_covid_data, location == "Venezuela") 
    Q1=quantile(Venezuela_data$new_cases,0.25) 
    Q2=quantile(Venezuela_data$new_cases,0.5) 
    Q3=quantile(Venezuela_data$new_cases,0.75) 
    Outliers_new.cases_Venezuela=sum(Venezuela_data$new_cases<Q1-1.5*(Q3-Q1)) + sum(Venezuela_data$new_cases>Q3+1.5*(Q3-Q1))
    
    Outliers_new.cases=c(Outliers_new.cases_Brazil, Outliers_new.cases_Chile, Outliers_new.cases_Venezuela)
    
    barplot(Outliers_new.cases,
            main = "Outliers of new cases",
            xlab = "Country",
            ylab = "Outliers",
            names.arg = c('Brazil', 'Chile', 'Venezuela'),
            col=topo.colors(3))