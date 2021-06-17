## This script is for the week 1 assignment of the Exploratory
## Data Analysis course

## Load packages required
## Install dplyr
library(data.table)
library(dplyr)
library(lubridate)

##read the files into variables 
## hpc is created by reading the household_power_consumption.txt file extracted
hpc <- fread(input="./household_power_consumption.txt")

## convert character variables to numeric and date
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
data <- subset(hpc, hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", na.rm = TRUE)
data$Date <- with (data, ymd(Date)+hms(Time))

##plot3.R
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
png(filename = "plot3.png")
with(data, plot(c(Date), c(Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering", cex.axis = 1.0, cex.lab = 1.0))
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), cex = 1.0)
dev.off()
