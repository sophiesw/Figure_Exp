data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "NA", colClasses = "character")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
sdata <- subset(data, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02')
sdata$E_Time = paste(sdata$Date, sdata$Time, sep=" ")
sdata$E_Time <- strptime(sdata$E_Time, "%Y-%m-%d %H:%M:%S")

sdata$Voltage <- as.numeric(sdata$Voltage)
sdata$Global_active_power <- as.numeric(sdata$Global_active_power)
sdata$Global_reactive_power <- as.numeric(sdata$Global_reactive_power)
sdata$Global_intensity <- as.numeric(sdata$Global_intensity)
sdata$Sub_metering_1  <- as.numeric(sdata$Sub_metering_1 )
sdata$Sub_metering_2  <- as.numeric(sdata$Sub_metering_2)
sdata$Sub_metering_3  <- as.numeric(sdata$Sub_metering_3)

png("plot2.png", width = 480, height = 480)
plot(sdata$E_Time, sdata$Global_active_power, ylab ="Global Active Power (kilowatts)", main="", xlab="", sub="", type= "l")
dev.off()