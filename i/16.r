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
  #I16

locationFreq <- data.frame(table(dfdata$location))
names(locationFreq)[1] = 'location'
locationFreq <- cbind(uniqueIsoCode, locationFreq)
temp <- data.frame(table(locationFreq$Freq))
names(temp)[1] = 'locationFreq'
temp <- temp[!(temp$Freq == 1), ] 

for (i in 1:nrow(temp)){
  for (j in 1:nrow(locationFreq)){
    if(locationFreq$Freq[j] == temp[i, 1]){
      print(locationFreq$iso_code[j])
      
    }
  }
  print("_____")
}