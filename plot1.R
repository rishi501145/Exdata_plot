library(dplyr)
HH_dt <- read.delim("household_power_consumption.txt", header=TRUE,  sep = ";")
Feb2007 <- HH_dt %>% 
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date == "2007-02-01" | Date == "2007-02-02")
summary(Feb2007)

#Plot 1
Feb2007$Global_active_power <- as.numeric(Feb2007$Global_active_power)

png(file="plot1.png", width=480, height=480)
hist(Feb2007$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")
dev.off()
