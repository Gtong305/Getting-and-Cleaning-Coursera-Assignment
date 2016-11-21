library(tidyr)
library(dplyr)

# get datasets
test_x <- read.table('./test/X_test.txt') # 561-feature vector with time and frequency domain variables
train_x <- read.table('./train/X_train.txt') # 561-feature vector with time and frequency domain variables

# get activity label
test_y <- read.table('./test/y_test.txt')
train_y <- read.table('./train/y_train.txt')

# get subject
test_subject <- read.table('./test/subject_test.txt')
train_subject <- read.table('./train/subject_train.txt')

# merge to one dataset
dataTest <- cbind(test_x, test_subject, test_y)
dataTrain <- cbind(train_x, train_subject, train_y)
mergedData <- rbind(dataTest, dataTrain)

# label variables
features <- read.table('./features.txt')
names(mergedData) = features[[2]]
names(mergedData)[length(mergedData)] = 'activity_description' # label last column
names(mergedData)[length(mergedData) - 1] = 'subject_id' # label second to last column

# grep columns indices where mean() and std() are measured, and also include activity label and subject ID
subset <- union(
  grep("mean\\()", names(mergedData)), 
  grep("std\\()", names(mergedData)))

subset <- union(subset, grep("activity_description", names(mergedData)))
subset <- sort(union(subset, grep("subject_id", names(mergedData))))

# subset the dataset
datasetMeanSD <- mergedData[subset]

# descriptive labels for activities
activityData <- read.table("./activity_labels.txt")

for (x in 1:6) {
  datasetMeanSD$activity_description <- gsub(x, activityData[x, 2], datasetMeanSD$activity_description)
}

# create independent tidy data set with the average of each variable for each activity and each subject
meanData <- 
 datasetMeanSD %>%
 group_by(activity_description, subject_id) %>%
 summarize_each(funs(mean))

write.table(meanData, "meanTidyDataset.txt", row.name=FALSE)
