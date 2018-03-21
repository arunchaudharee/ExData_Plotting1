# This R script named plot2.R is coded to create graph of global active power data vs date/time.
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

str(power_1_2_data)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot2.png", width=480, height=480)

# Let us set the map and value for x axis and y axis before plotting.

x_value <- power_1_2_data$Timestamp
y_value <- power_1_2_data$Global_active_power

# Now Plot the global active power data vs date/time. 
plot(x_value,y_value, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

# Now let us off the plotting device to enable open/view the created file of plot.
dev.off()


