Getting and Cleaning Data project'Codebook.


The run_analysis.R script performs the data preparation and then followed by 
the 5 steps described in the project's definition.

Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

file.Dataset <- "getdata_projectfiles_UCI HAR Dataset.zip"

Second, we've read the feature file and converted it into a vector, which contains the names for the columns
in the dataset we'll merge in the following steps.
The 'activity_labels' file contains the names for each activity. It'll be necessary
to convert it into a vector.

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

We've come to merge the different parts that will create the entire dataset.

As X_train and X_test datasets contains the total data of our project, we've merged them
into a single dataset called X.

The same we've done with y_test and y_train. Both contains the labels for a better categorizing 
the activities. We've called this 1 dimensional vector 'y_labels'.

Subject_id is a vector containing the id for every subject who perfomormed the different activities.
		subject_id <- rbind(subject_train, subject_test)

'all_data' contains all the dataframes and vectors created previously described

all_data$Activities <- mapvalues(all_data$Activities, from = c(1:6), to = activity_labels)

mean_v <- grep("*mean*", names(all_data), ignore.case = TRUE)
std_v <- grep("*std*", names(all_data), ignore.case = TRUE)

tidy_data <- all_data[, c(mean_v, std_v)]


