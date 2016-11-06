library(lubridate)

#load in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#combine data and time columns
finaldata$date_time <- dmy_hms(paste(finaldata$Date, finaldata$Time))

#form plot
png("plot2.png", width = 480, height = 480)
plot(finaldata$date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()

