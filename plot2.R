#Read Data from File. Please keep data file in the same folder where this file is.

hData = read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character",
 "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

#select the data for dates 01/02 and 02/02
newdata <- hData[ which(hData$Date=="1/2/2007" | hData$Date=="2/2/2007"), ]


#combine Date and Time and convert to date format
 htData<-transform(newdata, Date = paste(Date, Time))
 htData<-transform(htData, Date = strptime(Date, "%d/%m/%Y %H:%M:%S")) 

#Draw plot
plot(htData$Date, htData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");

#Save into a png file
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()