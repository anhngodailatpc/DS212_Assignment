#Seperate data for 1,2
vii<-subset(owid_covid_data, month(date) == 1 | month(date) == 7 | month(date) == 9 |month(date) == 10)
vii<-summarise(vii, date, new_cases, new_deaths)
vii<-aggregate(cbind(vii$new_cases, vii$new_deaths), by= list (Date = vii$date), FUN=sum)
names(vii)<-c("date", "new_cases", "new_deaths")

vii_2020<-subset(vii, year(date) == 2020)
vii_2021<-subset(vii, year(date) == 2021)
vii_2022<-subset(vii, year(date) == 2022)


#2020
plot(vii_2020$new_cases[1:31], type = "l", col = "red", ylim = c(0, max(vii_2020$new_cases)), xlab = "Day", ylab = "New cases", main = "New cases in the wolrd in 2020")
lines(vii_2020$new_cases[32:62], col = "yellow", type = "l")
lines(vii_2020$new_cases[63:92], col = "green", type = "l")
lines(vii_2020$new_cases[93:123], col = "blue", type = "l")
legend("topleft", legend = c("January", "March", "June", "July"), lty = 1, col = c("red","yellow", "green", "blue"), ncol = 1, bty = "o", text.col = c("red","yellow", "green", "blue"))
#2021
plot(vii_2021$new_cases[1:31], type = "l", col = "red", ylim = c(0, max(vii_2021$new_cases)), xlab = "Day", ylab = "New cases", main = "New cases in the wolrd in 2021")
lines(vii_2021$new_cases[32:62], col = "yellow", type = "l")
lines(vii_2021$new_cases[63:92], col = "green", type = "l")
lines(vii_2021$new_cases[93:123], col = "blue", type = "l")
legend("bottomright", legend = c("January", "March", "June", "July"), lty = 1, col = c("red","yellow", "green", "blue"), ncol = 1, bty = "o", text.col = c("red","yellow", "green", "blue"))
#2022
plot(vii_2022$new_cases, type = "l", col = "red", ylim = c(0, max(vii_2022$new_cases)), xlab = "Day", ylab = "New cases", main = "New cases in the wolrd in 2022")
legend("topleft", legend = c("January"), lty = 1, col = c("red"), ncol = 1, bty = "o", text.col = c("red"))