# Load source data
dataSource <- "./data/household_power_consumption.txt"

# Convert data to table
dataOriginal <- read.table(dataSource, header = TRUE, sep = ";", dec = ".", 
                           stringsAsFactors = FALSE, na.strings = "?")

# Subset data by specific dates
dataSub01 <- dataOriginal[dataOriginal$Date %in% c("1/2/2007", "2/2/2007"),]

# Create plot 1
hist(dataSub01$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Write plot 1 to PNG file
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()