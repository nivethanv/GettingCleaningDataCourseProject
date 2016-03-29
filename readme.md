---
title: "Getting and Cleaning Data Course Project: Readme"
author: "NV"
date: "March 28, 2016"
output: html_document
---
#Summarizing the UCI Human Activity Recognition Data Set

Thanks for taking a look at my work!

This document has been prepared to describe my course project submission for Coursera's "Getting and Cleaning Data." The relevant files include:

* run_analysis.R
* summarized_UCI_HAR.txt
* codebook.md

This assignment was completed using data provided by UCI's Machine Learning Repository. 

* Link to a zip file containing all of the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The site where the data was acquired from, which includes a description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Overview of data
30 volunteers participated in a study in which they carried a waist-mounted smartphone while they conducted their daily activities. The smartphones contained inertial sensors that captured a vast amount of information about the participants' movements. Some of the participants took part in the "training" phase of the study while the remainder took part in the "test" phase.

###Preparation

1. Download the zip file containing the data from the link provided above. You can also click this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to automatically download the data.
2. Extract the contents of the zip file into your preferred working directory. **Make sure all of the files and subfolders are still organized in the main folder labeled** `UCI HAR Dataset`.
3. Set your working directory to `UCI HAR Dataset`
4. Download `run_analysis.R` and place it in the `UCI HAR Dataset` directory
5. Make sure you have the `dplyr` package installed.
6. Run `run_analysis.R`

###Breaking down the code
The `run_analysis.R` script is commented throughout, so if you prefer, you can take a crack at just reading through the code. However, in case some parts of the script are not intuitive, I will describe everything here in detail.

####Loading the data into our workspace
The UCI HAR Dataset archive contains a lot of data organized into many different files across several different folders. In order to summarize the data, we need to load all of the tables into our workspace so we can start parsing them together. The first part of the script does just that:
```
#this script should be executed from the "UCI HAR Dataset" directory.
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
```
As long as the initial working directory is set to the `UCI HAR Dataset` folder, that first part of the code should have seamlessly navigated through all of the subfolders to load all of the tables into our workspace.

####Appending the tables together
All of the training data and test data are organized in different tables, so we need to join these tables together in order to take the first step towards building our full dataset. We use the `rbind()` function to do this:
```
subjectmerge<-rbind(subjecttrain,subjecttest)
xmerge<-rbind(xtrain,xtest)
ymerge<-rbind(ytrain,ytest)
```
Next, we append our subject data and their activity data together using the `cbind()` function.
```
participants<-cbind(subjectmerge,ymerge)
```
We also change the names of those two columns to make things easier for us in the future:
```
colnames(participants)<-c("subject","y")
```
Finally, we append the table with our participant information to the table containing all of the measurement data:
```
fulldata<-cbind(participants,xmerge)
```
####Organizing our data
All of our data is now in one very large table. But not all of the column headings and factors are labeled in a descriptive way. We'd have to reference legends in order to make sense of it all. Why not change that?

The first step is to merge the `activitylabels` table with our `fulldata` so that the activities are listed as verbs instead of as coded numbers from 1-6. It helps to rearrange the columns at this point and make sure our activity column is named appropriately:

```
fulldata<-merge(fulldata,activitylabels,by.x="y",by.y="V1")
fulldata<-fulldata[,c(2,564,3:563)] #rearrange columns, remove old activity id#
colnames(fulldata)[2]<-c("activity")
```

Finally, we need to make sure our 561 measurements are labeled descriptively, instead of as V1-V561. The `features` table contains the necessary information to make that change:
```
colnames(fulldata)[3:563]<-c(as.character(features$V2))
```

**We now have a complete dataset with descriptive labels. Hooray!**

####Filtering and Summarizing our data
For this assignment, we need to report average values for all of the mean measurements and standard deviations. Since the means and stds are all organized in their own columns, and since the columns are now labeled descriptively, all we need to do is filter the column names of our full data set using a little bit of regex:
```
selectdata<-fulldata[,c(1,2,(grep("mean|std",names(fulldata))))]
```
Now that we have *only* the relevant columns in our new table `selectdata`, we can proceed to the summarization step. We do this using some `dplyr` pipeline code (make sure you have the `dplyr` package installed). Notably, we're grouping by `subject` and `activity` so that each subject-activity pair has a unique mean for all of the mean and standard deviation measurements:

```
library(dplyr)
finalsummary<-selectdata %>%
        group_by(subject,activity) %>%
        summarize_each(funs(mean))
```
Finally, we're read to output our summarized data into a tidy data table!:
```
finalsummary<-as.data.frame(finalsummary)
write.table(finalsummary,"summarized_UCI_HAR.txt")
```
The `summarized_UCI_HAR.txt` data table is already included as part of this course project submission. If you want to skip all of the steps we took to generate it, you can download it, place it in your working directory, and load it into your workspace using the following command:
```
summarizedTable<-read.table("summarized_UCI_HAR.txt")
```