## Import raw data
data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Filter data
dataForPlot1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert series to numeric
activePower <- as.numeric(dataForPlot1$Global_active_power)

## Create PNG output
png("plot1.png", width=480, height=480)

## Add histogram to the plot with labels.
hist(activePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()