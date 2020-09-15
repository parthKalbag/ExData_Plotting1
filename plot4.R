df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
df <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
df$datetime <- as.POSIXct(datetime)
with(df, { plot(Global_active_power~datetime, type="l", 
                ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="") })

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()