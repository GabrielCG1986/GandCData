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

Variables:
	1. 'id': This variable identifies the subjects who performed the different activities
	         to collect the data. Since the data was collected from 30 individuals, the id'values
		 are characterized for numbers (from 1 to 30)
	2. 'Activities': This variable contains the different activities performmed by the subjects.
		 This activities were taken from the activity_labels.txt file from the dataset provided.
	3. The following variables were also provided by the feature.txt file in the dataset. The columns were
		selected whether the variable names contained the 'mean' and 'std' words. Note that the raw data
		was filtered and ordered according to the the parameters explained in the file feature.txt:
		1 tBodyAcc-mean()-X
		2 tBodyAcc-mean()-Y
		3 tBodyAcc-mean()-Z
		4 tBodyAcc-std()-X
		5 tBodyAcc-std()-Y
		6 tBodyAcc-std()-Z
		41 tGravityAcc-mean()-X
		42 tGravityAcc-mean()-Y
		43 tGravityAcc-mean()-Z
		44 tGravityAcc-std()-X
		45 tGravityAcc-std()-Y
		46 tGravityAcc-std()-Z
		81 tBodyAccJerk-mean()-X
		82 tBodyAccJerk-mean()-Y
		83 tBodyAccJerk-mean()-Z
		84 tBodyAccJerk-std()-X
		85 tBodyAccJerk-std()-Y
		86 tBodyAccJerk-std()-Z
		121 tBodyGyro-mean()-X
		122 tBodyGyro-mean()-Y
		123 tBodyGyro-mean()-Z
		124 tBodyGyro-std()-X
		125 tBodyGyro-std()-Y
		126 tBodyGyro-std()-Z
		161 tBodyGyroJerk-mean()-X
		162 tBodyGyroJerk-mean()-Y
		163 tBodyGyroJerk-mean()-Z
		164 tBodyGyroJerk-std()-X
		165 tBodyGyroJerk-std()-Y
		166 tBodyGyroJerk-std()-Z
		201 tBodyAccMag-mean()
		202 tBodyAccMag-std()
		214 tGravityAccMag-mean()
		215 tGravityAccMag-std()
		227 tBodyAccJerkMag-mean()
		228 tBodyAccJerkMag-std()
		240 tBodyGyroMag-mean()
		241 tBodyGyroMag-std()
		253 tBodyGyroJerkMag-mean()
		254 tBodyGyroJerkMag-std()
		266 fBodyAcc-mean()-X
		267 fBodyAcc-mean()-Y
		268 fBodyAcc-mean()-Z
		269 fBodyAcc-std()-X
		270 fBodyAcc-std()-Y
		271 fBodyAcc-std()-Z
		345 fBodyAccJerk-mean()-X
		346 fBodyAccJerk-mean()-Y
		347 fBodyAccJerk-mean()-Z
		348 fBodyAccJerk-std()-X
		349 fBodyAccJerk-std()-Y
		350 fBodyAccJerk-std()-Z
		424 fBodyGyro-mean()-X
		425 fBodyGyro-mean()-Y
		426 fBodyGyro-mean()-Z
		427 fBodyGyro-std()-X
		428 fBodyGyro-std()-Y
		429 fBodyGyro-std()-Z
		452 fBodyGyro-meanFreq()-X
		453 fBodyGyro-meanFreq()-Y
		454 fBodyGyro-meanFreq()-Z
		503 fBodyAccMag-mean()
		504 fBodyAccMag-std()
		513 fBodyAccMag-meanFreq()
		516 fBodyBodyAccJerkMag-mean()
		517 fBodyBodyAccJerkMag-std()
		529 fBodyBodyGyroMag-mean()
		530 fBodyBodyGyroMag-std()
		539 fBodyBodyGyroMag-meanFreq()
		542 fBodyBodyGyroJerkMag-mean()
		543 fBodyBodyGyroJerkMag-std()
		556 angle(tBodyAccJerkMean),gravityMean)
		557 angle(tBodyGyroMean,gravityMean)
		558 angle(tBodyGyroJerkMean,gravityMean)
		559 angle(X,gravityMean)
		560 angle(Y,gravityMean)
		561 angle(Z,gravityMean)

