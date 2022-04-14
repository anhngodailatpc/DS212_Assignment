    country <- as.data.frame(countries_covid_group_data) 

    ggplot(country, aes(location , new_deaths, fill=location ))+
      geom_boxplot()+
      labs(title = "Overview of new deaths by countries", 
           x = "Country",
           y = "New deaths",
           fill = "Country") +
      theme_bw() +  
      theme(panel.grid.major.x = element\_blank(),)