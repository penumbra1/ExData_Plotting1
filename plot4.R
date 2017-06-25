data<-read.csv("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Subset the data
data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

#Convert date and time (assuming GMT as it's not specified in the dataset description)
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S", tz="GMT") 

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4, 4, 2, 2))

plot(data$datetime, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

with(data, plot(datetime, Voltage, type="l"))

range<-max(range(data$Sub_metering_1), range(data$Sub_metering_2), range(data$Sub_metering_3))
plot(data$datetime, data$Sub_metering_1, ylim=c(0, range), type="l", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(datetime, Global_reactive_power, type="l"))

dev.off()
