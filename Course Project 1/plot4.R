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


# Plot 4

par(mfrow = c(2,2))
plot(mydata$Time, mydata$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l",
     cex.lab = 0.8)
plot(mydata$Time, mydata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l",
     cex.lab = 0.8)
plot(mydata$Time, mydata$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering", cex.lab = 0.8)
lines(mydata$Time, mydata$Sub_metering_2, col = "red")
lines(mydata$Time, mydata$Sub_metering_3, col = "blue")
legend("topright", inset = 0.05, lwd = c(1,1,1), col = c("black", "red", "blue"), box.lty = 0, cex = 0.7, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(mydata$Time, mydata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l",
     cex.lab = 0.8)

dev.copy(png, file = "plot4.png")
dev.off()
