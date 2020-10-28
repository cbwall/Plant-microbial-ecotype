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

##### grab files in a list
files <- list.files(path="data/Hobo loggers/acclimation period/Oct26", pattern = "csv$", full.names = T)
files

##### what are the file names, sans extensions
file.names<-file_path_sans_ext(list.files(path="data/Hobo loggers/acclimation period/Oct26", pattern = "csv$", full.names = F))
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
  # write.csv(df.out, file=paste("trim",file.names[i])) # makes .csvs for output
}
# this is the end of the loop

########## see the files you've made, as a list, then grab those that fill your pattern 
ls()
files<-as.data.frame(mget(ls(pattern = "SN.*"))) # with SN as patterns in files from for loops
names(files) # see number of columns, and what these are

data_index<-c(1,(seq(2,12,3)), seq(3,12,3)) # these are the columns we will want: timestamp + raw data **change '18' to number of columns in your dataframe, specifying here to select 'every other column'

data_index<-sort(data_index, decreasing=FALSE) # sort by #

temps<-as.data.frame(c(files[, data_index])) # here is the data we want, now in df alone
colnames(temps)[1]="timestamp" # rename the single column for time
#names(temps) = gsub(pattern = "_.*", replacement = "", x = names(temps)) #strip name to SN only

### apply data callibration to each column
# ex: temp$calib.SN10209515<-(temp$SN10209515 * "value") # Temp logger x: SN x

write.csv(temps, "Oct19.26_temp.light.csv")

#temp data
Temp.data<-temps %>%
  select(timestamp, SN20940480_top1.Raw.Temp, SN20940477_top2.Raw.Temp, SN20940481_top3.Raw.Temp,
                    SN20940479_bot2.Raw.Temp)

colnames(Temp.data)<-c("timestamp", "Temp.top1", "Temp.top2", "Temp.top3", 
                      "Temp.bot2")

# plot it
par(mfrow=c(1,3))

#chamber 1
plot(Temp.data$Temp.top1~Temp.data$timestamp, type="l", ylim=c(15, 25), col ="coral", 
     main="chamber 1", xlab="Date", ylab="Temp")

#chamber 2
plot(Temp.data$Temp.top2~Temp.data$timestamp, type="l", ylim=c(15, 25), col ="coral",
     ylab="", xlab ="")
par(new=T)
plot(Temp.data$Temp.bot2~Temp.data$timestamp, type="l", ylim=c(15, 25), col ="dodgerblue", 
     main="chamber 2", xlab="Date", ylab="Temp")


#chamber 3
plot(Temp.data$Temp.top3~Temp.data$timestamp, type="l", ylim=c(15, 25), col ="coral", 
     main="chamber 3", xlab="Date", ylab="Temp")
legend("topright", legend=c("top", "bottom"),
       col=c("coral", "dodgerblue"), cex=0.6, lty =1, box.lty=0, lwd=2)

dev.copy(pdf, "data/Hobo loggers/acclimation period/Oct26/Temps_10.19_10.26.pdf", height=7, width=8)
dev.off()

##############
# summary of conditions across all columns
# rename Temp.data columns

sum.stats<-Temp.data %>%
  summarise(across(
  .cols = is.numeric, 
  .fns = list(Mean = mean, SD = sd), na.rm = TRUE, 
  .names = "{col}_{fn}"
))
