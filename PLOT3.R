#Import dataset in txt format.  sep ";", strings as "?"

dates <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Dates february, 2007, 2 
dates1 <- subset(dates, dates$Date == "1/2/2007" | dates$Date == "2/2/2007")

# Convert Global_active_power as numeric
dates1$Global_active_power <- as.numeric(dates1$Global_active_power)

date_time <- paste(dates1$Date, dates1$Time)
dates1$date_time <- as.POSIXct(date_time, format = "%d/%m/%Y %H:%M:%S")


##PLOT 3
with(dates1,  {plot(Sub_metering_1~date_time, type = "l", ylab = "Energy sub metering", 
                    xlab = "")
     lines(Sub_metering_2 ~ date_time,col = "Red")
     lines(Sub_metering_3 ~ date_time,col = "Blue")
     })
#legend 
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
