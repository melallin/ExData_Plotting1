#plot2
library(data.table)
#set working directory and download data file
setwd("C:/Users/212542601/Documents/R/Coursera/ExData_Plotting1")
mydata<-data.table(fread("household_power_consumption.txt", na.strings="?"))
#subset data based on date
mydf<-as.data.frame(mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),])
#combine date and time
datetime<-paste(mydf$Date,mydf$Time,sep=" ")
#convert to date and time format
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S",tz="PST8PDT")
gapvec<-mydf$Global_active_power
#plot to png and set size
png(file="plot2.png",width=480,height=480)
plot(datetime,gapvec,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
