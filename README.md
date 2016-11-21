## Human Activity Recognition Using Smartphones Dataset (Mean and Standard Deviation ONLY)
(This repository is solely for the Peer-graded Assignment: Getting and Cleaning Data Course Project on Coursera.)

The overall goal of this assignment was to generate a tidy dataset with the average of each variable for each activity and subject from the measurements generated from a wearable computing device.  The measurements were generated from a group of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist. The embedded accelerometer and gyroscope captured 3-axial linear acceleration and angular velocity. The R script, ‘run_analysis.R’ will perform the following steps using the original dataset:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

See codebook for an explanation of variables in my tidy dataset. 

The full description of the ORIGINAL dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Below is the original dataset where my tidy dataset was derived from for the purpose of the assignment:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
