#plot3
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
submeter1<-mydf$Sub_metering_1
submeter2<-mydf$Sub_metering_2
submeter3<-mydf$Sub_metering_3
#plot to png and set size
png(file="plot3.png",width=480,height=480)
plot(datetime,submeter1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,submeter2,col="red")
lines(datetime,submeter3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
