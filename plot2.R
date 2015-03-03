# Read in the large dataset and select the desired date range.
data <-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
data <-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ),]

# Create new date/time column
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S") 

# Plot
png("plot2.png")
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()