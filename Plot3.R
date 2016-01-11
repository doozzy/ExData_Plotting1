wholedata <- read.table(unzip("exdata-data-household_power_consumption.zip"), 
colClasses = "character",
 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
"Sub_metering_3"), sep=";", header=T)

 


wholedata$Date <- as.Date(wholedata$Date, format = "%d/%m/%Y")
data <- wholedata[wholedata$Date >= "2007-02-01" & 
wholedata$Date <= "2007-02-02", ]

data$Sub_metering_1  <- as.double(data$Sub_metering_1  )
data$Sub_metering_2  <- as.double(data$Sub_metering_2  )
data$Sub_metering_3  <- as.double(data$Sub_metering_3  )

## Converting dates
datewithtime <- paste(as.Date(data$Date), data$Time)
data$Datewithtime  <- as.POSIXct(datewithtime )

## Generating Plot 3
with (data, plot(Sub_metering_1 ~ Datewithtime , type = "n",
     ylab = "Energy sub metering", xlab = ""))

with (data, lines(Sub_metering_3 ~ Datewithtime , col = "blue"))
with (data, lines(Sub_metering_2 ~ Datewithtime , col = "red"))
with (data, lines(Sub_metering_1 ~ Datewithtime , col = "black"))
legend("topLeft", lty = 2, col =( "black","red", "blue"), legend = (
"Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file ="Plot2.png")
dev.off()