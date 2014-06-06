## read in the data frame, extract the two necessary columns, and subset
## down to the '2007-02-01' and '2007-02-02'

df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2100000, colClasses = "character")
df <- df[, c("Date", "Global_active_power")]
df$Date <- strptime(df$Date, "%d/%m/%Y")
df.sub <- subset(df, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02")
df.sub$Global_active_power <- as.numeric(df.sub$Global_active_power)

##open the png file
png(filename = "plot1.png", width = 480, height = 480)

## create the base plot, set axis length, and apply labels
hist(df.sub$Global_active_power, xlim=c(0,8), ylim = c(0,1200), axes=FALSE, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowats)", ylab="Frequency")

## set the axis
axis(1, seq(0, 6, 2))
axis(2, seq(0, 1200, 200))

## output the plot to file
dev.off() #close  the device
