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

#Plot
png(filename = "Plot2.png", width = 480, height = 480)
plot(electricity$Global_active_power ~ electricity$datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()