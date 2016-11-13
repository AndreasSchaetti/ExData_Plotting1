library(dplyr)
library(lubridate)

# Read data
df <- read.table("payments.csv")

# Select rows corresponding to two days: 2007-02-01 and 2007-02-02
df <- df_complete %>% 
  filter(dmy(Date) >= dmy("01/02/2007"), dmy(Date) <= dmy("02/02/2007"))

# Create histogram of Global Active Power
png(file = "plot1.png", width=480, height=480, units="px")

with(df, hist(Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red"))

dev.off()