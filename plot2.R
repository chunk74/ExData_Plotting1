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

# Create plot 2
plot(dataSub01$DateTime, dataSub01$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Write plot 2 to PNG file
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()