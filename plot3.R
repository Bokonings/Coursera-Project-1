#creating new POSIXct variable combining correct date and time for x-axis

feb1and2 <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"))
feb1and2$Date <- as.Date(feb1and2$Date, format = "%d/%m/%Y")
feb1and2$Datetime <- paste(feb1and2$Time, feb1and2$Date)
feb1and2$Datetime <- strptime(feb1and2$Datetime, format = "%H:%M:%S %Y-%m-%d")

#plot

with(feb1and2, plot(Datetime, Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = NA))
lines(feb1and2$Datetime, feb1and2$Sub_metering_1, col = "black")
lines(feb1and2$Datetime, feb1and2$Sub_metering_2, col = "red")
lines(feb1and2$Datetime, feb1and2$Sub_metering_3, col = "blue")
legend("topright", pch = "_", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), y.intersp = 0.75, cex = 0.75)

dev.copy(png, file = "plot3.png")
dev.off()

