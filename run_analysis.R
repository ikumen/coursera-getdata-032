# You should create one R script called run_analysis.R that does the following. 
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

#
# Note: it's assumed this script will be in the same directory
# as the "UCI HAR Dataset" directory.
#

# Read in test set data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Read in training set data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read in the feature names 
features <- read.table("UCI HAR Dataset/features.txt")
feature_names <- features$V2

# Read in the list of activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Add feature names to our test and training sets
names(x_train) <- feature_names
names(x_test) <- feature_names

# Lets extract only measurements on the mean and std
means <- grep("-mean\\(\\)", feature_names, value=TRUE)
stds <- grep("-std\\(\\)", feature_names, value=TRUE)
x_train <- x_train[, c(means, stds)]
x_test <- x_test[, c(means, stds)]

# Merge all our data sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Finally combine everything into giant dataframe
dataset <- cbind(subject, y, x)

# Add additional columns to our dataframe for activity and subjects
names(dataset)[1] <- "Subject"
names(dataset)[2] <- "Activity"

# Using descriptive labels for our activities
dataset$Activity <- factor(dataset$Activity, labels=activities[,2])

# Tidy data set for measurements on the mean and standard deviation for each measurement
measurements_on_mean_and_std_tidy <- dataset


# Aggregate our data by subject and activity with averages
avg_of_each_variable_tidy <- aggregate(. ~ Subject + Activity, data=dataset, FUN=mean)

# Finally write out our tidy data set
write.table(avg_of_each_variable_tidy, file="run_analysis.txt", sep="\t", row.names=FALSE)
