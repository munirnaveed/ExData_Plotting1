#Read Data from File. Please keep data file in the same folder where this file is.

hData = read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character",
 "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

#select the data for dates 01/02 and 02/02
newdata <- hData[ which(hData$Date=="1/2/2007" | hData$Date=="2/2/2007"), ]


#combine Date and Time and convert to date format
 htData<-transform(newdata, Date = paste(Date, Time))
 htData<-transform(htData, Date = strptime(Date, "%d/%m/%Y %H:%M:%S")) 

#Draw plot
par(mfrow=c(2,2)) 
mar=c(2,2,2,1)
oma=c(0,0,1,0)
with(htData, {
plot(Date, Global_active_power, type="l", ylab="Global active power", xlab="")
plot(Date, Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(Date, Sub_metering_1,  col="Black", type="l", xlab="", ylab="Energy sub metering")
lines(Date, Sub_metering_2,  col="Red", type="l", xlab="")
lines(Date, Sub_metering_3,  col="Blue", type="l", xlab="")
legend("topright",bty="n", lwd=0.5,cex=0.5, col = c("black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Date, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})



#Save into a png file
dev.copy(png, "plot4.png", width=480, height=480)
dev.off();