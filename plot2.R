## Read data file into R
rm(list=ls())
setwd("~/")
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?", nrows = -1)

## Subset file with required dates
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## Format date and timestamp
hpc$Date = as.Date(hpc$Date, "%d/%m/%Y")
hpc$Time = strptime(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot 2
with(hpc, plot(Time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Write plot to png file
setwd("./Documents/ExData_Plotting1/")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()