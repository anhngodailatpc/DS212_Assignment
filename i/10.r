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


### I10

dateFreq <- data.frame(table(date))
print("least date occurances:")
print(min(dateFreq$Freq))
print(dateFreq[dateFreq$Freq == min(dateFreq$Freq), 1])
