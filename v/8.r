#2020
plot(brazil.2020$new_deaths, type = "l",xaxt="n", col = "red", ylim = c(0, max(brazil.2020$new_deaths)), xlab = "Month", ylab = "New deaths", main = "New cumulative deaths in 2020")
lines(chile.2020$new_deaths, col = "yellow", type = "l")
lines(venezuela.2020$new_deaths, col = "green", type = "l")
axis(1, at = c(0,31,62), labels = c("Mar", "Jun", "Jul"))
legend("topleft", legend = c("Brazil", "Chile", "Venezuela"), lty = 1, col = c("red","yellow", "green"), ncol = 1, bty = "o", text.col = c("red","yellow", "green"))
#2021
plot(brazil.2021$new_deaths, type = "l",xaxt="n", col = "red", ylim = c(0, max(brazil.2021$new_deaths)), xlab = "Month", ylab = "New deaths", main = "New cumulative deaths in 2021")
lines(chile.2021$new_deaths, col = "yellow", type = "l")
lines(venezuela.2021$new_deaths, col = "green", type = "l")
axis(1, at = c(0,31,62,92), labels = c("Jan", "Mar", "Jun", "Jul"))
legend("topright", legend = c("Brazil", "Chile", "Venezuela"), lty = 1, col = c("red","yellow", "green"), ncol = 1, bty = "o", text.col = c("red","yellow", "green"))
#2022
plot(brazil.2022$new_deaths, type = "l",xaxt="n", col = "red", ylim = c(0, max(brazil.2022$new_deaths)), xlab = "Month", ylab = "New deaths", main = "New cumulative deaths in 2021")
lines(chile.2022$new_deaths, col = "yellow", type = "l")
lines(venezuela.2022$new_deaths, col = "green", type = "l")
axis(1, at = c(0,31), labels = c("Jan", "Feb"))
legend("topleft", legend = c("Brazil", "Chile", "Venezuela"), lty = 1, col = c("red","yellow", "green"), ncol = 1, bty = "o", text.col = c("red","yellow", "green"))