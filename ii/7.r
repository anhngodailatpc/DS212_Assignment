library(readr)
library(tidyverse)
library(dbplyr)

COMBINED_DATA <- rbind(BRA, CHL, VEN)
COMBINED_DATA$new_cases <- abs(COMBINED_DATA$new_cases)
COMBINED_DATA$new_deaths <- abs(COMBINED_DATA$new_deaths)
COMBINED_DATA$new_cases[is.na(COMBINED_DATA$new_cases)] <- 0
COMBINED_DATA$new_deaths[is.na(COMBINED_DATA$new_deaths)] <- 0

DATA <- as.data.frame(COMBINED_DATA)

ggplot(DATA, aes(location , new_cases, fill=location ))+ geom_boxplot()+ labs(title = "Overview of new cases by countries", x = "Country", y = "New cases", fill = "Country") + theme_bw() + theme(panel.grid.major.x = element_blank() ,)
