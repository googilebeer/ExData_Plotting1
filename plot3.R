library(lubridate)

#load in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#combine data and time columns
finaldata$date_time <- dmy_hms(paste(finaldata$Date, finaldata$Time))
#convert columns to numeric class
global_active_power <- as.numeric(finaldata$Global_active_power)
sub_metering1 <- as.numeric(finaldata$Sub_metering_1)
sub_metering2 <- as.numeric(finaldata$Sub_metering_2)
sub_metering3 <- as.numeric(finaldata$Sub_metering_3)

#form plot
png("plot3.png", width = 480, height = 480)
plot(finaldata$date_time, sub_metering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(finaldata$date_time, sub_metering2, type = "l", col = "red")
lines(finaldata$date_time, sub_metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()