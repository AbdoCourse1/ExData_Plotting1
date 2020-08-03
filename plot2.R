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


# plot the graph
plot(Data1$Time,as.numeric(as.character(Data1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Add a title to the graph
title(main="Global Active Power Vs Time")

dev.copy(png, file ="plot2.png", width = 480, height = 480)
dev.off()