setwd("D:/Profiles/dverhann/Desktop/R/Course_Exploratory_Data_Analysis/week1")

library(sqldf)

DataFileLoc="./exdata_data_household_power_consumption/household_power_consumption.txt"
SqlStatement="select Date,Time,Global_active_power from file  WHERE Date='1/2/2007' OR Date='2/2/2007'"
mydata <- read.csv.sql(DataFileLoc, sql = SqlStatement,header = TRUE, sep= ';')

mydata$Date <- as.Date(mydata$Date , "%d/%m/%Y")

hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="Red")

dev.copy(png,'plot1.png', width=480, height=480)
dev.off()