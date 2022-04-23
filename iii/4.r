no_report_data <- countries_covid_data %>% summarise(Infection = sum(is.na(new_cases) |
new_cases == 0), Deaths = sum(is.na(new_deaths) | new_deaths == 0) ) %>%
rename(Countries = location)
print(no_report_data)
report_data <- countries_covid_data %>% summarise(Infection = sum(!(is.na(new_cases) |
new_cases == 0)), Deaths = sum(!(is.na(new_deaths) | new_deaths == 0)) ) %>%
rename(Countries = location)
print(report_data)