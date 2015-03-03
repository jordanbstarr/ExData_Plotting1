# Read in the large dataset and select the desired date range.
library(data.table)
data <- fread("household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Create the histogram and save it to a PNG file.
data$Global_active_power <- as.numeric(data$Global_active_power) # Column converted to character by fread()
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
axis(side = 2, at = c(0,200,400,600,800,1000,1200))
dev.off()