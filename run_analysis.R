# Getting and Cleaning Data Project

# set working directory
wrkdir <- getwd()
wrkdir

# download and unzip the file.
# Note: this program has been tested on Windows platform.  If you use MAC, you may need to modify the code.
# the unzipped files are in fole 'UCI HAR Dataset'

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(wrkdir)) {dir.create(wrkdir)}
download.file(url, file.path(wrkdir, f))
unzip(f)

# set datafile path and list the archive content
data_dir <- file.path(wrkdir, "UCI HAR Dataset")
list.files(data_dir, recursive=TRUE)

# load packages
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# read subject files
subject_train <- read.table(file.path(data_dir, "train", "subject_train.txt"))
subject_test  <- read.table(file.path(data_dir, "test" , "subject_test.txt" ))

# read activity labels
activity_labels <- read.table(file.path(data_dir, "./", "activity_labels.txt"))
head(activity_labels)

# read test and training labels - y files
y_train <- read.table(file.path(data_dir, "train", "y_train.txt"))
y_test  <- read.table(file.path(data_dir, "test" , "y_test.txt" ))

# read activity data - X files
x_train <-read.table(file.path(data_dir,"train", "X_train.txt"))
x_test <- read.table(file.path(data_dir,"test", "X_test.txt"))

# 1.Merges the training and the test sets to create one data set.

# merge Subject data
subject  <- rbind(subject_train, subject_test)
setnames(subject, "V1", "Subject_Id")
head(subject)

# Merge y labels
y <- rbind(y_train, y_test)

# merge y with activity labels
# 3.Uses descriptive activity names to name the activities in the data set)
y_labels <- (merge(y, activity_labels, by="V1"))
setnames(y_labels, "V1", "Activity_Id")
setnames(y_labels, "V2", "Activity")
head(y_labels)

# merge x data
x <- rbind(x_train, x_test)
head(x)

# Merge subject with x and y train/test data
subject_data <- cbind(subject, y_labels, x)
head(subject_data)

#2.Extracts only the measurements on the mean and standard deviation
# for each measurement
# 
# read features.txt which tells which variables are mean/std measurements
features <- read.table(file.path(data_dir, "./", "features.txt"))
setnames(features, names(features), c("Feature_Id", "Feature"))
head(features)

# subset measurements which are means and standard deviations
features_mean_std <- subset(features, grepl("mean\\(\\)|std\\(\\)", features$Feature))
features_mean_std

#4.Appropriately labels the data set with descriptive variable names.
# set column headers
colnames(subject_data) <- c("Subject_Id", "Activity_Id", "Activity", 
                          as.vector(features[,2]))
colnames(subject_data)

# get mean & std columns
mean_std_columns <- c(grep("mean()", colnames(subject_data), fixed=TRUE),
                      grep("std()", colnames(subject_data), fixed=TRUE))
mean_std_columns

# subset data to only include mean & std columns)
subject_mean_std_data <- subject_data[,c(1,2,3,mean_std_columns)]
str(subject_mean_std_data)
# data.frame':  10299 obs. of  69 variables

# 5.Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject
df <- subject_mean_std_data[complete.cases(subject_mean_std_data),]
melt_df <- melt(df, id = c("Subject_Id", "Activity"))
tidy_data <- dcast(melt_df, Subject_Id + Activity ~ variable, mean)
#str(tidy_data)
head(tidy_data)
# save data into a text file
write.table(tidy_data, "tidy_data.txt", sep="\t")
