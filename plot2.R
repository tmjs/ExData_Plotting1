## read in the data frame, extract the two necessary columns, and subset
## down to the '2007-02-01' and '2007-02-02'

df <- read.csv("household_power_consumption.txt",
               header = TRUE, sep = ";", nrows = 2100000,
               colClasses = "character")
df <- df[, c("Date", "Time", "Global_active_power")]
df$DateTime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df.sub <- subset(df, as.Date(DateTime) == "2007-02-01"
                 | as.Date(DateTime) == "2007-02-02")

##open the png file
png(filename = "plot2.png", width = 480, height = 480)

## create the base plot, set axis length, and apply labels
plot(df.sub$DateTime, df.sub$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowats)")

##close the device
dev.off() 
