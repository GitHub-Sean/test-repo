
#plot1.R

#1: Read Table
dt1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#2: Paste Date and Time, then convert to POSIXlt format, so we can filter for given date range
dt1$DateTime <- paste(dt1$Date, dt1$Time)
dt1$DateTime <- strptime(dt1$DateTime, "%d/%m/%Y %H:%M:%S")

#3: Filtered for given date range
dt2 <- dt1[(dt1$DateTime >= "2007-02-01 00:00:00" & dt1$DateTime <= "2007-02-03 00:00:00"), ]

#4: Global_active_power converted to numeric
dt2$Global_active_power <- as.numeric(as.character(dt2$Global_active_power))
)
#5: histogram plot
hist(dt2$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", breaks = 12, xlim = c(0,6), ylim = c(0, 1200))


