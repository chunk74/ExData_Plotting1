# Load source data
dataSource <- "./data/household_power_consumption.txt"

# Convert data to table
dataOriginal <- read.table(dataSource, header = TRUE, sep = ";", dec = ".", 
                           stringsAsFactors = FALSE, na.strings = "?")

# Subset data by specific dates
dataSub01 <- dataOriginal[dataOriginal$Date %in% c("1/2/2007", "2/2/2007"),]

# Combine Date and Time into a single column
combinedDateTime <- paste(dataSub01$Date, dataSub01$Time)
dataSub01$DateTime <- strptime(combinedDateTime, "%d/%m/%Y %H:%M:%S")

# Create plot 3
plot(dataSub01$DateTime, dataSub01$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(dataSub01$DateTime, dataSub01$Sub_metering_2, type = "l", col = "Red")
lines(dataSub01$DateTime, dataSub01$Sub_metering_3, type = "l", col = "Blue")
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.7, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Write plot 3 to PNG file
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()