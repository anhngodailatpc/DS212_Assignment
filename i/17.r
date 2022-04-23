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
### I17

uniqueIsoCode <- data.frame(isoCode[!duplicated(isoCode$iso_code), ])
names(uniqueIsoCode)[1] <- 'iso_code'
uniqueLocation <- data.frame(location[!duplicated(location$location), ])
names(uniqueLocation)[1] <- 'location'
for (i in 1:nrow(uniqueIsoCode)){
  if (nchar(uniqueIsoCode[i,1]) > 3){
    print(uniqueIsoCode[i, 1])
    print(uniqueLocation[i,1])
    print("__________")
  }
}