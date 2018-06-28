# Course Project Code Book

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This code book explains the steps that were used to finally arrive at a dataset tidy_data.txt. 

The variables maintained at the end of the analysis were 68 variables that measure mean and standard deviations of the data set. 

The joined test and train data sets were from combining the following to create 3 initial data sets:

xset was a combination of X_train and0 X_test sets.
yset was a combination of y_train and y_test sets.
subjectset was a combination of subject_train and subject_test.

The variables that had mean and standard deviations measures were then identified and extracted.

The variables were named appropriately in all the sets. 
The activities id's and descriptions were also input in the existing data. 

The sets were then colunm binded into one set known as threesets. 

The average of the 30 participants carrying out the 6 activities was aggregated to create the final "tidy_data" set.



