## Reading and subsetting the data ##

library(dplyr); library(lubridate)
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- strptime(power$Time, "%H:%M:%OS")
power <- power[!is.na(power$Date), ]
powerfeb <- power %>% filter(power$Date == as.Date("2007-02-01") | power$Date == as.Date ("2007-02-02"))
powerfeb$Time <- format(ymd_hms(powerfeb$Time), "%H:%M:%S")

## Plotting the graph ##

hist(powerfeb$Global_active_power, col ="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",
     ylab = "Frequency", ylim=c(0,1200))
