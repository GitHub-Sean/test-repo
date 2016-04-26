

#plot3.R

#1: Read Table
dt1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#2: Paste Date and Time, then convert to POSIXlt format, so we can filter for given date range
dt1$DateTime <- paste(dt1$Date, dt1$Time)
dt1$DateTime <- strptime(dt1$DateTime, "%d/%m/%Y %H:%M:%S")

#3: Filtered for given date range
dt2 <- dt1[(dt1$DateTime >= "2007-02-01 00:00:00" & dt1$DateTime <= "2007-02-03 00:00:00"), ]

#4: Convert Sub_metering_1&2 to numeric
dt2$Sub_metering_1.1 <- as.numeric(as.character(dt2$Sub_metering_1))
dt2$Sub_metering_2.1 <- as.numeric(as.character(dt2$Sub_metering_2))

#5: Setting up plot, plotting sequentially with colors, adding legend
par(mfrow = c(1,1))
with(dt2, plot(DateTime, Sub_metering_1.1, type = "n", xlab = "", ylab = "Energy sub metering", ylim = c(0,40)))
with(dt2, lines(DateTime, Sub_metering_1.1, col = 'black'))
with(dt2, lines(DateTime, Sub_metering_2.1, col = 'red'))
with(dt2, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", lwd = 2, cex = 0.75, inset = 0.1, box.col = "white", y.intersp = 1.2, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))