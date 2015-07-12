setwd("D:/Profiles/dverhann/Desktop/R/Course_Exploratory_Data_Analysis/week1")

library(sqldf)

DataFileLoc="./exdata_data_household_power_consumption/household_power_consumption.txt"
SqlStatement="select Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3 from file  WHERE Date='1/2/2007' OR Date='2/2/2007'"
mydata <- read.csv.sql(DataFileLoc, sql = SqlStatement,header = TRUE, sep= ';')

mydata$Datetime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")

plot(mydata$Datetime, mydata$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")

lines(mydata$Datetime, mydata$Sub_metering_2,col="red")

lines(mydata$Datetime, mydata$Sub_metering_3,col="blue")

legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black", "red", "blue"))

dev.copy(png,'plot3.png', width=480, height=480)
dev.off()