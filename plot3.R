plot3 <- function(){
  
  # read householde_power_consumption leaving the Date and Time column as "character" and the rest of the columns as "numeric
  household_power_consumption <- read.table("./data/household_power_consumption.txt", header = T, quote="",sep = ";", dec = ".", 
                                            colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
  
  # convert Date column into Date format
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
  
  # Extract the data measured between 02/01/2007 & 02/02/2007
  february_consumption <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")
  
  # create a new column "Date_time" concatenating "Date" & "Time" columns and converting the into POSIXct format
  february_consumption <- cbind (as.POSIXct(paste(february_consumption$Date, february_consumption$Time), format="%Y-%m-%d %H:%M:%S"),february_consumption)
  names(february_consumption)[1] <- c("Date_Time")
  
  # create the png file to keep an image of the plot
  png(file = "plot3.png", width = 480, height = 480, units = "px")
  
  # draw the plot ofthe three Energy_sub_metering consumption on the same graph
  with(february_consumption, plot(Date_Time,Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering"))
  with(february_consumption, lines(Date_Time,Sub_metering_2, col = "red"))
  with(february_consumption, lines(Date_Time,Sub_metering_3, col = "blue"))
  
  # draw the legend 
  legend("topright", lty = c(1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  dev.off()
  }