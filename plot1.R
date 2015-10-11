## Assingment Week 1 - Exploratory Data
library(dplyr)
setwd("D:/login de rede/Meus documentos/_Celso Takeuchi/__DataScience/Data Science Specializaiton/4 - Exploratory Data Analysis/Assignment 1")

##Reading data
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

# The cloumn need to ve converted into numeric
sample$Global_active_power <- as.numeric(as.character(sample$Global_active_power))
hist(sample$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.copy(png, "plot1.png", height = 480, width = 480)
dev.off()





