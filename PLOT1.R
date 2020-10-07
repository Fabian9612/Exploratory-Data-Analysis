#Import dataset in txt format.  sep ";", strings as "?"

dates <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Dates february, 2007, 2 
dates1 <- subset(dates, dates$Date == "1/2/2007" | dates$Date == "2/2/2007")
# convert date as factor
dates1$Date <- as.Date(dates1$Date, format = "%d/%m/%Y")
# Convert Global_active_power as numeric
dates1$Global_active_power <- as.numeric(dates1$Global_active_power)


##PLOT 1

hist(dates1$Global_active_power, col = "red", xlab =  "Global Active Power (kilowatts",
     ylab = "Frequency", main = "Global Active Power")


dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
