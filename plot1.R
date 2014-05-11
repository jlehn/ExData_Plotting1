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
png(filename="plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()