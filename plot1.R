# This R script named plot1.R is coded to plot histogram of Global active power.
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

# Plot the histogram of Global_active_power. Make a plot on screen.
hist(power_1_2_data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")

# Copy the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,"plot1.png", width=480, height=480)

# Off the plot device.
dev.off()
