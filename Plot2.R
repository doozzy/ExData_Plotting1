wholedata <- read.table(unzip("exdata-data-household_power_consumption.zip"), 
colClasses = "character",
 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
"Sub_metering_3"), sep=";", header=T)

 


wholedata$Date <- as.Date(wholedata$Date, format = "%d/%m/%Y")
data <- wholedata[wholedata$Date >= "2007-02-01" & 
wholedata$Date <= "2007-02-02", ]

data$Global_active_power <- as.double(data$Global_active_power )

## Converting dates
datewithtime <- paste(as.Date(data$Date), data$Time)
data$Datewithtime  <- as.POSIXct(datewithtime )

## Generating Plot 2
with (data, plot(Global_active_power ~ Datewithtime , type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file ="Plot2.png")
dev.off()