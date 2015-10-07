plot4 <- function (){
  
  household_power_consumption <- read.table("./data/household_power_consumption.txt", header = T, quote="",sep = ";", dec = ".", 
                                            colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  february_consumption <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")
  february_consumption <- cbind (as.POSIXct(paste(february_consumption$Date, february_consumption$Time), format="%Y-%m-%d %H:%M:%S"),february_consumption)
  names(february_consumption)[1] <- c("datetime")

    png(file = "plot4.png", width = 480, height = 480, units = "px")
    
    par(mfrow = c(2, 2))
    
    with(february_consumption, plot(datetime,Global_active_power, type="l", xlab ="", ylab = "Global Active PoweR"))
    
    with(february_consumption, plot(datetime,Voltage, type="l"))

    with(february_consumption, plot(datetime,Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering"))
    with(february_consumption, lines(datetime,Sub_metering_2, col = "red"))
    with(february_consumption, lines(datetime,Sub_metering_3, col = "blue"))
    legend("topright", lty = c(1,1),bty = "n",col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    with(february_consumption, plot(datetime,Global_reactive_power, type="l"))
  
  
  dev.off()
  
}