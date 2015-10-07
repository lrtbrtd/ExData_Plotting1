plot1 <- function(){
  
  household_power_consumption <- read.table("./data/household_power_consumption.txt", header = T, quote="",sep = ";", dec = ".", 
                                            colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  head(household_power_consumption)
  #str(household_power_consumption)
  february_consumption <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")
  png(file = "plot1.png", width = 480, height = 480, units = "px")
  hist(february_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
  }