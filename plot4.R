## plot4.R
## using data from the dates 2007-02-01 and 2007-02-02
##
## plotting data & creating png (480x480px)
## the png file at figure directory
pcon <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                          stringsAsFactors=FALSE, na.strings="?"), 
               Date=="1/2/2007"| Date=="2/2/2007")

datetime <- strptime(paste(as.Date(pcon[,"Date"], "%d/%m/%Y"), pcon[,"Time"]), 
                     "%Y-%m-%d %H:%M:%S")

png(file = "figure/plot4.png", bg = "transparent")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 0, 2, 1))
with(pcon, {
        plot(datetime, Global_active_power, type="l", 
             ylab="Global Active Power", xlab="") 
        plot(datetime, Voltage, type="l")
        {{
                plot(datetime, Sub_metering_1, type="l", 
                     ylab="Energy sub metering", xlab="") 
                points(datetime, Sub_metering_2, type="l", col="red") 
                points(datetime, Sub_metering_3, type="l", col="blue")
                } 
         legend("topright", lty = 1, bty = "n", col = c("black", "blue", "red"), 
                         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        }
        plot(datetime, Global_reactive_power, type="l")
        })
dev.off()