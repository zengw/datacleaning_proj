rm(list=ls())

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd ("C:/Users/wei/Desktop/R/")
setwd("./Course cleaning data")

if (!file.exists("data")){
  dir.create("data")
}
download.file(url=fileUrl, destfile="./data/getdata-projectfiles-UCI HAR Dataset.zip") 
unzip("./data/getdata-projectfiles-UCI HAR Dataset.zip")

setwd("./UCI HAR Dataset")

#Step1: 
#read in train and test datasets
train<-read.table("./train/X_train.txt",header=FALSE)
test<-read.table("./test/X_test.txt",header=FALSE)
train$train=1
test$train=0
#put two datasets together
all<-rbind(train,test)

#add labels to the variables 
features<-read.table("./features.txt",header=FALSE)
names(all)<-features[,2]

#Step2: Keep required variables
myvar <- names(all) %like% "mean" | names(all) %like% "std" | names(all) %in% ("train")
all2<-all[ , myvar]
myvar2<-names(all2) %like% "meanFreq()"
all3<-all2[ ,!myvar2]

#step3: Uses descriptive activity names to name the activities in the data set
subject1<-read.csv("./train/subject_train.txt",header=FALSE)
subject2<-read.csv("./test/subject_test.txt",header=FALSE)
subject<-rbind(subject1,subject2)
names(subject)="Subject"

act1<-read.csv("./train/y_train.txt",header=FALSE)
act2<-read.csv("./test/y_test.txt",header=FALSE)
act<-rbind(act1,act2)
names(act)="V1"

all4<-cbind(subject,act,all3)


actlabel<-read.table("./activity_labels.txt",header=FALSE)
names(actlabel)=c("V1","Activity")
all5<-merge(all4,actlabel, by="V1")[,-1]
names(all5)

#step5: Appropriately labels the data set with descriptive variable names. 
library(data.table)
colstoavg <- names(all5[,3:67])
newdata<-aggregate(all5[,3:67], by=list(all5$Subject,all5$Activity), 
                   FUN=mean, na.rm=TRUE)
names(newdata)[1:2]=c("Subject","Activity")
head(newdata)

write.table(newdata,"./cleanedfile.txt",row.name=FALSE )


