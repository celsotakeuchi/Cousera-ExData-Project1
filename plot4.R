## Assingment Week 1 - Exploratory Data
library("dplyr")


setwd("D:/login de rede/Meus documentos/_Celso Takeuchi/__DataScience/Data Science Specializaiton/4 - Exploratory Data Analysis/Assignment 1")
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=";")

# We will need data from 2007-02-01 and 2007-02-02. We will need to convert
# data and time variable to data;time classes.
data$Date <- as.Date(data$Date, "%d/%m/%Y")
sample_a <- subset(data, data$Date == "2007-02-01")
sample_b <- subset(data, data$Date == "2007-02-02")
sample <- bind_rows(sample_a, sample_b)
rm(sample_a)
rm(sample_b)
rm(data)

### Plot 4
## We need to gather fields of date and time, instead the graphic would be wrong - 24h graphic only
temp <- paste(sample$Date, sample$Time, sep = " ")
temp <- as.POSIXct(temp)

sample$Sub_metering_1 <- as.numeric(as.character(sample$Sub_metering_1))
sample$Sub_metering_2 <- as.numeric(as.character(sample$Sub_metering_2))
sample$Sub_metering_3 <- as.numeric(as.character(sample$Sub_metering_3))
sample$Voltage <- as.numeric(as.character(sample$Voltage))
sample$Global_reactive_power <- as.numeric(as.character(sample$Global_reactive_power))


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(temp, sample$Global_active_power, type = "l", xlab = "", ylab = "Global Activity Power")
plot(temp, sample$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(temp, sample$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meterig")
lines(temp, sample$Sub_metering_2, type = "l", col = "red")
lines(temp, sample$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("sub metering 1", "sub metering 2", "sub metering 3"),lty=, lwd=c(2,2), bty = "n", col = c("black", "red", "blue"))
plot(temp, sample$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()


