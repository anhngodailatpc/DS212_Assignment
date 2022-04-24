library(ggplot2)
library(dplyr)
countries_covid_group_data <- subset(owid_covid_data, location == "Brazil" | location == "Chile" | location == "Venezuela") %>% group_by(location)
countries_covid_group_data$new_cases[is.na(countries_covid_group_data$new_cases)] <- 0
countries_covid_group_data$new_deaths[is.na(countries_covid_group_data$new_deaths)] <-0

countries_group_7day_data <- subset(countries_covid_group_data, date == "2022-02-13" | date == "2022-02-14" | date == "2022-02-15" | date == "2022-02-16" | date == "2022-02-17" | date == "2022-02-18" | date == "2022-02-19")
countries_group_7day_data %>%

ggplot(aes(date, new_cases, color=location))+ geom_line()+ scale_x_date(labels = date_format("%d/%m/%y")) + labs(title = "Overview of new cases by countries") + theme_bw()

brazil_data <- subset(countries_group_7day_data, subset = (location=="Brazil"))
brazil_data %>%
ggplot(aes(date, new_cases, color=location))+ geom_line()+ scale_x_date(labels = date_format("%d/%m/%y")) + labs(title = "Overview of new cases of Brazil") + theme_bw()

chile_data <- subset(countries_group_7day_data, subset = (location=="Chile"))
chile_data %>%
ggplot(aes(date, new_cases, color=location))+ geom_line()+ scale_x_date(labels = date_format("%d/%m/%y")) + labs(title = "Overview of new cases of Chile") + theme_bw()

venezuela_data <- subset(countries_group_7day_data, subset = (location=="Venezuela"))
venezuela_data %>%
  ggplot(aes(date, new_cases, color=location))+ geom_line()+ scale_x_date(labels = date_format("%d/%m/%y")) + labs(title = "Overview of new cases of Venezuela") + theme_bw()