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

###Plot 3
temp <- paste(sample$Date, sample$Time, sep = " ")
temp <- as.POSIXct(temp)
sample$Sub_metering_1 <- as.numeric(as.character(sample$Sub_metering_1))
sample$Sub_metering_2 <- as.numeric(as.character(sample$Sub_metering_2))
sample$Sub_metering_3 <- as.numeric(as.character(sample$Sub_metering_3))

plot(temp, sample$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meterig")
lines(temp, sample$Sub_metering_2, col = "red")
lines(temp, sample$Sub_metering_3, col = "blue")
legend("topright", c("sub metering 1", "sub metering 2", "sub metering 3"),lty=1, lwd=2.5, col = c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()

