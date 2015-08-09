#  Script for plot #4 of Project #1 of Exploratory Data Science
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
df_data_sub$datetime  <- as.POSIXct(col_dt)

# Split the viewing area into 4 panes

par(mfrow=c(2,2))

# First plot

plot(df_data_sub$Global_active_power~df_data_sub$datetime, type="l", xlab="", ylab="Global Active Power")

# Second plot

plot(df_data_sub$Voltage~df_data_sub$datetime, type="l", xlab="datetime", ylab="Voltage")

# Third plot 

plot(df_data_sub$Sub_metering_1~df_data_sub$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(df_data_sub$Sub_metering_2~df_data_sub$datetime, col="Red")
lines(df_data_sub$Sub_metering_3~df_data_sub$datetime, col="Blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(1,1), bty="n")

# Fourth plot

plot(df_data_sub$Global_reactive_power~df_data_sub$datetime, type="l", xlab="datetime", ylab="Global_reactive_power")


# Save the plot to a .png file and close the device

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()