The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. Read X_train.txt and X_test into R and form a new 10299*561 data.frame named x, which stores general data;
2. Read Y_train.txt and Y_test into R and form a new 10299*1 data.frame named y, which stores different kinds of activities;
3. Read subject_train.txt and subject_test into R and form a new 10299*1 data.frame named s, which documents subjects related info;

4. Read features.txt into R named f, and extract the measurements on the mean and standard deviation; which result a 66 indices list, named x.mean.sd. Then clean the subset data and pass features names to x.mean.sd.
5. Read activity_labels.txt file into R and assign it to a new data frame act. After cleaning data in act, we pass its names to data frame y, and rename it to "Activities".
6. Rename data frame s to "Subjects".

7. Merge data frame x, y, s into md, "md" for "merged data"; and amd, for "Average Merged Data"
