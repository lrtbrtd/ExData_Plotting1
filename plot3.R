plot3 <- function(){
  
  household_power_consumption <- read.table("./data/household_power_consumption.txt", header = T, quote="",sep = ";", dec = ".", 
                                            colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  february_consumption <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")
  february_consumption <- cbind (as.POSIXct(paste(february_consumption$Date, february_consumption$Time), format="%Y-%m-%d %H:%M:%S"),february_consumption)
  names(february_consumption)[1] <- c("Date_Time")
  #household_power_consumption$Time <- as.POSIXct(household_power_consumption$Time,format="%H:%M:%S")
  #head(february_consumption)
  #str(household_power_consumption)
  png(file = "plot3.png", width = 480, height = 480, units = "px")
  with(february_consumption, plot(Date_Time,Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering"))
  with(february_consumption, lines(Date_Time,Sub_metering_2, col = "red"))
  with(february_consumption, lines(Date_Time,Sub_metering_3, col = "blue"))
  legend("topright", lty = c(1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #with(february_consumption, plot(Date_Time,Sub_metering_3, type="l", xlab ="", ylab = "Energy sub metering"))
  dev.off()
  }