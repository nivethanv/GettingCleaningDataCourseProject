---
title: 'Getting and Cleaning Data Course Project: Codebook'
author: "NV"
date: "March 28, 2016"
output: html_document
---

## Description
This codebook describes the variables in the `summarized_UCI_HAR.txt` data table.

##Study design and data collection
The data was acquired from UCI's Machine Learning Repository at the following site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

30 volunteers participated in a study in which they carried a waist-mounted smartphone while they conducted their daily activities. The smartphones contained inertial sensors that captured a vast amount of information about the participants' movements.

##Creating the data table from raw data
1. Download the raw data from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the archive's contents into your working directory
3. Read `readme.md` and use `run_analysis.R` to summarize the data

##How the data was summarized

1. All of the training data and test data were merged together
2. We filtered for the measurements that contained mean and standard deviation values
3. The data was grouped by subject and activity. Mean values for each measurement selected in step 2 were calculated for each subject-activity pair 

## Variables in `summarized_UCI_HAR.txt`

* Dimensions: 180 observations x 81 variables

[[1]]
"subject"

* `integer` variable with values ranging from 1 to 30 to denote the subject's id number

[[2]]
"activity"

* `factor` variable with the following six levels to denote the activity that the participant was taking part in when the measurement was recorded:
    + LAYING
    + SITTING
    + STANDING
    + WALKING
    + WALKING_DOWNSTAIRS
    + WALKING_UPSTAIRS
        
###The remaining variables from 3 -- 81 are of the type `numeric`. Each variable describes a different measurement acquired by the inertial sensors used in the study.

[[3]]
"tBodyAcc-mean()-X"

[[4]]
"tBodyAcc-mean()-Y"

[[5]]
"tBodyAcc-mean()-Z"

[[6]]
"tBodyAcc-std()-X"

[[7]]
"tBodyAcc-std()-Y"

[[8]]
"tBodyAcc-std()-Z"

[[9]]
"tGravityAcc-mean()-X"

[[10]]
"tGravityAcc-mean()-Y"

[[11]]
"tGravityAcc-mean()-Z"

[[12]]
"tGravityAcc-std()-X"

[[13]]
"tGravityAcc-std()-Y"

[[14]]
"tGravityAcc-std()-Z"

[[15]]
"tBodyAccJerk-mean()-X"

[[16]]
"tBodyAccJerk-mean()-Y"

[[17]]
"tBodyAccJerk-mean()-Z"

[[18]]
"tBodyAccJerk-std()-X"

[[19]]
"tBodyAccJerk-std()-Y"

[[20]]
"tBodyAccJerk-std()-Z"

[[21]]
"tBodyGyro-mean()-X"

[[22]]
"tBodyGyro-mean()-Y"

[[23]]
"tBodyGyro-mean()-Z"

[[24]]
"tBodyGyro-std()-X"

[[25]]
"tBodyGyro-std()-Y"

[[26]]
"tBodyGyro-std()-Z"

[[27]]
"tBodyGyroJerk-mean()-X"

[[28]]
"tBodyGyroJerk-mean()-Y"

[[29]]
"tBodyGyroJerk-mean()-Z"

[[30]]
"tBodyGyroJerk-std()-X"

[[31]]
"tBodyGyroJerk-std()-Y"

[[32]]
"tBodyGyroJerk-std()-Z"

[[33]]
"tBodyAccMag-mean()"

[[34]]
"tBodyAccMag-std()"

[[35]]
"tGravityAccMag-mean()"

[[36]]
"tGravityAccMag-std()"

[[37]]
"tBodyAccJerkMag-mean()"

[[38]]
"tBodyAccJerkMag-std()"

[[39]]
"tBodyGyroMag-mean()"

[[40]]
"tBodyGyroMag-std()"

[[41]]
"tBodyGyroJerkMag-mean()"

[[42]]
"tBodyGyroJerkMag-std()"

[[43]]
"fBodyAcc-mean()-X"

[[44]]
"fBodyAcc-mean()-Y"

[[45]]
"fBodyAcc-mean()-Z"

[[46]]
"fBodyAcc-std()-X"

[[47]]
"fBodyAcc-std()-Y"

[[48]]
"fBodyAcc-std()-Z"

[[49]]
"fBodyAcc-meanFreq()-X"

[[50]]
"fBodyAcc-meanFreq()-Y"

[[51]]
"fBodyAcc-meanFreq()-Z"

[[52]]
"fBodyAccJerk-mean()-X"

[[53]]
"fBodyAccJerk-mean()-Y"

[[54]]
"fBodyAccJerk-mean()-Z"

[[55]]
"fBodyAccJerk-std()-X"

[[56]]
"fBodyAccJerk-std()-Y"

[[57]]
"fBodyAccJerk-std()-Z"

[[58]]
"fBodyAccJerk-meanFreq()-X"

[[59]]
"fBodyAccJerk-meanFreq()-Y"

[[60]]
"fBodyAccJerk-meanFreq()-Z"

[[61]]
"fBodyGyro-mean()-X"

[[62]]
"fBodyGyro-mean()-Y"

[[63]]
"fBodyGyro-mean()-Z"

[[64]]
"fBodyGyro-std()-X"

[[65]]
"fBodyGyro-std()-Y"

[[66]]
"fBodyGyro-std()-Z"

[[67]]
"fBodyGyro-meanFreq()-X"

[[68]]
"fBodyGyro-meanFreq()-Y"

[[69]]
"fBodyGyro-meanFreq()-Z"

[[70]]
"fBodyAccMag-mean()"

[[71]]
"fBodyAccMag-std()"

[[72]]
"fBodyAccMag-meanFreq()"

[[73]]
"fBodyBodyAccJerkMag-mean()"

[[74]]
"fBodyBodyAccJerkMag-std()"

[[75]]
"fBodyBodyAccJerkMag-meanFreq()"

[[76]]
"fBodyBodyGyroMag-mean()"

[[77]]
"fBodyBodyGyroMag-std()"

[[78]]
"fBodyBodyGyroMag-meanFreq()"

[[79]]
"fBodyBodyGyroJerkMag-mean()"

[[80]]
"fBodyBodyGyroJerkMag-std()"

[[81]]
"fBodyBodyGyroJerkMag-meanFreq()"


