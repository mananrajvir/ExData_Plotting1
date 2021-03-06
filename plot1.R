## Formatting the Data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
datetime <- paste(as.Date(hpc$Date),hpc$Time)
datetime <- as.POSIXct(datetime)
hpc <- cbind(hpc,datetime)

## Creating the Plot
png(filename="plot1.png",width=480,height=480)
hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power")
dev.off()
