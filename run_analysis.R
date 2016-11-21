library(tidyr)
library(dplyr)

setwd("C:/Users/gtong/Gary/Coursera/R/Getting and Cleaning Data/data/UCI HAR Dataset/")
test_x <- read.table('./test/X_test.txt') # 561-feature vector with time and frequency domain variables
train_x <- read.table('./train/X_train.txt') # 561-feature vector with time and frequency domain variables
test_y <- read.table('./test/y_test.txt') # activity label
train_y <- read.table('./train/y_train.txt') # activity label

dataTest <- cbind(test_x, test_y)
dataTrain <- cbind(train_x, train_y)
mergedData <- rbind(dataTest, dataTrain)

features <- read.table('./features.txt')
names(mergedData) = features[[2]]
names(mergedData)[length(mergedData)] = 'activity_description' # label last column

# grep columns indices where mean() and std() are measured
subset <- union(
  grep("mean\\()", names(mergedData)), 
  grep("std\\()", names(mergedData)))

subset <- sort(union(subset, grep("activity_description", names(mergedData)))) # include activity label in subset

datasetMeanSD <- mergedData[subset]

# descriptive labels for activities
activityData <- read.table("./activity_labels.txt")

for (x in 1:6) {
  datasetMeanSD$activity_description <- gsub(x, activityData[x, 2], datasetMeanSD$activity_description)
}

# create independent tidy data set with the average of each variable for each activity and each subject
meanData <- 
 datasetMeanSD %>%
 group_by(activity_description) %>%
 summarize_each(funs(mean))
