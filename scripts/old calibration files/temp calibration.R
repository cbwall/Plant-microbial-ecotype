# calibration of hobo data

#clear work space
rm(list=ls())
ls()

main<-setwd(getwd())
setwd("~/Desktop/Research and Teaching/UH MANOA/Research/Isotopes pan KBay/R")


library(reshape2)
library(plyr)
library(lubridate)

# remove all unwanted rows and columns
# split date and time column

# temp1
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp1_Wall_Calib_Nov2016_10487936.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp1_10487936_Cal<-df
#####################

# temp2
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp2_Wall_Calib_Nov2016_10779057.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp2_10779057_Cal<-df
#####################

# temp3
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp3_Wall_Calib_Nov2016_10779058.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp3_10779058_Cal<-df
#####################

# temp4
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp4_Wall_Calib_Nov2016_10779068.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp4_10779068_Cal<-df
#####################

# temp5
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp5_Wall_Calib_Nov2016_10487930.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp5_10487930_Cal<-df
#####################

# temp6
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp6_Wall_Calib_Nov2016_10487935.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp6_10487935_Cal<-df
#####################

# temp7
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp7_Wall_Calib_Nov2016_10779066.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp7_10779066_Cal<-df
#####################

# temp8
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/temp8_Wall_Calib_Nov2016_10635916.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
temp8_10635916_Cal<-df
#####################

# # Rf8_C5
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/Rf8_C5.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
Rf8_C5_Cal<-df
#####################

# # Rf20_C5
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/Rf20_C5.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
Rf20_C5_Cal<-df
#####################

# # Rf42_C5
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/Rf42_C5.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
Rf42_C5_Cal<-df
#####################

# # Rf44_C5
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/Rf44_C5.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
Rf44_C5_Cal<-df
#####################

# # RfBCD_C5
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/RfBCD_C5.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
RfBCD_C5_Cal<-df
#####################

# RfHIMB_C5_shallow
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/RfHIMB_C5_shallow.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
RfHIMB_C5_shallow_Cal<-df
#####################

# RfHIMB_C5
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/RfHIMB_C5.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
RfHIMB_C5_Cal<-df
#####################

# 20161107Calibration1 -- this is primary logger to calibrate off of
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/20161107Calibration1.csv")
df<-data[c(-1:-2), ] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
Cal_templog1<-df
#####################

# 20161107Calibration2 -- this is secondary logger to calibrate off of
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/20161107Calibration2.csv")
df<-data[c(-1:-2), -1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2016-11-03 16:15:00"),] # start at this time
df<-df[c(0:350),]

head(df)
Cal_templog2<-df
#####################

#####################
#####################
## Compile calibration loggers 
Calib.logger.temp.group<-cbind(Cal_templog1, Cal_templog2[,2])
colnames(Calib.logger.temp.group)<- c("timestamp", "Temp.cal.log1", "Temp.cal.log2")

# make logger data as numeric
# have to have the "as.numeric(as.character)..." because can't change factor to numeric without having trouble
Calib.logger.temp.group$Temp.cal.log1<-as.numeric(as.character(Calib.logger.temp.group$Temp.cal.log1))
Calib.logger.temp.group$Temp.cal.log2<-as.numeric(as.character(Calib.logger.temp.group$Temp.cal.log2))

Calib.logger.temp.group

#######################
# make one large dataframe with date, time, and calibration mean for all loggers
ALL.tempcalib<-cbind(Calib.logger.temp.group[, c(1:3)], temp1_10487936_Cal[c(0,2)], temp2_10779057_Cal[c(0,2)], temp3_10779058_Cal[c(0,2)], temp4_10779068_Cal[c(0,2)], temp5_10487930_Cal[c(0,2)], temp6_10487935_Cal[c(0,2)], temp7_10779066_Cal[c(0,2)], temp8_10635916_Cal[c(0,2)], Rf8_C5_Cal[c(0,2)], Rf20_C5_Cal[c(0,2)], Rf42_C5_Cal[c(0,2)], Rf44_C5_Cal[c(0,2)], RfBCD_C5_Cal[c(0,2)], RfHIMB_C5_shallow_Cal[c(0,2)], RfHIMB_C5_Cal[c(0,2)])

head(ALL.tempcalib)
colnames(ALL.tempcalib)
colnames(ALL.tempcalib)<- c("timestamp", "Calib.Temp1", "Calib.Temp2", "temp1_10487936", "temp2_10779057", "temp3_10779058", "temp4_10779068", "temp5_10487930", "temp6_10487935", "temp7_10779066", "temp8_10635916", "Rf8_9768609", "Rf20_9768611", "Rf42_9768617", "Rf44_10209515", "RfBCD_9768597", "RfHIMB_shall_9768608", "RfHIMB_9768614")

# export compiled file
write.csv(ALL.tempcalib, "ALL.tempcalib.Nov2016.csv")

# trim some data that is noisy (low temps at start of dataframe)
head(ALL.tempcalib)
ALL.tempcalib[75, ]  #start of odd cold spike
ALL.tempcalib[100, ] # end of cold spike and warm water equilibrated

ALL.tempcalib<-ALL.tempcalib[c(-1:-10, -75:-100), ]

######################
# specify dataframe and calibration file
df<- ALL.tempcalib  # set dataframe
y<-ALL.tempcalib$Calib.Temp1 # set "y" <<< this is the calibrated value

# if want a single plot, for each iteration, move this line into the loop
#  pdf() and dev.off() outside the loop will generate the cumulative figure
pdf(paste("plot", i,".pdf",sep=""))
par(mfrow=c(2,2))

for (i in 4:18) { # runs through all columns of loggers
  x<-ALL.tempcalib[,i] 
  m <- lm(y~ x, data = df) # run the regression
  plot(y ~ x, ylab="Calibrated Temp C", xlab="Logger Temp C", main=colnames(df)[i])
  abline(m)
  eq <-substitute(italic(y) == a + b~italic(x)*","~~italic(r)^2~"="~r2,
                  list(a = format(coef(m)[1], digits = 4),
                  b = format(coef(m)[2], digits = 4),
                  r2 = format(summary(m)$r.squared, digits = 3)))
  legend("topleft", legend=eq, bty="n")
  }
dev.off()


#############
#############
# Calibrations from 2017, have different dataframe
#############
#############

# temp SN 9768603
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/SN9768603.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2017-01-19 18:00:00"), ] # start at this time
df<-df[!(df$timestamp > "2017-01-20 14:45:00"), ] # end at this time

head(df)
temp_9768603_Cal<-df
#####################

# temp SN 10635918
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/SN10635918.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2017-01-19 18:00:00"), ] # start at this time
df<-df[!(df$timestamp > "2017-01-20 14:45:00"), ] # end at this time

head(df)
temp_10635918_Cal<-df
#####################

# temp SN 9768611
#####################
data<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/SN9768611.csv")
df<-data[c(-1:-2),-1] # removes "trash" rows and columns
df<-df[, c(1:2)] 
colnames(df)<-c("Date.time", "Temp")
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2017-01-19 18:00:00"), ] # start at this time
df<-df[!(df$timestamp > "2017-01-20 14:45:00"), ] # end at this time

head(df)
temp_9768611_Cal<-df

#####################
# temp calibration file  Jan 2017
# something strange here and won't format correctly
# take time column from other df above
#####################
data.calib<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/2017Jan_Calibration1.csv") # calibration file
data.ex<-read.csv("data/Wall Calibration Nov2016/Temp calibrations/SN9768611.csv")
# date column here

Date.time<-data.ex[,2] # date.time
Temp<-data.calib[,3] # temps

df<-data.frame(Date.time, Temp)
colnames(df)<-c("Date.time", "Temp")
df<-df[-1,] # remove header
df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

df<-df[, c(3,2)] # remove old date-time column
df$Temp<-as.numeric(as.character(df$Temp))
df<-df[!(df$timestamp < "2017-01-19 18:00:00"), ] # start at this time
df<-df[!(df$timestamp > "2017-01-20 14:45:00"), ] # end at this time


head(df)
Cal_templog_Jan2017<-df

#####################
#######################
# make one large dataframe with date, time, and calibration mean for all loggers
Jan.temp.calib<-cbind(Cal_templog_Jan2017[, c(1:2)], temp_9768603_Cal[c(0,2)], temp_10635918_Cal[c(0,2)], temp_9768611_Cal[c(0,2)])

head(Jan.temp.calib)
colnames(Jan.temp.calib)<- c("timestamp", "Calib.2017", "temp_9768603_Cal", "temp_10635918_Cal", "temp_9768611_Cal")

write.csv(Jan.temp.calib, "Jan.tempcalib.2017.csv")


# trim some data that is noisy (low temps at start of dataframe)
Jan.temp.calib[68, ]  #start of odd cold spike
Jan.temp.calib[75, ] # end of cold spike and warm water equilibrated

Jan.temp.calib<-Jan.temp.calib[c(-68:-75), ] # with noise removed

######################
# specify dataframe and calibration file
df<- Jan.temp.calib  # set dataframe
y<-Jan.temp.calib$Calib.2017 # set "y" <<< this is the calibrated value

# if want a single plot, for each iteration, move this line into the loop
#  pdf() and dev.off() outside the loop will generate the cumulative figure
pdf(paste("Jan 2017 temp calib.pdf",sep=""))
par(mfrow=c(2,2))

for (i in 3:5) { # runs through all columns of loggers
  x<-Jan.temp.calib[,i] 
  m <- lm(y~ x, data = df) # run the regression
  plot(y ~ x, ylab="Calib 2017 Temp C", xlab="Logger Temp C", main=colnames(df)[i])
  abline(m)
  eq <-substitute(italic(y) == a + b~italic(x)*","~~italic(r)^2~"="~r2,
                  list(a = format(coef(m)[1], digits = 4),
                       b = format(coef(m)[2], digits = 4),
                       r2 = format(summary(m)$r.squared, digits = 3)))
  legend("topleft", legend=eq, bty="n")
}
dev.off()

