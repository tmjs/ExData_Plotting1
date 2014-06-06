## read in the data frame, extract the two necessary columns, and subset
## down to the '2007-02-01' and '2007-02-02'

df <- read.csv("household_power_consumption.txt",
               header = TRUE, sep = ";", nrows = 2100000,
               colClasses = "character")
df <- df[, c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
df$DateTime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df.sub <- subset(df, as.Date(DateTime) == "2007-02-01"
                 | as.Date(DateTime) == "2007-02-02")

##open the png file
png(filename = "plot3.png", width = 480, height = 480)

## create the base plot, set axis length, and apply labels
with(df.sub, plot(DateTime, Sub_metering_1, type="l", col="black",
                  xlab = "", ylab = "Energy sub metering"))
with(df.sub, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(df.sub, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", pch="____", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##close the device
dev.off() 
