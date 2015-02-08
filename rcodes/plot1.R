dataset=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrow=69516,stringsAsFactors=FALSE)
dataset=dataset[66637:69516,]
dataset$Global_active_power=sapply(dataset$Global_active_power,as.numeric)
dataset$Global_reactive_power=sapply(dataset$Global_reactive_power,as.numeric)
dataset$Voltage=sapply(dataset$Voltage,as.numeric)
dataset$Global_intensity =sapply(dataset$Global_intensity ,as.numeric)
dataset$Sub_metering_1 =sapply(dataset$Sub_metering_1,as.numeric)
dataset$Sub_metering_2 =sapply(dataset$Sub_metering_2,as.numeric)
dates=dataset$Date
times=dataset$Time
datesandtimes=paste(dates,times)
dataset1=cbind(dataset,datesandtimes)
dataset1$datesandtimes=strptime(dataset1$datesandtimes, "%d/%m/%Y %H:%M:%S")
dataset1$datesandtimes=as.POSIXct(dataset1$datesandtimes)
png(file="plot1.png")
hist(dataset1$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")
dev.off()