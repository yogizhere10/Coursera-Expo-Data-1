## To read Text File and convert into Table format
library(dplyr)
hpower <- read.table("house.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";")

## To change name of columns
names(hpower) <- c("Date","Time","GApower","GRpower","Voltage","Gintensity","s_met1","s_met2","s_met3")

## To subset required data and store into spower
spower <- subset(hpower, hpower$Date == "1/2/2007" | hpower$Date == "2/2/2007")

## To convert Date and Time into required format
spower$Date <- as.Date(spower$Date, format = "%d%m%Y")
spower$Time <- strptime(spower$Time, format = "%H:%M:%S")
spower[1:1440,"Time"] <- format(spower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
spower[1441:2880,"Time"] <- format(spower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Basic plot
plot(spower$Time, as.numeric(as.character(spower$s_met1)), type = "n", xlab = "", ylab = "Energy Sub Metering" )
with(spower, lines(Time, as.numeric(as.character(s_met1))))
with(spower, lines(Time, as.numeric(as.character(s_met2)), col = "red"))
with(spower, lines(Time, as.numeric(as.character(s_met3)), col = "blue"))
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main = "Energy Sub Metering")

## To save png file
dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()
