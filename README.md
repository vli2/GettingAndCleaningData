# Getting and Cleaning Data Project
coursera Data Science track

## This repo is for Getting and Cleaning Data project.  

It contains the following files:

* README.md - you're reading it now.
* CodeBook.md - describes the variables, the data, and transformations used to clean up the data 
* run_analysis.R - the R program which does actual data cleaning and data transformation work.
* tidy_data.txt - the new data set produced by running run_analysis.R and contains the average of each variable
  for each activity and each subject.

## How to Run the script
Note: this script is running and tested on a Windows 8 platform.  If you're using MAC, you may need to modify
the code accordingly or manaully download and unzip the file and run the rest of R commands.

To run run_analysis.R, save the script into your local drive in a separate folder.

The script will perform the following tasks (not necessarily in the exact same order - see CodeBook.md for details)

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

