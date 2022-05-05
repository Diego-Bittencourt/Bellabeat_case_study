library(tidyverse)
library(janitor)
library(chron)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(reshape2)
library(RColorBrewer)

daily_activity <- read_csv("../dailyActivity_merged.csv")
daily_sleep <- read_csv("../sleepDay_merged.csv")
hour_calories <- read_csv("../hourlyCalories_merged.csv")
hour_intensities <- read_csv("../hourlyIntensities_merged.csv")
hour_steps <- read_csv("../hourlySteps_merged.csv")
weight <- read_csv("../weightLogInfo_merged.csv")

glimpse(daily_activity)
glimpse(daily_sleep)
glimpse(hour_intensities)
glimpse(hour_steps)
glimpse(weight)

hour_steps$time <- chron(times=format(strptime(str_sub(hour_steps$ActivityHour, -11), "%I:%M:%S %p"), "%H:%M:%S"))  # converting to time format.
hour_intensities$time <- chron(times=format(strptime(str_sub(hour_intensities$ActivityHour, -11), "%I:%M:%S %p"), "%H:%M:%S")) #converting to time format.


daily_activity$ActivityDate <- as.Date(daily_activity$ActivityDate, format="%m/%d/%Y") # converting to date format.
daily_sleep$SleepDay <- as.Date(daily_sleep$SleepDay, format="%m/%d/%Y") # converting to date format.
weight$Date <- as.Date(weight$Date, format = "%m/%d/%Y") #converting to date format.

daily_activity$Id <- as.character(daily_activity$Id) # converting Id's to string format.
daily_sleep$Id <- as.character(daily_sleep$Id) # converting Id's to string format.
hour_intensities$Id <- as.character(hour_intensities$Id) # converting Id's to string format.
hour_steps$Id <- as.character(hour_steps$Id) # converting Id's to string format.
weight$Id <- as.character(weight$Id) # converting Id's to string format.