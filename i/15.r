dfdata <- read.csv(file = "owid-covid-data.csv")
install.packages("tidyverse")
date <- data.frame(dfdata$date)
names(date)[1] <- 'date'
isoCode <- data.frame((dfdata$iso_code))
names(isoCode)[1] <- 'iso_code'
continent <- data.frame(dfdata$continent)
names(continent)[1] <- 'continent'
location <- data.frame(dfdata$location)
names(location)[1] <- 'location'

### I12 -> I15
continentFreq <- data.frame(table(dfdata$continent))
names(continentFreq)[1] <- 'continent'
uniqueDate <- data.frame(table(dfdata$date))
names(uniqueDate)[1] <- 'date'
uniqueContinent <- data.frame(continentFreq$continent)
names(uniqueContinent)[1] <- 'continent'
date_continent <- cbind(continent, date)

africa <- dfdata[dfdata$continent == "Africa", ]
africa <- africa[rowSums(is.na(africa)) != ncol(africa), ]
asia <- dfdata[dfdata$continent == "Asia", ]
asia <- asia[rowSums(is.na(asia)) != ncol(asia), ]
europe <- dfdata[dfdata$continent == "Europe", ]
europe <- europe[rowSums(is.na(europe)) != ncol(europe), ]
northAmerica <- dfdata[dfdata$continent == "North America", ]
northAmerica <- northAmerica[rowSums(is.na(northAmerica)) != ncol(northAmerica), ]
oceania <- dfdata[dfdata$continent == "Oceania", ]
oceania <- oceania[rowSums(is.na(oceania)) != ncol(oceania), ]
southAmerica <- dfdata[dfdata$continent == "South America", ]
southAmerica <- southAmerica[rowSums(is.na(southAmerica)) != ncol(southAmerica), ]

ans <- data.frame(matrix(NA, nrow = nrow(uniqueDate), ncol = 8))
names(ans)[1] = 'date'
names(ans)[2] = 'africa'
names(ans)[3] = 'asia'
names(ans)[4] = 'europe'
names(ans)[5] = 'northAmerica'
names(ans)[6] = 'oceania'
names(ans)[7] = 'southAmerica'
names(ans)[8] = 'total'

for (i in 1:nrow(uniqueDate)){
  tempAsia <- asia[format.Date(as.Date(asia$date , format = '%Y-%m-%d') , "%Y-%m-%d") == as.Date(uniqueDate[i, 1]) , ]
  tempAfrica <- africa[format.Date(as.Date(africa$date , format = '%Y-%m-%d') , "%Y-%m-%d") == as.Date(uniqueDate[i, 1]) , ]
  tempEurope <- europe[format.Date(as.Date(europe$date , format = '%Y-%m-%d') , "%Y-%m-%d") == as.Date(uniqueDate[i, 1]) , ]
  tempNorthAmerica <- northAmerica[format.Date(as.Date(northAmerica$date , format = '%Y-%m-%d') , "%Y-%m-%d") == as.Date(uniqueDate[i, 1]) , ]
  tempOceania <- oceania[format.Date(as.Date(oceania$date , format = '%Y-%m-%d') , "%Y-%m-%d") == as.Date(uniqueDate[i, 1]) , ]
  tempSouthAmerica <- southAmerica[format.Date(as.Date(southAmerica$date , format = '%Y-%m-%d') , "%Y-%m-%d") == as.Date(uniqueDate[i, 1]) , ]
  ans[i, 1] = format.Date(as.Date(uniqueDate[i, 1], format = '%Y-%m-%d'))
  ans[i, 2] = nrow(tempAfrica)
  ans[i, 3] = nrow(tempAsia)
  ans[i, 4] = nrow(tempEurope)
  ans[i, 5] = nrow(tempNorthAmerica)
  ans[i, 6] = nrow(tempOceania)
  ans[i, 7] = nrow(tempSouthAmerica)
  ans[i, 8] = rowSums(ans[i, 2:7])
}

  #I15

print("input year-month-day:")
var = readline()
inputDate = as.Date(var)
print("input continent")
var = readline()
inputContinent = var
print(ans[(as.Date(ans$date) == as.Date(inputDate)) & (names(ans)[2] == inputContinent | names(ans)[3] == inputContinent |names(ans)[4] == inputContinent |names(ans)[5] == inputContinent |names(ans)[6] == inputContinent | names(ans)[7] == inputContinent ), ])