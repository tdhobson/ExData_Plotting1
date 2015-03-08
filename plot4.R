hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
hpcFiltered <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

#Convert from int to Date
hpcFiltered$Date = as.Date(hpcFiltered$Date, "%d/%m/%Y")

hpcFiltered$DateTime <- strptime(paste(hpcFiltered$Date, hpcFiltered$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2))

#Plot 1
plot(hpcFiltered$DateTime, hpcFiltered$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

#Plot 2
plot(hpcFiltered$DateTime, hpcFiltered$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot 3
plot(hpcFiltered$DateTime, hpcFiltered$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_2, type="l", col="red")
lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_3, type="l", col="blue")

legend("topright", pch="-", col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 4
plot(hpcFiltered$DateTime, hpcFiltered$Global_reactive_power, type="l", xlab="datetime", ylab="global_reactive_power")