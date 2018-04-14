dados<-read.csv("household_power_consumption.txt",header = TRUE, sep = ";", colClasses = c("Date", rep("character",8)))
result<-subset(dados, Date %in% c(as.Date("01/02/2017"), as.Date("02/02/2017")))
result$Global_active_power <- sapply(result$Global_active_power, as.numeric)
hist(result$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
     