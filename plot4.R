##Note: set working directory to the directory with the R files
# and ensure data is in same directory

## read rawdata from file
rawdata<-read.table("household_power_consumption.txt",
                    header=TRUE,sep=";",na.strings=c("?"),
                    stringsAsFactors=F)

## select days from specified dates, create a datetime column from date and time columns
data <- rawdata[(rawdata$Date == "1/2/2007") | (rawdata$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


## open png file device, make plots, and close device
png(filename="plot4.png",width = 480, height = 480, units = "px")

par (mfrow = c(2,2))

with(data, {
  #make plot 1
  plot(DateTime,
       Global_active_power,
       xlab="",
       ylab="Global Active Power",
       type="l")
  
  #make plot 2
  plot(DateTime,
       Voltage,
       xlab="datetime",
       ylab="Voltage",
       type="l")
  
  #make plot 3
  cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  plot(DateTime,
       Sub_metering_1,
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
  
  #make plot 4
  plot(DateTime,
       Global_reactive_power,
       xlab="datetime",
       ylab="Global_reactive_power",
       type="l")        
})    
dev.off()