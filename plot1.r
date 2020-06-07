t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

t$Date <- as.Date(t$Date, "%d/%m/%Y")

t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

t <- t[complete.cases(t),]

dateTime <- paste(t$Date, t$Time)

dateTime <- setNames(dateTime, "DateTime")

t <- t[ ,!(names(t) %in% c("Date","Time"))]

t <- cbind(dateTime, t)

t$dateTime <- as.POSIXct(dateTime)


hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.0ff()