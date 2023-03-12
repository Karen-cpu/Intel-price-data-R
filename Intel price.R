library(tidyverse)
library(quantmod)
library(ggplot2)

mdate <- "2012-01-03"
intelPrices <- getSymbols('INTC', from=mdate, auto.assign=F)
intelClose <- getSymbols('INTC', from=mdate, auto.assign=F)[,4]
intelRets <- periodReturn(intelClose, period = 'daily', type ='log')
#intelRets <- ROC(intelClose, type ='discrete')
print(intelRets)

# Build a data frame for ggplot
intelClosedf <- data.frame(intelClose)
intelClosedf$Date <-as.Date(row.names(intelClosedf),"%Y-%m-%d")

intelRetsdf <- data.frame(intelRets)
intelRetsdf$Date <-as.Date(row.names(intelRetsdf),"%Y-%m-%d")


 plot1 = ggplot(intelClosedf, aes(x=Date,y=INTC.Close)) + geom_line() +
   labs(title = "Intel Closing Price from 2012-2022",
        x = "Time",
        y = "Stock price")
 plot1 + theme_classic()

plot2 = ggplot(intelRetsdf, aes(x=Date,y=daily.returns)) + geom_line() +
  labs(title = "Intel Daily Stock returns from 2012-2022",
    x = "Date",
    y = "Daily stock returns")
plot2 + theme_classic()


