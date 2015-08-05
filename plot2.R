
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

png(filename = "plot2.png")
plot(power$Date_Time, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
