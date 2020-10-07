#Import dataset in txt format.  sep ";", strings as "?"

dates <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Dates february, 2007, 2 
dates1 <- subset(dates, dates$Date == "1/2/2007" | dates$Date == "2/2/2007")

# Convert Global_active_power as numeric
dates1$Global_active_power <- as.numeric(dates1$Global_active_power)


date_time <- paste(dates1$Date, dates1$Time)
dates1$date_time <- as.POSIXct(date_time, format = "%d/%m/%Y %H:%M:%S")

##PLOT 2

plot(dates1$Global_active_power ~ dates1$date_time, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#save
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
