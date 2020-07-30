#plot1
library(data.table)
#set working directory and download data file
setwd("C:/Users/212542601/Documents/R/Coursera/ExData_Plotting1")
mydata<-data.table(fread("household_power_consumption.txt", na.strings="?"))
#subset data based on date
mydf<-as.data.frame(mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),])
gapvec<-mydf$Global_active_power
#plot to png and set size
png(file="plot1.png",width=480,height=480)
hist(gapvec,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
