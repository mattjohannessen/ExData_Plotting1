## Import raw data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Filter data
dataForPlot2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert to datetime.
datetime <- strptime(paste(dataForPlot2$Date, dataForPlot2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Convert to numeric
activePower <- as.numeric(dataForPlot2$Global_active_power)

## Open PNG and add plot. 
png("plot2.png", width=480, height=480)
plot(datetime, activePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()