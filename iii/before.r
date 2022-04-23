# Select data
countries_covid_data<-subset(owid_covid_data, location == "Venezuela" | location == "Brazil" |
location == "Chile") %>% group_by(location)
countries_covid_data<- countries_covid_data[,c(’location’, ’new_cases’, ’new_deaths’)] %>%
group_by(location)

#q1
no_report_new_cases <- countries_covid_data %>% summarise(no_report_days =
sum(is.na(new_cases))+ sum (new_cases == 0, na.rm = TRUE))
print(no_report_new_cases)
no_report_new_deaths <- countries_covid_data %>% summarise(no_report_days =
sum(is.na(new_deaths)) + sum(new_deaths == 0, na.rm = TRUE))
print(no_report_new_deaths)

# Prepare data for 2
report_new_cases<- subset(countries_covid_data, !(is.na(new_cases)))
report_new_cases<- subset(countries_covid_data, new_cases != 0)
report_new_deaths<- subset(countries_covid_data, !(is.na(new_deaths)))
report_new_deaths<- subset(countries_covid_data, new_deaths != 0)
#2
new_cases_min<- report_new_cases %>% summarise(min_days = sum(new_cases == min(new_cases)))
print(new_cases_min)
new_deaths_min <- report_new_deaths %>% summarise(min_days = sum(new_deaths ==
min(new_deaths)))
print(new_deaths_min)
#3
new_cases_max <- report_new_cases %>% summarise(max_days = sum(new_cases == max(new_cases)))
print(new_cases_max)
new_deaths_max <- report_new_deaths %>% summarise(max_days = sum(new_deaths ==
max(new_deaths)))
print(new_deaths_max)
#4
no_report_data <- countries_covid_data %>% summarise(Infection = sum(is.na(new_cases) |
new_cases == 0), Deaths = sum(is.na(new_deaths) | new_deaths == 0) ) %>%
rename(Countries = location)
print(no_report_data)
report_data <- countries_covid_data %>% summarise(Infection = sum(!(is.na(new_cases) |
new_cases == 0)), Deaths = sum(!(is.na(new_deaths) | new_deaths == 0)) ) %>%
rename(Countries = location)
print(report_data)