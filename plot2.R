#creating new POSIXct variable combining correct date and time for x-axis

feb1and2 <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"))
feb1and2$Date <- as.Date(feb1and2$Date, format = "%d/%m/%Y")
feb1and2$Datetime <- paste(feb1and2$Time, feb1and2$Date)
feb1and2$Datetime <- strptime(feb1and2$Datetime, format = "%H:%M:%S %Y-%m-%d")

#plot

plot(feb1and2$Datetime, feb1and2$Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power (kilowatts)")
lines(feb1and2$Datetime, feb1and2$Global_active_power)

dev.copy(png, file = "plot2.png")
dev.off()


