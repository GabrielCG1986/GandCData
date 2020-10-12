Getting and Cleaning Data Course Project
It has the instructions on how to run analysis on Human Activity recognition dataset using the embedded devices 
provided by a smartphone.

Dataset
The 'UCI HAR Dataset' directory contains the data separated into different files which provides features names,
the data obtained and filtered with different devices and methods.

Files
The CodeBook.md describes the variables used, data, and any transformations or work that I performed 
to clean up the data

run_analysis.R script performs the data manipulation steps required and described in the review criteria
of the assignment.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
each variable for each activity and each subject.