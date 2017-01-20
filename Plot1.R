library(lubridate)

# Set working directory.  It should have a data folder in it with the source file
setwd("~/Documents/GitHub/ExData_Plotting1/")

#Load and process data file
electricity <- read.csv("data/household_power_consumption.txt", sep = ";")
electricity$Date <- as.Date(electricity$Date, "%d/%m/%Y")

#Limit it to date for project
electricity <- electricity[electricity$Date >= ymd("2007-02-01") & electricity$Date <= ymd("2007-02-02"),]

#Correct Numeric values
electricity[,3:9] <- sapply(electricity[,3:9], as.character)
electricity[,3:9] <- sapply(electricity[,3:9], as.numeric)



#Plot
png(filename = "Plot1.png", width = 480, height = 480)
hist(electricity$Global_active_power, col = "red", xlab = "Global Active Power (kilowats)", main = "Global Active Power")
dev.off()