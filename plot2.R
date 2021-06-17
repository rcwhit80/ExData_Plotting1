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

## plot2.R
png(filename = "plot2.png")
with(data, plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.axis = 1.0, cex.lab = 1.0))
dev.off()
