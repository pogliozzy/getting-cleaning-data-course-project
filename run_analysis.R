#######################################################################################    
#
#   This script run_analysis.R does the following: 
#
#   1- Merges the training and the test sets to create one data set.
#   2- Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3- Uses descriptive activity names to name the activities in the data set
#   4- Appropriately labels the data set with descriptive variable names. 
#   5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#
#   Data has been downloaded from this URL:     
#
#    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
#
#######################################################################################


#   Please note that all paths are intended for use on Windows systems
# 
#   You have to chage the following line to match the path to your data folder

setwd("E:\\Users\\Andrea\\Downloads\\Data\\Getting and Cleaning Data\\course_project\\dataset")

#loading lybrary "plyr"

library(plyr)




# 1) Merge the training and test sets to create one data set

x_train <- read.table("train\\X_train.txt")
y_train <- read.table("train\\y_train.txt")
subject_train <- read.table("train\\subject_train.txt")
x_test <- read.table("test\\X_test.txt")
y_test <- read.table("test\\y_test.txt")
subject_test <- read.table("test\\subject_test.txt")

# create data sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

subject_data <- rbind(subject_train, subject_test)
features <- read.table("features.txt")




# 2) Extracts only the measurements on the mean and standard deviation for each measurement
# get mean() or std() columns
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset Mean and Standar deviation from x_data
x_data <- x_data[, mean_and_std_features]

# change x_data colums names
names(x_data) <- features[mean_and_std_features, 2]





# 3) Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with the right activity names (standing, walking etc)
y_data[, 1] <- activities[y_data[, 1], 2]

# change column name to "activity"
names(y_data) <- "activity"




# 4) Appropriately label the data set with descriptive variable names


# change column name to "subject"
names(subject_data) <- "subject"
# merge all the data in a single data set
merged_data <- cbind(x_data, y_data, subject_data)


# 5) Create a second, independent tidy data set with the average of each variable for each activity and each subject

# gettin all colomns except "activity" and "subject"
averages_data <- ddply(merged_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)