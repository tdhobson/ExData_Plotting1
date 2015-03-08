hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
hpcFiltered <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

hist(hpcFiltered$Global_active_power, col="#FF2500", main="Global Active Power", xlab="Global Active Power (kilowatts)")