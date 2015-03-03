# Read in the large dataset and select the desired date range.
data <-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
data <-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ),]

# Create new date/time column
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S") 

# Plot
png("plot3.png")
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$DateTime, data$Sub_metering_2, type = "l", col = "Red")
points(data$DateTime, data$Sub_metering_3, type = "l", col = "Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty = 1, col = c("Black", "Red", "Blue"))
dev.off()