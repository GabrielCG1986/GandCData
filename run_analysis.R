#First we'll load the packages mecessary to manage the code. In this case
#we will use the ply package.

library(plyr)
library(dplyr)

#Let's check if the file is already downloaded and unzipped.

file.Dataset <- "getdata_projectfiles_UCI HAR Dataset.zip"

if (!file.exists(file.Dataset)){
        url_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url = url_file, destfile = "./")
        
}

if (!file.exists("UCI HAR Dataset")) { 
        unzip(file.Dataset) 
}

#Second, let's read the feature file, which contains the names for the columns
#in the dataset we'll merge in the following steps.

features <- read.table("UCI HAR Dataset/features.txt")
features <- as.vector(features$V2)

#The activity_labels file contains the names for each activity. It'll be necessary
#to convert it into a vector.

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels <- as.vector(activity_labels$V2)

#Then, we come to merge the different parts that will create the entire dataset.

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "id")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activities")



subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "id")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activities")

X <- rbind(X_train, X_test) #Revisar esto antes de ejecutar.
y_labels<- rbind(y_train, y_test)

subject_id <- rbind(subject_train, subject_test)

all_data <- cbind(subject_id, y_labels, X)
all_data$Activities <- mapvalues(all_data$Activities, from = c(1:6), to = activity_labels)

mean_v <- grep("*mean*", names(all_data), ignore.case = TRUE)
std_v <- grep("*std*", names(all_data), ignore.case = TRUE)

tidy_data <- all_data[, c( 1, 2, mean_v, std_v)]

names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))

final_data <- tidy_data %>%
        group_by(id, Activities) %>%
        summarise_all(funs(mean, sd))

final_data



