#creating new variable "feb1and2" subsetting the correct dates + channging Global_active_power to numeric

feb1and2 <- subset(household_power_consumption, household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"))
feb1and2$Global_active_power <- as.numeric(feb1and2$Global_active_power)

#plot

hist(feb1and2$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", bg = 'transparent') 

dev.copy(png, file = "plot1")
dev.off()

