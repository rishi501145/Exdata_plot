library(dplyr)
HH_dt <- read.delim("household_power_consumption.txt", header=TRUE,  sep = ";")
Feb2007 <- HH_dt %>% 
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date == "2007-02-01" | Date == "2007-02-02")
summary(Feb2007)

#Plot 3
Feb2007$Sub_metering_1 <- as.numeric(Feb2007$Sub_metering_1)
Feb2007$Sub_metering_2 <- as.numeric(Feb2007$Sub_metering_2)
Feb2007$Sub_metering_3 <- as.numeric(Feb2007$Sub_metering_3)
Feb2007$DateTime <- as.POSIXct(paste(Feb2007$Date, Feb2007$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot3.png", width=480, height=480)
plot(Feb2007$DateTime, Feb2007$Sub_metering_1 ,type="l", col= "black",
     xlab = "", ylab = "Energy sub metering")
lines(Feb2007$DateTime, Feb2007$Sub_metering_2 ,type="l", col= "red")
lines(Feb2007$DateTime, Feb2007$Sub_metering_3 ,type="l", col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty= 1, col = c("black", "red", "blue"))
dev.off()
