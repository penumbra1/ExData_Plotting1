data<-read.csv("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#Subset the data
data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

#Convert date and time (assuming GMT as it's not specified in the dataset description)
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S", tz="GMT") 

plot(data$datetime, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()