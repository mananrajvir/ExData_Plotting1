## Formating the Data:
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- subset(hpc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
datetime <- paste(as.Date(hpc$Date),hpc$Time)
datetime <- as.POSIXct(datetime)
hpc <- cbind(hpc,datetime)

## Creating the Plot:
png(filename="plot3.png",width=480,height=480)
plot(hpc$Sub_metering_1~hpc$datetime,type="l",col="black",ylab="Energy sub metering",xlab=" ")
lines(hpc$Sub_metering_2~hpc$datetime,col="red")
lines(hpc$Sub_metering_3~hpc$datetime,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()