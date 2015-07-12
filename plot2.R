setwd("D:/Profiles/dverhann/Desktop/R/Course_Exploratory_Data_Analysis/week1")

library(sqldf)

DataFileLoc="./exdata_data_household_power_consumption/household_power_consumption.txt"
SqlStatement="select Date,Time,Global_active_power from file  WHERE Date='1/2/2007' OR Date='2/2/2007'"
mydata <- read.csv.sql(DataFileLoc, sql = SqlStatement,header = TRUE, sep= ';')

mydata$Datetime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")

plot(mydata$Datetime, mydata$Global_active_power, type="l", main="Global Active Power", xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png,'plot2.png', width=480, height=480)
dev.off()