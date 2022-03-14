library(dplyr)
HH_dt <- read.delim("household_power_consumption.txt", header=TRUE,  sep = ";")
Feb2007 <- HH_dt %>% 
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date == "2007-02-01" | Date == "2007-02-02")
summary(Feb2007)

#Plot 2
Feb2007$Global_active_power <- as.numeric(Feb2007$Global_active_power)
Feb2007$DateTime <- as.POSIXct(paste(Feb2007$Date, Feb2007$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width=480, height=480)
plot(Feb2007$DateTime,Feb2007$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
