## Begin reading in information from data folders
power_data <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)

## Make dates usable for comparisons
power_data$Date <- strptime(paste(power_data$Date,power_data$Time),"%d/%m/%Y %H:%M:%S")

## Narrow down to 2/1/07 to 2/2/07
power_data <- power_data[power_data$Date >= "2007-02-01 00:00:00" & power_data$Date <= "2007-02-02 23:59:00",]

## Plot the line graph
png("plot2.png")
plot(power_data$Date,
     as.numeric(power_data$Global_active_power),
     type = "l",
     ylab = "Global Active Power (kilowatts)")
dev.off()