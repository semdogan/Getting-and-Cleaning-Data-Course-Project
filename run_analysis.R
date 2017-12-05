#Getting and Cleaning Data Course Project
#download files and put in data folder
if(!file.exists(".data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/data_course_project.zip",method="curl")
#unzip files
unzip(zipfile="./data/data_course_project.zip",exdir="./data")

#files are in UCI HAR Dataset
cheminFichier <- file.path("./data" , "UCI HAR Dataset")
fichiers <- list.files(cheminFichier, recursive=TRUE)
fichiers

#read data
x_train <- read.table(file.path(cheminFichier, "train/X_train.txt"))
y_train <- read.table(file.path(cheminFichier, "train/y_train.txt"))
subject_train <- read.table(file.path(cheminFichier, "train/subject_train.txt"))

x_test <- read.table(file.path(cheminFichier, "test/X_test.txt"))
y_test <- read.table(file.path(cheminFichier, "test/y_test.txt"))
subject_test <- read.table(file.path(cheminFichier, "test/subject_test.txt"))

#STEP 1
#merge training and test sets
features <- rbind(x_train, x_test)
activity <- rbind(y_train, y_test)
names(activity) <- c("activity")
subject <- rbind(subject_train, subject_test)
names(subject) <- c("subject")
featuresNames <- read.table(file.path(cheminFichier, "features.txt"))
names(features) <- featuresNames$V2

data1 <- cbind(subject, activity)
data <- cbind(data1, features)

#STEP 2
#extracts only the measurements on the mean and standard deviation for each measurement

a <- grep(".*mean.*|.*std.*", featuresNames$V2)
b <- grep("-(mean|std)\\(\\)", featuresNames$V2)
featuresWanted <- b + 2
subData <- data[,c(1,2,featuresWanted)]

#STEP 3
#Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(cheminFichier, "activity_labels.txt"))
subData$activity <- factor(subData$activity, levels = activityLabels[,1], labels = activityLabels[,2])

#STEP 4
#Appropriately labels the data set with descriptive variable names
names(subData)<-gsub("^t", "time", names(subData))
names(subData)<-gsub("^f", "frequency", names(subData))
names(subData)<-gsub("Acc", "Accelerometer", names(subData))
names(subData)<-gsub("Gyro", "Gyroscope", names(subData))
names(subData)<-gsub("Mag", "Magnitude", names(subData))
names(subData)<-gsub("BodyBody", "Body", names(subData))

#STEP 5
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(plyr)
data2<-aggregate(. ~subject + activity, subData, mean)
data2<-data2[order(data2$subject,data2$activity),]
write.table(data2, "tidydata.txt",row.name=FALSE)

