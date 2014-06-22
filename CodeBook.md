## Getting and Cleaning Data Project CodeBook.md

This file describes proeject assignment instruction; data files used; variables used; and data transformation.

## Assignment Instruction:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4) You should also include a README.md in the repo with your scripts. 

One of the most exciting areas in all of data science right now is wearable computing - see for example  
this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms 
to attract new users. 
The data linked to from the course website represent data collected from the accelerometers 
from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

------------------------------------------------------------------
##The data files which are the data sources for this project:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/subject_train.txt': train data: each row identifies the subject who performed the activity 
   for each window sample. Its range is from 1 to 30.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/subject_test.txt': test data: each row identifies the subject who performed the activity 
   for each window sample. Its range is from 1 to 30.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

----------------------------------------------------------------------
## Variables used
- subject_train: data frame which contains subject training data set.
- subject_testL: data frame which contains subject test data set
- activity_labels: data frame which contains activity labels.
- y_train - data frame which contains training data labels.
- y_test - data frame which contains test data labels.
- x_train - data frame which contains training data set.
- x_test - data frame which contains test data set.
- subject - data frame which contains merged subject test set and training set.
- y - data frame which contains merged training labels and test labels. 
y_labels - data frame which contains merged activity labels
- x - data frame which contains merged training and test data sets.
subject_data - data frame which contains merged subject, labels, and data sets.
features - data frame which contains measurement information.
features_mean_std - data frame which is a subset of features and 
                    tells which variables are means and standard deviations.
mean_std_columns - vector which contains the column names of mean and standard deviation variables.
subject_mean_std_data - data frame which is a subset of subject_data and only contains mean and 
                        standard deviation features related data.
df - data frame which excludes 'NA' values from subject_mean_std_data.
melt_df - data frame which contains melted data set.
tidy_data - data frame which contains cleaned data with the average of each variable 
		   for each actvity and each subject
		   
------------------------------------------------------------------------
## Steps to clean and transform data
1. set working directory
2. Download dataset from web and unzip the file.
3. Read files into R (see a list of files above)
4. Merge subject training set with test set data
5. Merge training labels with test labels.
6. Merge labels with Activity data to produce descriptive activity names.
7. Merge training data with test data.
8. Merge subject, labels, and training/test data together to get a comprehensive data set.
9. Label columns with descriptive variable names.
10. Subset the data set to only include data related to means and standard deviations.
11. Exclude 'NA' values from the data set.
12. Export data set to a flat text file - tidy_data.txt
