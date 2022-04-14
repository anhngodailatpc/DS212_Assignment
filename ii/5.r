    Outliers=sum(Brazil_data$new_cases<Q1-1.5*(Q3-Q1))
              +sum(Brazil_data$new_cases>Q3+1.5*(Q3-Q1))