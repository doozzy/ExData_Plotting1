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
data$Global_active_power <- as.double(data$Global_active_power )
data$Voltage <- as.double(data$Voltage )
data$ Global_reactive_power <- as.double(data$ Global_reactive_power )


## Converting dates
datewithtime <- paste(as.Date(data$Date), data$Time)
data$Datewithtime  <- as.POSIXct(datewithtime )

## Generating Plot 4
par(mfrow= c(2,2), cex=.64)
with (data, plot(Global_active_power ~ Datewithtime , type = "l",
     ylab = "Global Active Power", xlab = ""))

with (data, plot(Voltage ~ Datewithtime , type = "l",
     ylab = "Voltage", xlab = "datetime"))

with (data, plot(Sub_metering_1 ~ Datewithtime , type = "n",
     ylab = "Energy sub metering", xlab = ""))

with (data, lines(Sub_metering_3 ~ Datewithtime , col = "blue"))
with (data, lines(Sub_metering_2 ~ Datewithtime , col = "red"))
with (data, lines(Sub_metering_1 ~ Datewithtime , col = "black"))
legend("topright",lty = 1, col =c( "black","red", "blue"), legend = c(
"Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with (data, plot(Global_reactive_power ~ Datewithtime , type = "l",
     ylab = "Global_reactive_power", xlab = "datetime"))

dev.copy(png, file ="Plot4.png")
dev.off()