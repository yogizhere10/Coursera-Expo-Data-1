## To read Text File and convert into Table format
library(dplyr)
hpower <- read.table("house.txt", stringsAsFactors = FALSE, sep = ";")

## To change name of columns
names(hpower) <- c("Date","Time","GApower","GRpower","Voltage","Gintensity","s_met1","s_met2","s_met3")

## To subset required data and store into spower
spower <- subset(hpower, hpower$Date == "1/2/2007" | hpower$Date == "2/2/2007")

## Basic plotting function
hist(as.numeric(as.character(spower$GApower)), col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
title(main = "Global Active Power")

## To save plot as png
dev.copy(png, file = "Plot1.png", width=480, height=480)
dev.off()
