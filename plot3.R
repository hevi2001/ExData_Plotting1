## plot3.R
## using data from the dates 2007-02-01 and 2007-02-02
##
## plotting data & creating png (480x480px)
pcon <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                          stringsAsFactors=FALSE, na.strings="?"), 
               Date=="1/2/2007"| Date=="2/2/2007")

date <- as.Date(pcon[,"Date"], "%d/%m/%Y")
time <- pcon[,"Time"]
datetime <- strptime(paste(date, time), "%Y-%m-%d %H:%M:%S")

png(file = "figure/plot3.png", bg = "transparent")
with(pcon, {plot(datetime, Sub_metering_1, type="l", 
                 ylab="Global Active Power (kilowatts)", xlab="")
            points(datetime, Sub_metering_2, type="l", col="red")
            points(datetime, Sub_metering_3, type="l", col="blue")})
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
