data = read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subdata = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
datetime = strptime(paste(subdata$Date, subdata$Time, sep = ""), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subdata$Global_active_power)
globalreactivepower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
submetering1 <- as.numeric(subdata$Sub_metering_1)
submetering2 <- as.numeric(subdata$Sub_metering_2)
submetering3 <- as.numeric(subdata$Sub_metering_3)
par(mfrow = c(2, 2)) 
plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, submetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
plot(datetime, globalreactivepower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()