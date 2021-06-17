## This script is for the week 1 assignment of the Exploratory
## Data Analysis course

## Load packages required
## Install dplyr
library(data.table)
library(dplyr)
library(lubridate)

## Download the raw data file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/data.zip")

## Unzip the file
unzip("./data/data.zip")

##read the files into variables 
## hpc is created by reading the household_power_consumption.txt file extracted
hpc <- fread(input="./household_power_consumption.txt")

## convert character variables to numeric and date
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## plot1.R
png(filename="plot1.png")
hist(subset(hpc$Global_active_power, hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", na.rm = TRUE), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex.main = 1.0, cex.axis = 1.0, cex.lab = 1.0, mar = c(3,2,2,2))
dev.off()
