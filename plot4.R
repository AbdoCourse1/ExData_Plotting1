Data1 <- read.table("E:/Coursera courses/04_Explority Data Analysis/project1_Dataset/household_power_consumption.txt",skip=1,sep=";")

# Add data headers
names(Data1) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# get the required data
Data1 <- subset(Data1,Data1$Date=="1/2/2007" | Data1$Date =="2/2/2007")



# Convert Date and Time from characters to objects of type Date and POSIXlt.
Data1$Date <- as.Date(Data1$Date, format="%d/%m/%Y")
Data1$Time <- strptime(Data1$Time, format="%H:%M:%S")
Data1[1:1440,"Time"] <- format(Data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Data1[1441:2880,"Time"] <- format(Data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Divide the graphic device to 2 cols and 2 rows
par(mfrow=c(2,2))

# plot the graph
with(Data1,{
        plot(Data1$Time,as.numeric(Data1$Global_active_power),type="l",  xlab="",ylab="Global Active Power")  
        plot(Data1$Time,as.numeric(Data1$Voltage), type="l",xlab="datetime",ylab="Voltage")
        plot(Data1$Time,Data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        lines(Time,as.numeric(Sub_metering_1))
        lines(Time,as.numeric(Sub_metering_2),col="red")
        lines(Time,as.numeric(Sub_metering_3),col="blue")
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
        plot(Data1$Time,as.numeric(Data1$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.copy(png, file ="plot4.png", width = 480, height = 480)
dev.off()
