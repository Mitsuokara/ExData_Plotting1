dados<-read.csv("household_power_consumption.txt",header = TRUE, sep = ";", colClasses = c(rep("character",9)), na.strings = "?")
x<-paste(dados$Date,dados$Time)
x<-strptime(x,format="%d/%m/%Y %H:%M:%S")
dados$Time<-x
dados$Date<-as.Date(dados$Date, format="%d/%m/%Y")
result<-subset(dados, Date %in% c(as.Date("2007/02/01"), as.Date("2007/02/02")))
result$Global_active_power <- sapply(result$Global_active_power, as.numeric)
plot(result$Time, result$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, "plot2.png")
dev.off()
  