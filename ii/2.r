getQuantile <- function(data) {
  Q1 = quantile(data, na.rm = T)[2]
  Q2 = quantile(data, na.rm = T)[3]
  Q3 = quantile(data, na.rm = T)[4]
  return <- c(Q1,Q2,Q3)
}

Q_NEWCASES_BRA <- getQuantile(BRA$new_cases)
Q_NEWCASES_CHL <- getQuantile(CHL$new_cases)
Q_NEWCASES_VEN <- getQuantile(VEN$new_cases)

Q_NEWDEATHS_BRA <- getQuantile(BRA$new_deaths)
Q_NEWDEATHS_CHL <- getQuantile(CHL$new_deaths)
Q_NEWDEATHS_VEN <- getQuantile(VEN$new_deaths)

