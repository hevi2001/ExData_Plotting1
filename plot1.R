## plot1.R
## using data from the dates 2007-02-01 and 2007-02-02
##
## plotting data & creating png (480x480px)
pcon <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                          stringsAsFactors=FALSE, na.strings="?"), 
               Date=="1/2/2007"| Date=="2/2/2007")
png(file = "figure/plot1.png", bg = "transparent")
with(pcon, hist(Global_active_power, col="red", main="Global Active Power", 
                    xlab="Global Active Power (kilowatts)"))
dev.off()
