#Seperate data for 3,4
vii<-subset(owid_covid_data, month(date) == 11 | month(date) == 12)
vii<-summarise(vii, date, new_cases, new_deaths)
vii<-aggregate(cbind(vii$new_cases, vii$new_deaths), by= list (Date = vii$date), FUN=sum)
names(vii)<-c("date", "new_cases", "new_deaths")

vii_2020<-subset(vii, year(date) == 2020)
vii_2021<-subset(vii, year(date) == 2021)

#2020
plot(vii_2020$new_cases[1:30], type = "l", col = "red", ylim = c(0, max(vii_2020$new_cases)), xlab = "Day", ylab = "New cases", main = "New cases in the world in 2020")
lines(vii_2020$new_cases[31:61], col = "yellow", type = "l")
legend("bottomright", legend = c("November", "December"), lty = 1, col = c("red", "yellow"), ncol = 1, bty = "o", text.col = c("red", "yellow"))
#2021
plot(vii_2021$new_cases[1:30], type = "l", col = "red", ylim = c(0, max(vii_2021$new_cases)), xlab = "Day", ylab = "New cases", main = "New cases in the world in 2020")
lines(vii_2021$new_cases[31:61], col = "yellow", type = "l")
legend("topleft", legend = c("November", "December"), lty = 1, col = c("red", "yellow"), ncol = 1, bty = "o", text.col = c("red", "yellow"))
