#plot4
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
png(file="plot4.png",width=480,height=480)
par(mfcol=c(2,2))
#create top left plot
plot(datetime,gapvec,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#create bottom left plot
submeter1<-mydf$Sub_metering_1
submeter2<-mydf$Sub_metering_2
submeter3<-mydf$Sub_metering_3
plot(datetime,submeter1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,submeter2,col="red")
lines(datetime,submeter3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#create top right plot
voltvec<-mydf$Voltage
plot(datetime,voltvec,type="l",xlab="datetime",ylab="Voltage")
#create bottom right plot
grpvec<-mydf$Global_reactive_power
plot(datetime,grpvec,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
