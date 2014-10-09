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

png(filename = "plot1.png", width= 480, height = 480)

with(subset, 
     hist(Global_active_power, 
          col = "red",
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)"))

dev.off()

