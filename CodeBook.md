# Run Analysis Codebook
This is the codebook for the `run_analysis.txt` tidy dataset, produced from the corresponding `run_analysis.R` script. The script works on the UCI's [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), found at the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original UCI Smartphones Data Set files are used during this analysis:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Purpose
The goal of the `run_analysis.R` script is to "tidy" the data so users can possibly extract the following from the Smartphones data set:

- data set consisting of measurements on the mean and standard deviation for each measurement
- data set consisting of the average of each variable for each activity and subject 

## Data Transformations
The following steps were taken in the `run_analysis.R` script to transform the original Smartphones data set to a tidy data set for our needs.

1. read in all of the `test` and `training` data files
1. read in the `features` and `activities` labels
1. add feature names to our test and training sets
1. extract only measurements on the mean and std, for example:
   ``` r
   means <- grep("-mean\\(\\)", feature_names, value=TRUE)
   stds <- grep("-std\\(\\)", feature_names, value=TRUE)
   x_train <- x_train[, c(means, stds)]
   x_test <- x_test[, c(means, stds)]
   ```
1. merge all `test` and `training` data set
1. finally merge all `X`, `y`, and `subject` data
1. add additional columns to support "Subject" and Activity"
1. use descriptive labels 
1. produce tidy data set for measurements on the mean and standard deviation for each measurement
1. calculate the mean by `subject` and `activity` 
1. finally output the data set as `run_analysis.txt` tidy data

## Output Variables
The resulting tidy data set consists of the following variables:

#### Added during our data transformations:
column   | description
---------|------------------------------
Subject  | test subject id
Activity | descriptive name of activity

#### From original Smartphones data set
column                       | description
-----------------------------|------------------------------
tBodyAcc-mean()-X            | see features_info.txt from Smartphones data set
tBodyAcc-mean()-Y            |
tBodyAcc-mean()-Z            |
tGravityAcc-mean()-X         |
tGravityAcc-mean()-Y         |
tGravityAcc-mean()-Z         |
tBodyAccJerk-mean()-X        |
tBodyAccJerk-mean()-Y        |
tBodyAccJerk-mean()-Z        |
tBodyGyro-mean()-X           |
tBodyGyro-mean()-Y           |
tBodyGyro-mean()-Z           |
tBodyGyroJerk-mean()-X       |
tBodyGyroJerk-mean()-Y       |
tBodyGyroJerk-mean()-Z       |
tBodyAccMag-mean()           |
tGravityAccMag-mean()        |
tBodyAccJerkMag-mean()       |
tBodyGyroMag-mean()          |
tBodyGyroJerkMag-mean()      |
fBodyAcc-mean()-X            |
fBodyAcc-mean()-Y            |
fBodyAcc-mean()-Z            |
fBodyAccJerk-mean()-X        |
fBodyAccJerk-mean()-Y        |
fBodyAccJerk-mean()-Z        |
fBodyGyro-mean()-X           |
fBodyGyro-mean()-Y           |
fBodyGyro-mean()-Z           |
fBodyAccMag-mean()           |
fBodyBodyAccJerkMag-mean()   | 
fBodyBodyGyroMag-mean()      |
fBodyBodyGyroJerkMag-mean()  |
tBodyAcc-std()-X             | 
tBodyAcc-std()-Y             |
tBodyAcc-std()-Z             |
tGravityAcc-std()-X          |
tGravityAcc-std()-Y          |
tGravityAcc-std()-Z          |
tBodyAccJerk-std()-X         |
tBodyAccJerk-std()-Y         |
tBodyAccJerk-std()-Z         |
tBodyGyro-std()-X            |
tBodyGyro-std()-Y            |
tBodyGyro-std()-Z            |
tBodyGyroJerk-std()-X        |       
tBodyGyroJerk-std()-Y        |
tBodyGyroJerk-std()-Z        |
tBodyAccMag-std()            |
tGravityAccMag-std()         |
tBodyAccJerkMag-std()        |
tBodyGyroMag-std()           |
tBodyGyroJerkMag-std()       |
fBodyAcc-std()-X             |
fBodyAcc-std()-Y             |
fBodyAcc-std()-Z             |
fBodyAccJerk-std()-X         | 
fBodyAccJerk-std()-Y         |      
fBodyAccJerk-std()-Z         |       
fBodyGyro-std()-X            |          
fBodyGyro-std()-Y            |
fBodyGyro-std()-Z            |
fBodyAccMag-std()            |     
fBodyBodyAccJerkMag-std()    |  
fBodyBodyGyroMag-std()       |    
fBodyBodyGyroJerkMag-std()   | 

## Output
`run_analysis.R` will produce a `run_analysis.txt` tidy data set.
 