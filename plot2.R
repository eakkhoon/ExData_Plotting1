data.zipfile <- "dataset.zip"
data.file <- "household_power_consumption.txt"

if (!file.exists(data.file)) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                  , data.zipfile)
}

if (!file.exists(data.file)) {
    unzip(data.zipfile)
}

classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
power.data <- read.csv(data.file, na.strings = "?", sep = ";", colClasses = classes)
    
# subset only 2 days data
subset <- power.data[(power.data$Date == "1/2/2007" | power.data$Date == "2/2/2007"),]

# create date object needed for the plot
subset$DateTime <- paste(subset$Date, subset$Time)
subset$DateTime <- strptime(subset$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width= 480, height = 480)

with(subset,
     plot(DateTime, Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
     )

dev.off()