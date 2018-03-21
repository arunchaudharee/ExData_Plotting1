# This R script named plot4.R is a code to create 4 graphs of 
# Energy_Sub_metering, Global_active_power, Voltage and Global_reactive_power with respect to date/time.
# to examine how household energy usage that varies over a 2-day period in February, 2007 from dataset.

## First clear the environment

rm(list=ls(all=TRUE))

# Assuming that the dataset is already downloaded and unzipped.

power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)

# check the summary/structure of data
str(power_data)

# Use data from the dates 2007-02-01 and 2007-02-02 only. 
# read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
# form a separate data.table with the dates 2007-02-01 and 2007-02-02

power_1_2_data <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

#Create new column that combines Date and Time data 
power_1_2_data$Timestamp <-paste(power_1_2_data$Date, power_1_2_data$Time)

# Check the structure of subsetted data
str(power_1_2_data)

# Convert the Date/Time variables to Date/Time classes in R using strptime functions as Date/Time is in chr format.

power_1_2_data$Timestamp = strptime(power_1_2_data$Timestamp, format="%d/%m/%Y %H:%M:%S")

# Let us set the map and value for x axis and y axis before plotting.

x_value <- power_1_2_data$Timestamp
y1_value <- power_1_2_data$Sub_metering_1
y2_value <- power_1_2_data$Sub_metering_2
y3_value <- power_1_2_data$Sub_metering_3
y4_value <- power_1_2_data$Global_active_power
y5_value <- power_1_2_data$Voltage
y6_value <- power_1_2_data$Global_reactive_power

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot4.png", width=480, height=480)

# Let us Set graphing parameters so that 4 graphs are drawn by column
par(mfcol = c(2,2))

# Plot 1st graph in column 1
# Plot graph of global active power data vs date/time
plot(x_value, y4_value, type = "l", xlab = "", ylab = "Global Active Power")


#Plot 2nd graph in column 1 
# Plot Sub metering 1 vs date/time 
plot(x_value, y1_value, type = "l", xlab = "", ylab = "Energy sub metering")

#Add line graph for Sub metering 2 vs date/time in red
lines(x_value, y2_value, type = "l", col = "red" )

#Add line graph for Sub metering 3 vs date/time in blue
lines(x_value, y3_value, type = "l", col = "blue" )

#Add borderless legend to graph with bty= "n" as shown in plot of instruction.
legend("topright",  lty=1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Plot first graph in column 2
# Plot graph of Voltage vs date/time.
plot(x_value, y5_value, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot second graph in column 2
# Plot global reactive power vs date/time.
plot(x_value, y6_value, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()