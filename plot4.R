
## Plot number 4

## Load required packages

require(dplyr)
require(lubridate)

## Load dataset

file <- file.path("household_power_consumption.txt")
power <- read.table(file, header = TRUE, sep = ";", quote = "", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Date <- dmy(power$Date)

## Filter dataset for study period

stu_period <- interval(ymd("2007-02-01"), ymd("2007-02-02"))

power <- power %>% filter(Date %within% stu_period)

## Combine Date and Time

power <- power %>% mutate(Date_Time = ymd_hms(paste(power$Date, power$Time)))

## Plot line graph

png(filename = "plot4.png")

par(mfrow=c(2,2))
#1  
  plot(power$Date_Time, power$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#2
  plot(power$Date_Time, power$Voltage, type="l", xlab="datetime", ylab="Voltage")
#3
  plot(power$Date_Time, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(power$Date_Time, power$Sub_metering_2, col = "red")
    lines(power$Date_Time, power$Sub_metering_3, col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.9, bty = "n")
#4
  plot(power$Date_Time, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

  dev.off()