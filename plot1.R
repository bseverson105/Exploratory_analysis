## Begin reading in information from data folders
power_data <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)

## Make dates usable for comparisons
power_data$Date <- strptime(power_data$Date,"%d/%m/%Y")

## Narrow down to 2/1/07 to 2/2/07
power_data <- power_data[power_data$Date >= "2007-02-01" & power_data$Date <= "2007-02-02",]

## Plot the histogram
png("plot1.png")
hist(as.numeric(power_data$Global_active_power),
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red",
     breaks = 10)
dev.off()