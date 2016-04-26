

## Plot 4

#1: Read Table
dt1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#2: Paste Date and Time, then convert to POSIXlt format, so we can filter for given date range
dt1$DateTime <- paste(dt1$Date, dt1$Time)
dt1$DateTime <- strptime(dt1$DateTime, "%d/%m/%Y %H:%M:%S")

#3: Filtered for given date range
dt2 <- dt1[(dt1$DateTime >= "2007-02-01 00:00:00" & dt1$DateTime <= "2007-02-03 00:00:00"), ]

#4: Global_active_power converted to numeric
dt2$Global_active_power <- as.numeric(as.character(dt2$Global_active_power)) #for plot4a

#5: This sets up the arrangement
par(mfrow = c(2,2), mar = c(4.5, 4.1, 4.1, 2.1))

#6: Plotting

# Plot 4a
with(dt2, plot(DateTime, Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power (kilowatts)", ylim = c(0,8)))
with(dt2, lines(DateTime, Global_active_power))

# Plot 4b

dt2$Voltage <- as.numeric(as.character(dt2$Voltage)) #converts Voltage to numeric
with(dt2, plot(DateTime, Voltage, type = 'n', xlab = "datetime", ylab = "Voltage", ylim = c(234,246))) #this sets up the plot
with(dt2, lines(DateTime, Voltage)) #this plots as lines

# Plot 4c

dt2$Sub_metering_1.1 <- as.numeric(as.character(dt2$Sub_metering_1)) #4:Convert Sub_metering_1&2 to numeric
dt2$Sub_metering_2.1 <- as.numeric(as.character(dt2$Sub_metering_2))

#Setting up plot 4c, plotting sequentially with colors, adding legend
with(dt2, plot(DateTime, Sub_metering_1.1, type = "n", xlab = "", ylab = "Energy sub metering", ylim = c(0,40)))
with(dt2, lines(DateTime, Sub_metering_1.1, col = 'black'))
with(dt2, lines(DateTime, Sub_metering_2.1, col = 'red'))
with(dt2, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", lwd = 2, col = c('black', 'red', 'blue'), cex = 0.5, legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

# Plot 4d

dt2$Global_reactive_power <- as.numeric(as.character(dt2$Global_reactive_power)) #converts Global_reactive_power to numeric
with(dt2, plot(DateTime, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0.0,0.5))) #this sets up the plot
with(dt2, lines(DateTime, Global_reactive_power)) #this plots as lines