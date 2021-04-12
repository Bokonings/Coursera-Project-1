par(mfrow = c(2,2), mar = c(4,4,2,1))

#creating new POSIXct variable combining correct date and time for x-axis

feb1and2 <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"))
feb1and2$Date <- as.Date(feb1and2$Date, format = "%d/%m/%Y")
feb1and2$Datetime <- paste(feb1and2$Time, feb1and2$Date)
feb1and2$Datetime <- strptime(feb1and2$Datetime, format = "%H:%M:%S %Y-%m-%d")

#plot 1

plot(feb1and2$Datetime, feb1and2$Global_active_power, type = 'n', xlab = NA , ylab = "Global Active Power")
lines(feb1and2$Datetime, feb1and2$Global_active_power, col = "black")

#plot 2

plot(feb1and2$Datetime, feb1and2$Voltage, type = 'n', xlab = "datetime", ylab = "Voltage")
lines(feb1and2$Datetime, feb1and2$Voltage)

#plot 3

plot(feb1and2$Datetime, feb1and2$Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = NA)
lines(feb1and2$Datetime, feb1and2$Sub_metering_1, col = "black")
lines(feb1and2$Datetime, feb1and2$Sub_metering_2, col = "red")
lines(feb1and2$Datetime, feb1and2$Sub_metering_3, col = "blue")
legend("topright", pch = "_", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), bty = 'n', y.intersp = 0.5)

#plot 4
plot(feb1and2$Datetime, feb1and2$Global_reactive_power, type = 'n', xlab = "datetime", ylab = "Global_reactive_power")
lines(feb1and2$Datetime, feb1and2$Global_reactive_power)

#saving plot to png

dev.copy(png, file = 'plot4.png')
dev.off()
