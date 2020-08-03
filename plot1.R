#Reading data file
Data1 <- read.table("E:/Coursera courses/04_Explority Data Analysis/project1_Dataset/household_power_consumption.txt",skip=1,sep=";")

# Add data headers
names(Data1) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# get the required data
Data1 <- subset(Data1,Data1$Date=="1/2/2007" | Data1$Date =="2/2/2007")

# plot the histogram
hist(as.numeric(Data1$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.copy(png, file ="plot1.png", width = 480, height = 480)
dev.off()