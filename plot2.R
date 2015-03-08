hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
hpcFiltered <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

#Convert from int to Date
hpcFiltered$Date = as.Date(hpcFiltered$Date, "%d/%m/%Y")

hpcFiltered$DateTime <- strptime(paste(hpcFiltered$Date, hpcFiltered$Time), format="%Y-%m-%d %H:%M:%S")

plot(hpcFiltered$DateTime, hpcFiltered$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")