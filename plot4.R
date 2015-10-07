plot4 <- function (){
  
  # read householde_power_consumption leaving the Date and Time column as "character" and the rest of the columns as "numeric
  household_power_consumption <- read.table("./data/household_power_consumption.txt", header = T, quote="",sep = ";", dec = ".", 
                                            colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
  
  # convert Date column into Date format
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  
  # Extract the data measured between 02/01/2007 & 02/02/2007
  february_consumption <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")
  
  # create a new column "datetime" concatenating "Date" & "Time" columns and converting the into POSIXct format
  february_consumption <- cbind (as.POSIXct(paste(february_consumption$Date, february_consumption$Time), format="%Y-%m-%d %H:%M:%S"),february_consumption)
  names(february_consumption)[1] <- c("datetime")

  # create the png file to keep an image of the plot
  png(file = "plot4.png", width = 480, height = 480, units = "px")
  
  # Declare the multiframes plot 2 by 2  
  par(mfrow = c(2, 2))
  
  # Draw the four plots  
  
  # Plot upper left
  with(february_consumption, plot(datetime,Global_active_power, type="l", xlab ="", ylab = "Global Active PoweR"))
  
  # Plot upper Right
  with(february_consumption, plot(datetime,Voltage, type="l"))
  
  # Plot lower left
  with(february_consumption, plot(datetime,Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering"))
  with(february_consumption, lines(datetime,Sub_metering_2, col = "red"))
  with(february_consumption, lines(datetime,Sub_metering_3, col = "blue"))
  legend("topright", lty = c(1,1),bty = "n",col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # Plot lower right  
  with(february_consumption, plot(datetime,Global_reactive_power, type="l"))
  
  dev.off()
}