## ------------------------------------------------------------------------
#install.packages("devtools")
#devtools::install_github("beanumber/nyctaxi")

## ---- warning=FALSE, message=FALSE---------------------------------------
library(nyctaxi)
data(green_2016_01_sample)
head(green_2016_01_sample)

## ---- warning=FALSE, message=FALSE---------------------------------------
help("etl_extract.etl_nyctaxi")

## ---- eval=FALSE, warning=FALSE, message=FALSE---------------------------
#  taxi <- etl("nyctaxi", dir = "~/Desktop/nyctaxi/")
#  
#  taxi %>%
#    etl_extract(years = 2016, months = 1, types = c("green")) %>%
#    etl_transform(years = 2016, months = 1, types = c("green")) %>%
#    etl_load(years = 2016, months = 1, types = "green")}

## ---- warning=FALSE, message=FALSE---------------------------------------
library(dplyr)
library(leaflet)
library(lubridate)

## ---- warning=FALSE, message=FALSE---------------------------------------
my_trips <- green_2016_01_sample

#clean_up data according to date and time of pickup
one_cab <- my_trips %>% 
  filter(Pickup_longitude != 0)

leaflet(data = one_cab) %>% 
  addTiles() %>% 
  addCircles(lng = ~Pickup_longitude, lat = ~Pickup_latitude) %>% 
  addCircles(lng = ~Dropoff_longitude, lat = ~Dropoff_latitude, color = "green")

## ---- warning=FALSE, message=FALSE---------------------------------------

clean_datetime <- my_trips %>% 
  mutate(lpep_pickup_datetime = ymd_hms(lpep_pickup_datetime)) %>%
  mutate(Lpep_dropoff_datetime = ymd_hms(Lpep_dropoff_datetime)) %>% 
  mutate(weekday_pickup = weekdays(lpep_pickup_datetime)) %>%
  mutate(weekday_dropoff= weekdays(Lpep_dropoff_datetime))

## ---- warning=FALSE, message=FALSE---------------------------------------
clean_datetime %>% 
  group_by(weekday_pickup) %>%
  summarize(N = n(), avg_dist = mean(Trip_distance), 
            avg_passengers = mean(Passenger_count), 
            avg_price = mean(Total_amount))

