#load in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#make plot
plot <- as.numeric(finaldata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(plot, main = "Global Active Power", xlab = "Global active power (kilowatts)", ylab = "frequency", col = "red", breaks = 12)
dev.off

