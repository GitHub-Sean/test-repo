
#plot2.R

#1: Read Table
dt1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#2: Paste Date and Time, then convert to POSIXlt format, so we can filter for given date range
dt1$DateTime <- paste(dt1$Date, dt1$Time)
dt1$DateTime <- strptime(dt1$DateTime, "%d/%m/%Y %H:%M:%S")

#3: Filtered for given date range
dt2 <- dt1[(dt1$DateTime >= "2007-02-01 00:00:00" & dt1$DateTime <= "2007-02-03 00:00:00"), ]

#4: Global_active_power converted to numeric
dt2$Global_active_power <- as.numeric(as.character(dt2$Global_active_power))

#5: This sets up the plot
with(dt2, plot(DateTime, Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power (kilowatts)", ylim = c(0,8)))

#6: This produces the plot
with(dt2, lines(DateTime, Global_active_power))