FindOutliers <- function(data) {
  Q1<-quantile(data, na.rm = T,0.25) 
  Q2<-quantile(data, na.rm = T,0.5) 
  Q3<-quantile(data, na.rm = T,0.75) 
  return <- sum(data < Q1-1.5*(Q3-Q1), na.rm=T) + sum(data>Q3+1.5*(Q3-Q1), na.rm=T)
}

OUTLIERS_NEWCASES_BRA <- FindOutliers(BRA$new_cases)
OUTLIERS_NEWCASES_CHL <- FindOutliers(CHL$new_cases)
OUTLIERS_NEWCASES_VEN <- FindOutliers(VEN$new_cases)

OUTLIERS_NEWDEATHS_BRA <- FindOutliers(BRA$new_deaths)
OUTLIERS_NEWDEATHS_CHL <- FindOutliers(CHL$new_deaths)
OUTLIERS_NEWDEATHS_VEN <- FindOutliers(VEN$new_deaths)