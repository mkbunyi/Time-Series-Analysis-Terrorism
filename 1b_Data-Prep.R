#Load libraries
library(dplyr)

#Load data
gtd <- read.csv('Data/gtdfinal.csv')

# aggregate to monthly
gtd_monthly <- 
  gtd %>%
  group_by(iyear,imonth) %>%
  filter(imonth != 0) %>%
  summarize(count=n(),
            sum_nkillciv=sum(nkillciv, na.rm=TRUE),
            sum_nwoundciv=sum(nwoundciv, na.rm=TRUE))

# export data
write.csv(gtd_monthly,"Data/gtd_monthly.csv", row.names = FALSE)
