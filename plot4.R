## Import raw data.
data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataForPlot4 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert to string datetime
datetime <- strptime(paste(dataForPlot4$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activePower <- as.numeric(dataForPlot4$Global_active_power)
reactivePower <- as.numeric(dataForPlot4$Global_reactive_power)
voltage <- as.numeric(dataForPlot4$Voltage)

subMetering1 <- as.numeric(dataForPlot4$Sub_metering_1)
subMetering2 <- as.numeric(dataForPlot4$Sub_metering_2)
subMetering3 <- as.numeric(dataForPlot4$Sub_metering_3)


png("plot4.png", width=480, height=480)
## Add rows
par(mfrow = c(2, 2)) 

plot(datetime, activePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Exit device
dev.off()