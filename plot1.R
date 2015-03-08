#Read Data from text file

hData = read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character",
 "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

#select the selected data
newdata <- hData[ which(hData$Date=="1/2/2007" | hData$Date=="2/2/2007"), ]

#Draw Historgram
hist(newdata$Global_active_power, col="RED", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Save into a png file
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
