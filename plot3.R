#  Script for plot #3 of Project #1 of Exploratory Data Science
#  Mike Hnat
#  8/9/2015

# Load full dataset and clean up the date formatting
# This assumes a working directory called 'eda-proj1' where I downloaded and extracted the source data file

df_data <- read.csv("./eda-proj1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#  Note:  object.size(df_data) returned a value of 149581752 bytes

df_data$Date <- as.Date(df_data$Date, format="%d/%m/%Y")

# Create a subset of the data broken down by the date range required for the plot

df_data_sub <- subset(df_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df_data)

# Perform conversion of the date and time variables into Date/Time classes using as.Date() as specified in the requirements 

col_dt <- paste(as.Date(df_data_sub$Date), df_data_sub$Time)
df_data_sub$DateAndTime <- as.POSIXct(col_dt)

# Create the plot using the type 'l' within the plot() function.
# This generates a plot with lines connecting the data points
# Use the lines() function to add addtional data
# Use the legend() function to draw the legend in the upper right hand column

plot(df_data_sub$Sub_metering_1~df_data_sub$DateAndTime, type="l", xlab="", ylab="Energy sub metering")
lines(df_data_sub$Sub_metering_2~df_data_sub$DateAndTime, col="Red")
lines(df_data_sub$Sub_metering_3~df_data_sub$DateAndTime, col="Blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1             ", "Sub_metering_2             ","Sub_metering_3             "), lwd=1, lty=c(1,2))

#legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(1,1))

# Save the plot to a .png file and close the device

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()