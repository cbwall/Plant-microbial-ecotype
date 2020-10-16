# calibration of odyssey data

#clear work space
rm(list=ls())
ls()

library(reshape2)
library(plyr)
library(ggplot2)
library(lubridate)
library(zoo)
library(plotrix)
library(devtools)
library(tools)

main<-setwd(getwd())


##### grab files in a list
calibration.files <- list.files(path="data", pattern = "CSV$", full.names = T)
calibration.files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="data", pattern = "CSV$", full.names = F))

############ formatting all data in for loop
  for(i in 1:length(calibration.files))
    {
  data<-read.csv(calibration.files[i], sep=",", skip=8)
  df<-data[, c(-1,-5)] # removes "trash" columns
  colnames(df)<-c("Date", "Time", "Raw.value")
  df$Date<-parse_date_time(df$Date, "dmy") # corrects date format
  df$timestamp<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
  df<-df[!(df$timestamp < "2017-11-20 10:30:00"),] # start at this time
  df<-df[!(df$timestamp > "2017-11-21 12:00:00"),] # end at this time
  df<-df[ , c(4,3)] # timestamp and Raw value only
  #df$logger<-file.names[i] #if wanting to make a column of data with logger name
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  # write.csv(df.out, file=paste("trim",file.names[i])) # makes .csvs for output
  }
########## this is the end of the loop


########## see the files you've made, as a list, then grab those that fil your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,2))) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

all.data.PAR<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
names(all.data.PAR) # don't worry about renaming quite yet....

# name with logger SNs
colnames(all.data.PAR)<-c("timestamp", "SN2484", "SN4802", "SN4804", "SN6375", "SN6376", "SN6381", "SN6382", "SN6383", "SN7273")

# ****** note above still need PAR from LiCor ######


######### alternatives to above ###########
# make df of all trimmed files, with timestamp in one column and PAR in separate columns

# all.data<-cbind(SN2484_cal2017_Tank3[c(1:2)], SN4802_cal2017_Tank4[c(0,2)], 
              #  SN4804_cal2017_Tank1[c(0,2)], SN6378_cal2017[c(0,2)], 
              #  SN6381_cal2017_Tank2[c(0,2)], SN7272_cal2017[c(0,2)], 
              #  SN7274_cal2017[c(0,2)], SN7276_cal2017[c(0,2)], 
              #  SN7277_cal2017[c(0,2)], SN7278_cal2017[c(0,2)],
              #  SN7279_cal2017[c(0,2)], SN7280_cal2017[c(0,2)])   
# colnames(all.data)<-c("timestamp", paste(file.names)) # name with file names



####
# add Licor file to the total logger dataframe 'all.data.PAR'
data<-read.csv("data/Licor_calibr_2017Nov.csv", skip=15) # where skip is the rows you don't want
df<-data[, c(2:3)] # remove trash columns
colnames(df)<-c("timestamp", "Licor.RAW")
df$timestamp<-mdy_hm(as.character(df$timestamp)) #  timestamp as character to POSIXct date
df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")

#remove all periods where loggers were not logging with the LiCor
df<-df[!(df$timestamp < "2017-11-20 10:30:00"),] # start at this time
df<-df[!(df$timestamp > "2017-11-21 12:00:00"),]

df$Licor.RAW<-as.numeric(as.character(df$Licor.RAW)) # make PAR data numeric, must change to character first, then numeric, since class is currently "factor"

str(df)

Licor.data<-df # cleaned Licor data with night removed (night is not present due to logging program)
####

# revist the compiled data 
all.data.PAR
names(all.data.PAR)

# trim to remove non-logged, dark periods according to Li-Cor
all.data.PAR.sansnight<-all.data.PAR[!c(all.data.PAR$timestamp > "2017-11-20 18:00:00" & all.data.PAR$timestamp < "2017-11-21 07:15:00"), ]

Licor.data[2] # this is raw data column of Li-Cor data you want, make sure timestamps match your data!

# integrate raw values over time internal (15min * 60 sec) and calibrate to LiCor
# converts mol photons/internval(ie 15 min) to umol/photons/s
Licor.data$Licor.calibrated<-(Licor.data$Licor.RAW*(10^6)/(15*60))


############### Final dataframe with Licor and Odyssey data
Ody.Licor.PAR<-as.data.frame(c(all.data.PAR.sansnight, Licor.data[3]))
###############


#########
#generate figures
# using "Ody.Licor.PAR" file
# y = "Licor.calibrated" and x = "raw logger values"
# after a regression is made, the coefficent and intercept can be use to calibrate field data

######################
# specify dataframe and calibration file
df<- Ody.Licor.PAR  # set dataframe
y<-Ody.Licor.PAR$Licor.calibrated # set "y" <<< this is the calibrated value

# if want a single plot, for each iteration, move this line into the loop
#  pdf() and dev.off() outside the loop will generate the cumulative figure
pdf(paste("plot", i,".pdf",sep=""))
par(mfrow=c(2,2))

for (i in 2:9) { # runs through all columns of loggers
  x<-Ody.Licor.PAR[,i] 
  m <- lm(y ~ x + 0, data = df) # run the regression, force intercept through zero here
  plot(y ~ x, ylab="Cal. LiCor umol photons m-2 s-1", xlab="Odyssey reading", main=colnames(df)[i])
  abline(m)
  eq <-substitute(italic(y) == a + b~italic(x)*","~~italic(r)^2~"="~r2,
                  list(a = format(coef(m)[2], digits = 4),
                       b = format(coef(m)[1], digits = 4),
                       r2 = format(summary(m)$r.squared, digits = 3)))
  legend("topleft", legend=eq, bty="n")
}
dev.off()


