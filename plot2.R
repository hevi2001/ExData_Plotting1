## plot2.R
## using data from the dates 2007-02-01 and 2007-02-02
##
## plotting data & creating png (480x480px)
pcon <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                          stringsAsFactors=FALSE, na.strings="?"), 
               Date=="1/2/2007"| Date=="2/2/2007")

date <- as.Date(pcon[,"Date"], "%d/%m/%Y")
time <- pcon[,"Time"]
datetime <- strptime(paste(date, time), "%Y-%m-%d %H:%M:%S")
#pcon1 <- cbind(pcon,datetime)

png(file = "figure/plot2.png", bg = "transparent")
with(pcon, plot(datetime, Global_active_power, type="l", 
                ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
