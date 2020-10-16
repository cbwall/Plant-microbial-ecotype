# temp loggers script

#clear work space
rm(list=ls())
ls()

main<-setwd(getwd())
setwd("~/Desktop/Research and Teaching/UH MANOA/Research/Isotopes pan KBay/R")

library(reshape2)
library(plyr)
library(lubridate)
library(tools)

# remove all unwanted rows and columns
# split date and time column

##### grab files in a list
files <- list.files(path="data/environmental/temp and light/cross depth PAR temp/Nov 2016/temp/", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="data/environmental/temp and light/cross depth PAR temp/Nov 2016/temp", pattern = "csv$", full.names = F))
file.names


############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:2)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(3,2)] # remove old date-time column
  df<-df[!(df$timestamp < "2016-11-08 14:00:00"),] # start at this time
  df<-df[!(df$timestamp > "2016-12-09 09:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  # write.csv(df.out, file=paste("trim",file.names[i])) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,12,2))) # these are the columns we will want: timestamp + raw data **change '12' to number of columns in your dataframe, specifying here to select 'every other column'

temps<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only
colnames(temps)[1]="timestamp" # rename the single column for time

### apply data callibration to each column
# ex: temp$calib.SN10209515<-(temp$SN10209515 * "value") # Temp logger x: SN x

write.csv(temp, "xxx.csv")