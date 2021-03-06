setwd("~/github/Exploratory_Data_Analysis/ExData_Plotting1")
## Read the dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Convert dates and concatenate Date Time
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()