dados<-read.csv("household_power_consumption.txt",header = TRUE, sep = ";", colClasses = c(rep("character",9)), na.strings = "?")
dados$Date<-as.Date(dados$Date, format="%d/%m/%Y")
result<-subset(dados, Date %in% c(as.Date("2007/02/01"), as.Date("2007/02/02")))
result$Global_active_power <- sapply(result$Global_active_power, as.numeric)
hist(result$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
     