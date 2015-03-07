# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Here are the data for the project: 

# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1.Merges the training and the test sets to create one data set.

x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
dim(x_train)
dim(x_test)

y_train <- read.table("train/Y_train.txt")
y_test <- read.table("test/Y_test.txt")
dim(y_train)
dim(y_test)

s_train <- read.table("train/subject_train.txt")
s_test <- read.table("test/subject_test.txt")
dim(s_train)
dim(s_test)

x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
s <- rbind(s_train,s_test)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
f <- read.table("features.txt")
mean.sd <- grep("-mean\\(\\)|-std\\(\\)", f[, 2])
x.mean.sd <- x[,mean.sd]
names(x.mean.sd) <- gsub("\\(|\\)","",tolower(names(x.mean.sd)))

# 3. Uses descriptive activity names to name the activities in the data set
a <- read.table("activity_labels.txt")
a[,2] <- gsub("_","",tolower(as.character(a[,2])))
y[,1] <- a[y[,1],2]
names(y) <- "Activities"

# 4. Appropriately labels the data set with descriptive variable names. 
names(s) <- "Subjects"

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
md <- cbind(s,y,x.mean.sd) #"md" for "merged data"
write.table(md, "merged_data.txt", row.name=FALSE)

amd <- aggregate(x=md, by=list(Act=md$Activities, Sub=md$Subjects), FUN=mean) #"amd" for "Average Merged Data"
write.table(amd, "data_with_means", row.name=FALSE)
