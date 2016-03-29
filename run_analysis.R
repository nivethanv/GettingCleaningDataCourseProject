#assign all relevant datasets as objects in our workspace
#this file needs to be executed from the "UCI HAR Dataset directory"
        activitylabels<-read.table("activity_labels.txt")
        features<-read.table("features.txt")
setwd('./train')
        subjecttrain<-read.table("subject_train.txt")
        xtrain<-read.table("X_train.txt")
        ytrain<-read.table("y_train.txt")
setwd('..')
setwd('./test')
        subjecttest<-read.table("subject_test.txt")
        xtest<-read.table("X_test.txt")
        ytest<-read.table("y_test.txt")
setwd('..')

#merging training and test data together
subjectmerge<-rbind(subjecttrain,subjecttest)
xmerge<-rbind(xtrain,xtest)
ymerge<-rbind(ytrain,ytest)
participants<-cbind(subjectmerge,ymerge)
colnames(participants)<-c("subject","y")
fulldata<-cbind(participants,xmerge)

#converting numeric activity ID to full activity label
fulldata<-merge(fulldata,activitylabels,by.x="y",by.y="V1")
fulldata<-fulldata[,c(2,564,3:563)] #rearrange columns, remove old activity id#
colnames(fulldata)[2]<-c("activity")

#label the measurements and filter only measurements with mean|std values
colnames(fulldata)[3:563]<-c(as.character(features$V2))
selectdata<-fulldata[,c(1,2,(grep("mean|std",names(fulldata))))]

#use dplyr to group by subject-activity and provide mean measures for each
library(dplyr)
finalsummary<-selectdata %>%
        group_by(subject,activity) %>%
        summarize_each(funs(mean))
finalsummary<-as.data.frame(finalsummary)

#create file with summarized data
write.table(finalsummary,"summarized_UCI_HAR.txt", row.name=FALSE)