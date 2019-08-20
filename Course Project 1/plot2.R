# Loading File


if(!file.exists("./data")){dir.create("./data")}
setwd("./data")
dir()


mydata <- read.table("household_power_consumption.txt", nrows = 2870, skip = 66637
                     , sep=";")


# 2/1/2007/ :66637
# ~ 2/2/2007: 69507


names(mydata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                   "Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2",
                   "Sub_metering_3")


# convert the Date and Time variables to Date/Time classes


mydata$Time <- paste(mydata$Date, mydata$Time)
mydata$Time <- strptime(mydata$Time, format = "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")



Sys.setlocale("LC_TIME", "C")


# Plot 2



plot(mydata$Time, mydata$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)", xlab ="")

dev.copy(png, file = "plot2.png")
dev.off()


