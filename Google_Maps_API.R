# set working directory
#setwd("working Directory")

# Read the file
taxi <- read.csv("file name",header=TRUE)

# Convert latitude and logitude to address using Google Map API
library(evaluate)
install.packages("ggmap")
install.packages("RJSONIO")
library(RJSONIO)
library(ggmap)

# Create the Column that stores Pickup address
taxi$Pickup_Address <- mapply(FUN=function(lon,lat)
								revgeocode(c(lon,lat)),
									taxi$Pickup_longitude,taxi$Pickup_latitude)

taxi$Dropoff_Address <- mapply(FUN=function(lon,lat)
								revgeocode(c(lon,lat)),
									taxi$Dropoff_longitude,taxi$Dropoff_latitude)
									
									
# Write the ouput in excel file
library(xlsx)
write.xlsx(taxi,file="taxi1.xlsx",sheetName="sheet1",row.names=FALSE)

