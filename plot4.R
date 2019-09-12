## Begin reading in information from data folders
power_data <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)

## Make dates usable for comparisons
power_data$Date <- strptime(paste(power_data$Date,power_data$Time),"%d/%m/%Y %H:%M:%S")

## Narrow down to 2/1/07 to 2/2/07
power_data <- power_data[power_data$Date >= "2007-02-01 00:00:00" & power_data$Date <= "2007-02-02 23:59:00",]

png("plot4.png")

#establish plots structure
par(mfrow = c(2,2))#, mfcol = c(2,1))

#1st plot
plot(power_data$Date,
     as.numeric(power_data$Global_active_power),
     type = "l",
     ylab = "Global Active Power")

#2nd plot
plot(power_data$Date,
     as.numeric(power_data$Voltage),
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

#3rd plot
plot(power_data$Date,
     as.numeric(power_data$Sub_metering_1),
     type = "l",
     ylab = "Energy sub metering",
     xlab = "",
     col="black")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))
lines(power_data$Date, as.numeric(power_data$Sub_metering_2), col="red")
lines(power_data$Date, as.numeric(power_data$Sub_metering_3), col="blue")

#4th plot
plot(power_data$Date,
     as.numeric(power_data$Global_active_power),
     type = "l",
     ylab = "Global reactive power",
     xlab = " ")

dev.off()