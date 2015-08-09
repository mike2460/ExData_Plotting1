##  Script for plot #1 of Project #1 of Exploratory Data Science
##  Mike Hnat
##  8/9/2015

## Load full dataset and clean up the date formatting
## This assumes a working directory called eda-proj1 where I downloaded and extracted the file

df_data <- read.csv("./eda-proj1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

df_data$Date <- as.Date(df_data$Date, format="%d/%m/%Y")

## Create a subset of the data broken down by the date range required for the plot

df_data_sub <- subset(df_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df_data)

## Perform conversion of the date values 

datetime <- paste(as.Date(df_data_sub$Date), df_data_sub$Time)
df_data_sub$Datetime <- as.POSIXct(datetime)

## Create the actual plot and set color as required
## Axes should match

hist(df_data_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save the plot to a .png file and close the 

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()