## First I download the file and then unzip it 

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## unzip the whole data
wholedata <- read.table(unzip("exdata-data-household_power_consumption.zip"), 
colClasses = "character",
 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
"Sub_metering_3"), sep=";", header=T)

## change the fomat of Date
wholedata$Date <- as.Date(wholedata$Date, format = "%d/%m/%Y")

## Select the specific data I want to work on.
data <- wholedata[wholedata$Date >= "2007-02-01" & 
wholedata$Date <= "2007-02-02", ]

## correct the type of Global_active_power
data$Global_active_power <- as.double(data$Global_active_power )

## draw the first plot
hist(data$Global_active_power, col= "red", main = "Global Active Power",
 xlab ="Global Active Power (kilowatt)")

## save it on png file
dev.copy(png, file ="Plot1.png")
dev.off()