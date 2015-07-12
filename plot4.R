# Read the data for the time range 01-02/02/2015
data <- read.csv('household_power_consumption.txt', header = FALSE,  skip = 66637, nrows = 2880, sep = ';')
data2 <- read.csv('household_power_consumption.txt',  nrows = 1, sep = ';')
headers <- names(data2)
names(data) <- headers

## convert the dates
datum <- paste(data$Date,data$Time, sep = ' ')
datum <- strptime(datum, format = '%d/%m/%Y %H:%M:%S')


# Plot 4
par(mfcol = c(2,2))

# subplot 1: repeat plot 2
plot(datum,data$Global_active_power, 
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

# subplot 2: repeat plot 3
plot(datum, data$Sub_metering_1, 
     type = 'l',
     col = 'black',
     xlab = '',
     ylab = 'Energy sub metering')
lines(datum, data$Sub_metering_2, 
      type = 'l',
      col = 'red')
lines(datum, data$Sub_metering_3, 
      type = 'l',
      col = 'blue')
legend('topright', names(data[,7:9]), lty = 1, col = c('black', 'red','blue'),bty='n', cex = 0.5)

# subplot 3:
plot(datum,data$Voltage, 
     type = 'l',
     xlab = 'datetime',
     ylab = 'Voltage')

# subplot 4:
plot(datum, data$Global_reactive_power, 
     type = 'l',
     xlab = 'datetime',
     ylab = 'Global_reactive_power')

dev.copy(png,file = 'plot4.png')