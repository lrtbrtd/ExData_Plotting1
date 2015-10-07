plot2 <- function(){
  
  household_power_consumption <- read.table("./data/household_power_consumption.txt", header = T, quote="",sep = ";", dec = ".", 
                                            colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  february_consumption <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")
  february_consumption <- cbind (as.POSIXct(paste(february_consumption$Date, february_consumption$Time), format="%Y-%m-%d %H:%M:%S"),february_consumption)
  names(february_consumption)[1] <- c("Date_Time")
  #household_power_consumption$Time <- as.POSIXct(household_power_consumption$Time,format="%H:%M:%S")
  head(february_consumption)
  #str(household_power_consumption)
  png(file = "plot2.png", width = 480, height = 480, units = "px")
  with(february_consumption, plot(Date_Time,Global_active_power, type="l", xlab ="", ylab = "Global Active Power (kilowatts)"))
  dev.off()
  }