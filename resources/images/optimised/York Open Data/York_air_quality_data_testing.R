library(openair)
library(dplyr)
library(tidyverse)

AURNlist<- importMeta(source = "aurn", all = TRUE)
York_list<-AURNlist %>% filter(grepl("york", site, ignore.case = TRUE))
?grepl


AQElist<- importMeta(source = "aqe", all = TRUE)
AQE_York<-AQElist %>% filter(grepl("york", site, ignore.case = TRUE))

##########AQE

#York Fulford Road
#YK16

#York Gillygate
#YK7

#York Heworth Green
#YK13

#York Holgate
#YK8

#York Lawrence Street
#YK9

#York Nunnery Lane
#YK15

#York Plantation Drive
#YK018

#York St - Jarrow (sensor)
#STS003

Lawrence_raw <- importAQE(site="YK9", year = 2025, pollutant = "no2")
library(lubridate)


Lawrence_raw$date <- as.POSIXct(Lawrence_raw$date, format = "%Y-%m-%d %H:%M:%S")

Law <- Lawrence_raw %>% filter(date > "2025-06-30 23:00:00", date< "2025-06-30 01:00:00"))
library(ggplot2)
ggplot(Lawrence_raw, mapping = aes( x= date, y = no2 )) +geom_point() 


Law <- Lawrence_raw %>% filter(date >= as.POSIXct("2025-05-30 00:00:00") & date < as.POSIXct("2025-06-01 00:00:00"))


Law <- Lawrence_raw %>% 
  filter(date >= as.POSIXct("2025-06-30 00:00:00") & 
           date < as.POSIXct("2025-07-01 00:00:00"))


ggplot(Law, mapping = aes( x= date, y = no2 )) +geom_point() + theme_classic()

         