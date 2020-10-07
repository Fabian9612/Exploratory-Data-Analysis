#Import dataset in txt format.  sep ";", strings as "?"

dates <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Dates february, 2007, 2 
dates1 <- subset(dates, dates$Date == "1/2/2007" | dates$Date == "2/2/2007")

# Convert Global_active_power as numeric
dates1$Global_active_power <- as.numeric(dates1$Global_active_power)

date_time <- paste(dates1$Date, dates1$Time)
dates1$date_time <- as.POSIXct(date_time, format = "%d/%m/%Y %H:%M:%S")
## PLOT4

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(dates1$Global_active_power ~ dates1$date_time, type = "l",
     ylab = "Global Active Power", xlab = "")
plot(dates1$Voltage ~ dates1$date_time, type = "l",
     ylab = "Voltage", xlab = "")

with(dates1, {plot(Sub_metering_1 ~ date_time, type = "l",
                   ylab = "Energy sub metering", xlab = "")})
lines(dates1$Sub_metering_2 ~ dates1$date_time, col = 'Red')
lines(dates1$Sub_metering_3 ~ dates1$date_time, col = 'Blue')
plot(dates1$Global_reactive_power ~ dates1$date_time, type = "l",
     ylab = "Global_reactive_power", xlab = "")


# save plot 
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
