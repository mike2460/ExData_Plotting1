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

# Create the actual plot and set color as required


# Save the plot to a .png file and close the device

dev.off()
