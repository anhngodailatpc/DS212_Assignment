# Prepare data for 3
report_new_cases<- subset(countries_covid_data, !(is.na(new_cases)))
report_new_cases<- subset(countries_covid_data, new_cases != 0)
report_new_deaths<- subset(countries_covid_data, !(is.na(new_deaths)))
report_new_deaths<- subset(countries_covid_data, new_deaths != 0)


new_cases_max <- report_new_cases %>% summarise(max_days = sum(new_cases == max(new_cases)))
print(new_cases_max)
new_deaths_max <- report_new_deaths %>% summarise(max_days = sum(new_deaths ==
max(new_deaths)))
print(new_deaths_max)