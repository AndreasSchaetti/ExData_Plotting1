library(dplyr)
library(lubridate)

# Guess classes
df_initial <- read.table("../../ex1/household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         na.strings = "?",
                         nrows = 100)
classes <- sapply(df_initial, class)

# Read whole text file
df_complete <- read.table("../../ex1/household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         na.strings = "?",
                         colClasses = classes,
                         comment.char = "")  # speed up things

# Convert dates and times using lubridate
# Select rows corresponding to two days: 2007-02-01 and 2007-02-02
df <- df_complete %>% 
  filter(dmy(Date) >= dmy("01/02/2007"), dmy(Date) <= dmy("02/02/2007")) %>%
  mutate(DateTime = dmy_hms(paste(Date, Time)))  # combine date and time for filtered rows

# Create line plots of all three Sub Metering variables
png(file = "plot3.png", width=480, height=480, units="px")

with(df, {
    plot(x = DateTime,
         y = Sub_metering_1,
         type = "l",
         xlab = "",
         ylab = "Energy sub metering",
         col = "black")
    lines(x = DateTime,
          y = Sub_metering_2, 
          xlab = "",
          ylab = "Energy sub metering",
          col = "red")
    lines(x = DateTime,
          y = Sub_metering_3, 
          xlab = "",
          ylab = "Energy sub metering",
          col = "blue")
    })
     
legend("topright",
       lwd = 1,  # draw thin lines next to legend label
       col = c("black", "red", "blue"),
       legend = names(df)[7:9])

dev.off()