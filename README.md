# Getting-and-Cleaning-Data-Course-Project

Course project for the Getting and Cleaning Data Coursera course.

## The data used for the course project

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## Files in this repository

`README.md` is an overview of the dataset and how it was obtained.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` is an R script called  that does the following.

- Step 1. Merges the training and the test sets to create one data set.

- Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

- Step 3. Uses descriptive activity names to name the activities in the data set.

- Step 4. Appropriately labels the data set with descriptive variable names.


`tidy_data.txt`, a second dataset created frome the data set in step 4,  
with the average of each variable for each activity and each subject.
