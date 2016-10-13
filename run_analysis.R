setwd("DataScienceStudy")
dir.create("Getting-and-Cleaning-Data")
setwd("get_tidy_data")
## load library plyr
library(plyr)

##storing link into a character
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## load zip data into filetemp using the link
download.file(fileurl, "filetemp.zip") 


## create a function that create table from the file under the file path
createtable<- function(filename, columns = NULL){
       ## paste("....) is the file path
       unzfile <- unz("filetemp.zip", paste("UCI HAR Dataset",filename,sep="/"))
       ## we should be able to know which file should not have cols
       ## if no column -> it is features file
       if(is.null(columns)){
              ## readtable, seperated by space, dont convert to Factors (easier to read data)
              ## this is either subject or feature file
              tempdata<- read.table(unzfile, sep ="")
       }
       else {
              ## else-> either file is test or train ->  column names is from the features file
              tempdata<- read.table(unzfile, sep = "", col.names = columns)
       }
       
}
## getting the column names for x
features<-createtable("features.txt")   
##getting the activities names (level and labels)
activities<-createtable("activity_labels.txt")

##reading subject_test.txt. This is subject under test --> lable is kind of id
subjecttest<- createtable(paste("test","/","subject_test.txt", sep = ""), "personid")
##reading x_test.txt, labels from features
xtest <- createtable(paste("test","/","X_test.txt",sep = ""), features$V2 )
##reading y_test.txt, this is activities but not yet described nicely
ytest <- createtable(paste("test","/", "y_test.txt", sep = ""), "activities")
##joining the two together
testdata<- cbind(subjecttest,ytest,xtest)

##reading subject_train.txt. This is subject under train --> lable is kind of id     
subject<- createtable(paste("train","/","subject_train.txt", sep = ""),"personid")
##reading x_train.txt, labels from feature
xdata <- createtable(paste("train","/","X_train.txt",sep = ""), features$V2 )
##reading y_train.txt, this is activities but not yet described nicely
ydata <- createtable(paste("train","/","y_train.txt", sep = ""), "activities")
##joining the two together
traindata<- cbind(subject,ydata,xdata)

       
## adjoining two datasets-  test and train
joindata<- rbind(testdata, traindata)

##personid is mixed up--> reorder id
finaldata<- arrange(joindata, personid)

## describing the activities name nicely
finaldata$activities<- factor(finaldata$activities, levels = activities$V1, labels=activities$V2)

## filtering out the mean and standard deviation columns only
finaldata<-finaldata[,c(1,2, grep("std", colnames(finaldata)), grep("mean", colnames(finaldata)))]

##create a folder called "result" to store data file
dir.create("result")
setwd("result")
## writing first data into the folder
write.csv(finaldata, "finaldata1.csv")
setwd("..")

##creating a new dataset where the mean is conditional on first 2 column- personid and activities
finaldata2 <- ddply(finaldata, .(personid, activities), .fun=function(x){ colMeans(x[,-c(1:2)]) })
setwd("result")
## writing second data into the folder
write.csv(finaldata2, "finaldata2.csv")
setwd("..")
## final
