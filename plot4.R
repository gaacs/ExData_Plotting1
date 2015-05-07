## Read data file into R
rm(list=ls())
setwd("~/")
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?", nrows = -1)

## Subset file with required dates
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## Format date and timestamp
hpc$Date = as.Date(hpc$Date, "%d/%m/%Y")
hpc$Time = strptime(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot 3
with(hpc, {plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
          lines(Time, Sub_metering_1, col = "black")
          lines(Time, Sub_metering_2, col = "red")
          lines(Time, Sub_metering_3, col = "blue")})
legend ("topright", lty = 1, lwd = 2, col = c("black","red","blue"),
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Write plot to png file
setwd("./Documents/ExData_Plotting1/")
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()