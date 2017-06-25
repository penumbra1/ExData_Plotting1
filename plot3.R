data<-read.csv("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Subset the data
data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

#Convert date and time (assuming GMT as it's not specified in the dataset description)
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S", tz="GMT") 

#Plot the first variable, creating a y-axis big enough for the others
range<-max(range(data$Sub_metering_1), range(data$Sub_metering_2), range(data$Sub_metering_3))

png("plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, ylim=c(0, range), type="l", xlab="", ylab="Energy sub metering")

#Add other lines and legend
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()