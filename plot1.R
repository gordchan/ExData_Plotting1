
## Plot number 1

## Load required packages

require(dplyr)
require(lubridate)

## Load dataset

file <- file.path("household_power_consumption.txt")
power <- read.table(file, header = TRUE, sep = ";", quote = "", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Date <- dmy(power$Date)

## Filter dataset for study period

stu_period <- c(ymd("2007-02-01"), ymd("2007-02-02"))

power <- power %>% filter(Date %in% stu_period)

## Plot histogram

png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()