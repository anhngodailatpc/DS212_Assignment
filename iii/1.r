no_report_new_cases <- countries_covid_data %>% summarise(no_report_days =
sum(is.na(new_cases))+ sum (new_cases == 0, na.rm = TRUE))
print(no_report_new_cases)
no_report_new_deaths <- countries_covid_data %>% summarise(no_report_days =
sum(is.na(new_deaths)) + sum(new_deaths == 0, na.rm = TRUE))
print(no_report_new_deaths)