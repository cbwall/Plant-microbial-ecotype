# temp loggers script

#clear work space
rm(list=ls())
ls()

library(reshape2)
library(plyr)
library(lubridate)
library(tools)
library(dplyr)

# remove all unwanted rows and columns
# split date and time column


######### 
######### # October 19

##### grab files in a list
files <- list.files(path="hobo loggers/Oct19", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Oct19", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-10-05 15:00:00"),] # start at this time
  df<-df[!(df$timestamp > "2020-10-19 13:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,3)), seq(3,18,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T1_temp.light.csv")


######### # ######### # ######### # ######### # ######### # 
######### # October 26
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Oct26", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Oct26", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-10-19 15:00:00"),] # start at this time
  df<-df[!(df$timestamp > "2020-10-26 12:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,12,3)), seq(3,12,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T2_temp.light.csv")


######### # ######### # ######### # ######### # ######### # ######### # 
######### # November 12
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Nov12", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Nov12", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-10-26 13:30:00"),] # start at this time
  df<-df[!(df$timestamp > "2020-11-12 14:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,3)), seq(3,18,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T3_temp.light.csv")




######### # ######### # ######### # ######### # ######### # ######### # 
######### # Decemebr 7
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Dec07", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Dec07", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-11-12 15:30:00"),] # start at this time
  df<-df[!(df$timestamp > "2020-12-07 12:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,3)), seq(3,18,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T4_temp.light.csv")



######### # ######### # ######### # ######### # ######### # ######### # 
######### # Decemebr 7
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Dec07", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Dec07", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-11-12 15:30:00"),] # start at this time
  df<-df[!(df$timestamp > "2020-12-07 12:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,3)), seq(3,18,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T4_temp.light.csv")




######### # ######### # ######### # ######### # ######### # ######### # 
######### # December 10
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Dec10", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Dec10", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-12-07 14:00:00"),] # start at this time
  df<-df[!(df$timestamp > "2020-12-10 11:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,3)), seq(3,18,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T5_temp.light.csv")



######### # ######### # ######### # ######### # ######### # ######### # 
######### # Decemebr 28
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Dec28", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Dec28", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-12-10 12:00:00"),] # start at this time
  df<-df[!(df$timestamp > "2020-12-28 11:30:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,3)), seq(3,18,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T6_temp.light.csv")




######### # ######### # ######### # ######### # ######### # ######### # 
######### # January 04
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Jan04.1", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Jan04.1", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2020-12-28 13:00:00"),] # start at this time
  df<-df[!(df$timestamp > "2021-01-01 06:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,16,3)), seq(3,16,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T7.1_temp.light.csv")




######### # January 04-redo for logger fail
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Jan04.2", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Jan04.2", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2021-01-01 06:15:00"),] # start at this time
  df<-df[!(df$timestamp > "2021-01-04 11:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,12,3)), seq(3,12,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T7.2_temp.light.csv")




######### # January 14
#clear work space
rm(list=ls())
ls()

##### grab files in a list
files <- list.files(path="hobo loggers/Jan14", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="hobo loggers/Jan14", pattern = "csv$", full.names = F))
file.names

############ formatting all data in for loop
for(i in 1:length(files))
{
  data<-read.csv(files[i], header=F, stringsAsFactors=FALSE, sep=",")
  df<-data[c(-1:-2),-1] # removes "trash" columns
  df<-df[, c(1:3)] # reorganize
  colnames(df)<-c("Date.time", "Raw.Temp", "Light.Lumen")
  df$Raw.Temp<-as.numeric(as.character(df$Raw.Temp))
  df$timestamp<-mdy_hms(as.character(df$Date.time)) # corrects date format
  df$timestamp<-strptime(df$timestamp, format="%Y-%m-%d %H:%M:%S")
  df<-df[, c(4,2,3)] # remove old date-time column
  df<-na.omit(df)
  df<-df[!(df$timestamp < "2021-01-04 12:00:00"),] # start at this time
  df<-df[!(df$timestamp > "2021-01-14 11:00:00"),] # end at this time
  make.names(assign(paste("SN",file.names[i], sep=""), df)) # put pattern at front of names
  # makes each df[i] as dataframe with specific file-name
  #write.csv(df, file=paste("trim_", file.names[i], ".csv", sep="")) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,18,3)), seq(3,18,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temp.light<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temp.light)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

# make all data numeric
data.reformat<-temp.light[-1]
data.reformat<-data.reformat %>% mutate_if(is.factor,as.character)
data.reformat<-data.reformat %>% mutate_if(is.character,as.numeric)
temps.light.data<-cbind(temp.light[1], data.reformat)

write.csv(temps.light.data, "hobo loggers/output/T8_temp.light.csv")




###################
###################
# merge outputs
rm(list=ls())
ls()

T1<-read.csv("hobo loggers/output/T1_temp.light.csv")
T2<-read.csv("hobo loggers/output/T2_temp.light.csv")
T3<-read.csv("hobo loggers/output/T3_temp.light.csv")
T4<-read.csv("hobo loggers/output/T4_temp.light.csv")
T5<-read.csv("hobo loggers/output/T5_temp.light.csv")
T6<-read.csv("hobo loggers/output/T6_temp.light.csv")
T7.1<-read.csv("hobo loggers/output/T7.1_temp.light.csv")
T7.2<-read.csv("hobo loggers/output/T7.2_temp.light.csv")
T8<-read.csv("hobo loggers/output/T8_temp.light.csv")

T_bind<-bind_rows(T1, T2, T3, T4, T5, T6, T7.1, T7.2, T8)
write.csv(T_bind, "hobo loggers/output/data_all.summary.csv")

T_bind<-T_bind %>% select(-X) # remove column
T_bind<- T_bind %>% 
  rename(bot1.Temp = SN20940476_bot1.Raw.Temp,
         bot1.Light = SN20940476_bot1.Light.Lumen,
         top2.Temp = SN20940477_top2.Raw.Temp,
         top2.Light = SN20940477_top2.Light.Lumen,
         bot3.Temp = SN20940478_bot3.Raw.Temp,
         bot3.Light = SN20940478_bot3.Light.Lumen,
         bot2.Temp = SN20940479_bot2.Raw.Temp,
         bot2.Light = SN20940479_bot2.Light.Lumen,
         top1.Temp = SN20940480_top1.Raw.Temp,
         top1.Light = SN20940480_top1.Light.Lumen,
         top3.Temp = SN20940481_top3.Raw.Temp,
         top3.Light = SN20940481_top3.Light.Lumen)

T_bind$Date<-as.Date(T_bind$timestamp)

Temp.data<-T_bind %>% select (Date, timestamp, top1.Temp, bot1.Temp, top2.Temp, bot2.Temp, top3.Temp, bot3.Temp)

# plot it
par(mfrow=c(1,3))

####chamber 1
plot(top1.Temp~ Date, Temp.data, type="n", ylab="Temperature (°C)", ylim=c(15, 35), yaxt="n", xaxt="n", 
     xlab="Date", cex.lab=0.7, cex.axis=0.7, main="chamber 1")
#top-chamber1
lines(Temp.data$top1.Temp~Temp.data$Date, lwd=.6, lty=1, col="dodgerblue")
#bot-Temp.data
lines(Temp.data$bot1.Temp~Temp.data$Date, lwd=.6, lty=1, col="mediumseagreen")
axis(side=2, at=c(0, 10, 20, 30), cex.lab=0.7, cex.axis=0.7)
legend("topright", legend=c("top", "bottom"),
       col=c("dodgerblue", "mediumseagreen"), cex=0.6, lty =1, box.lty=0, lwd=2)
axis.Date(1, at=seq(min(Temp.data$Date), max(Temp.data$Date), by="2 month"), format="%b '%y", cex.lab=0.7, cex.axis=0.7)

####chamber 2
plot(top2.Temp~ Date, Temp.data, type="n", ylab="", ylim=c(15, 35), yaxt="n", xaxt="n", 
     xlab="Date", cex.lab=0.7, cex.axis=0.7, main="chamber 2")
#top-chamber2
lines(Temp.data$top2.Temp~Temp.data$Date, lwd=.6, lty=1, col="dodgerblue")
#bot-chamber2
lines(Temp.data$bot2.Temp~Temp.data$Date, lwd=.6, lty=1, col="mediumseagreen")
axis(side=2, at=c(0, 10, 20, 30), cex.lab=0.7, cex.axis=0.7)
axis.Date(1, at=seq(min(Temp.data$Date), max(Temp.data$Date), by="2 month"), format="%b '%y", cex.lab=0.7, cex.axis=0.7)

####chamber 3
plot(top3.Temp~ Date, Temp.data, type="n", ylab="", ylim=c(15, 35), yaxt="n", xaxt="n", 
     xlab="Date", cex.lab=0.7, cex.axis=0.7, main="chamber 3")
#top-chamber3
lines(Temp.data$top3.Temp~Temp.data$Date, lwd=.6, lty=1, col="dodgerblue")
#bot-chamber3
lines(Temp.data$bot3.Temp~Temp.data$Date, lwd=.6, lty=1, col="mediumseagreen")
axis(side=2, at=c(0, 10, 20, 30), cex.lab=0.7, cex.axis=0.7)
axis.Date(1, at=seq(min(Temp.data$Date), max(Temp.data$Date), by="2 month"), format="%b '%y", cex.lab=0.7, cex.axis=0.7)

dev.copy(pdf, "hobo loggers/output/tempoutput.pdf", height=4, width=8)
dev.off()
