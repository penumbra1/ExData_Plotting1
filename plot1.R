data<-read.csv("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Subset the data
data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

#Start the device
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#Turn off the device
dev.off()

