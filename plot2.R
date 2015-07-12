# Read the data for the time range 01-02/02/2015
data <- read.csv('household_power_consumption.txt', header = FALSE,  skip = 66637, nrows = 2880, sep = ';')
data2 <- read.csv('household_power_consumption.txt',  nrows = 1, sep = ';')
headers <- names(data2)
names(data) <- headers

## convert the dates
datum <- paste(data$Date,data$Time, sep = ' ')
datum <- strptime(datum, format = '%d/%m/%Y %H:%M:%S')

# Plot 2
plot(datum,data$Global_active_power, 
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')
dev.copy(png,file = 'plot2.png')