
## Plot number 2

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

x_range <- range(power$Date_Time)
y_range <- range(power$Sub_metering_1)

png(filename = "plot3.png")
  plot(power$Date_Time, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(power$Date_Time, power$Sub_metering_2, col = "red")
    lines(power$Date_Time, power$Sub_metering_3, col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
