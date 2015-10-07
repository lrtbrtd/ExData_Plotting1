plot1 <- function(){
  # read householde_power_consumption leaving the Date and Time column as "character" and the rest of the columns as "numeric
  household_power_consumption <- read.table("./data/household_power_consumption.txt", header = T, quote="",sep = ";", dec = ".", 
                                            colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
  
  # convert Date column into Date format
  household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

  # Extract the data measured between 02/01/2007 & 02/02/2007
  february_consumption <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")
  
  # create the png file to keep an image of the plot
  png(file = "plot1.png", width = 480, height = 480, units = "px")
  
  # draw bar chart of the Global_active_power consumption
  hist(february_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  
  dev.off()
  }