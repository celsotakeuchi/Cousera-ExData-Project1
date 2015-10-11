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

## Convert Dates
dt <- paste(sample$Date, sample$Time, sep = " ")
datetime <- strptime(dt, "%d/%m/%y %H%M%S")

### Plot 2
## We need to gather fields of date and time, instead the graphic would be wrong - 24h graphic only
temp <- paste(sample$Date, sample$Time, sep = " ")
temp <- as.POSIXct(temp)
sample$Global_active_power <- as.numeric(as.character(sample$Global_active_power))

plot(temp, sample$Global_active_power, type = "l", ylab = "Global Activity Power")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

