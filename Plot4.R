library(lubridate)

# Set working directory.  It should have a data folder in it with the source file
setwd("~/Documents/GitHub/ExData_Plotting1/")

#Load and process data file
electricity <- read.csv("data/household_power_consumption.txt", sep = ";")
electricity$Date <- as.Date(electricity$Date, "%d/%m/%Y")
electricity$datetime <- paste(electricity$Date, electricity$Time)
electricity$datetime <- ymd_hms(electricity$datetime)

#Limit it to date for project
electricity <- electricity[electricity$Date >= ymd("2007-02-01") & electricity$Date <= ymd("2007-02-02"),]

#Correct Numeric values
electricity[,3:9] <- sapply(electricity[,3:9], as.character)
electricity[,3:9] <- sapply(electricity[,3:9], as.numeric)

par(mfrow = c(2,2))

#Plot
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#Sub plot 1:
plot(electricity$Global_active_power ~ electricity$datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Sub plot 2:
plot(electricity$Voltage ~ electricity$datetime, type = "l", xlab = "datetime", ylab = "Voltage")

#Sub plot 3:
plot(electricity$datetime, electricity$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub meetering")
lines(electricity$datetime, electricity$Sub_metering_2, col = "red")
lines(electricity$datetime, electricity$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

#sub plot 4:
plot(electricity$Global_reactive_power ~ electricity$datetime, type = "l", xlab = "datetime")

dev.off()