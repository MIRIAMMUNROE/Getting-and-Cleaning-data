# Getting-and-Cleaning-data
## peer reviewed assignment

### Load dplyr and plyr packages 
> library(dplyr)

> library(plyr)

### open the text files from the zipped folder UCI HAR

> y_train <- read.table("~/y_train.txt", quote="\"", comment.char="")
>   View(y_train)
> X_test <- read.table("~/X_test.txt", quote="\"", comment.char="")
>   View(X_test)
> y_test <- read.table("~/y_test.txt", quote="\"", comment.char="")
>   View(y_test)
> X_train <- read.table("~/X_train.txt", quote="\"", comment.char="")
>   View(X_train)
> subject_test <- read.table("~/subject_test.txt", quote="\"", comment.char="")
>   View(subject_test)
> subject_train <- read.table("~/subject_train.txt", quote="\"", comment.char="")
>   View(subject_train)
> features <- read.table("features.txt")
> str(features)
'data.frame':	561 obs. of  2 variables:
 $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
 $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...

> features <- read.table("~/features.txt", quote="\"", comment.char="")
>   View(features)



> activity_labels <- read.table("activity_labels.txt")
> str(activity_labels)
'data.frame':	6 obs. of  2 variables:
 $ V1: int  1 2 3 4 5 6
 $ V2: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1
> head(activity_labels)
  V1                 V2
1  1            WALKING
2  2   WALKING_UPSTAIRS
3  3 WALKING_DOWNSTAIRS
4  4            SITTING
5  5           STANDING
6  6             LAYING

### The above are the dataframe activity_labels

## 1. Merges the training and the test sets to create one data set.

### which of the test train sets should be merged? Chose to merge (X_train, X_test), (y_train, y_test), (subject_train, subject_test)

### Combined data sets by rows:


> xset <- rbind(X_train, X_test)
> yset <- rbind(y_train, y_test)
> subjectset <- rbind(subject_train, subject_test)


### Checked characteristics with all variables.

> str(xset)
'data.frame':	10299 obs. of  561 variables:
> str(yset)
'data.frame':	10299 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
> str(subjectset)
'data.frame':	10299 obs. of  1 variable:
 $ V1: int  1 1 1 1 1 1 1 1 1 1 ...


> features <- read.table("~/features.txt", quote="\"", comment.char="")
>   View(features)
> str(features)
'data.frame':	561 obs. of  2 variables:
 $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
 $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ..

### Named the 2 variables in the ‘features’ data set

> names(features) <- c('feature_no', 'feature_names')

## 2. Identify only the measurements on the mean and standard deviation for each measurement

> extractm_sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

### Extracted the above from the xset dataset.

> xset <- xset[, extractm_sd]
> str(xset)
'data.frame':	10299 obs. of  66 variables:

## Named the identified measurements of mean and sd on the variable name row

names(xset) <- gsub("\\(|\\)", "", (features[extractm_sd, 2]))

## 3.  Uses descriptive activity names to name the activities in the data set

> activities <- read.table("activity_labels.txt")
> activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
> names(activities) <- c('activity_no', 'activity_descrip')

### yset dataset has values 1-6, replace with activity names with consideration it has 6 rows while data has 10299 variables. Name column after.

> yset[,1] = activities[ yset[,1],2]
> View(yset)
> names(yset) <- "activity_descrip"


## 4. Appropriately labels the data set with descriptive variable names.
> names(yset) <- "activity_descrip"
> names(xset)
 [1] "tBodyAcc-mean-X"           "tBodyAcc-mean-Y"           "tBodyAcc-mean-Z"          
 [4] "tBodyAcc-std-X"            "tBodyAcc-std-Y"            "tBodyAcc-std-Z"           
 [7] "tGravityAcc-mean-X"        "tGravityAcc-mean-Y"        "tGravityAcc-mean-Z"       
[10] "tGravityAcc-std-X"         "tGravityAcc-std-Y"         "tGravityAcc-std-Z"        
[13] "tBodyAccJerk-mean-X"       "tBodyAccJerk-mean-Y"       "tBodyAccJerk-mean-Z"      
[16] "tBodyAccJerk-std-X"        "tBodyAccJerk-std-Y"        "tBodyAccJerk-std-Z"       
[19] "tBodyGyro-mean-X"          "tBodyGyro-mean-Y"          "tBodyGyro-mean-Z"         
[22] "tBodyGyro-std-X"           "tBodyGyro-std-Y"           "tBodyGyro-std-Z"          
[25] "tBodyGyroJerk-mean-X"      "tBodyGyroJerk-mean-Y"      "tBodyGyroJerk-mean-Z"     
[28] "tBodyGyroJerk-std-X"       "tBodyGyroJerk-std-Y"       "tBodyGyroJerk-std-Z"      
[31] "tBodyAccMag-mean"          "tBodyAccMag-std"           "tGravityAccMag-mean"      
[34] "tGravityAccMag-std"        "tBodyAccJerkMag-mean"      "tBodyAccJerkMag-std"      
[37] "tBodyGyroMag-mean"         "tBodyGyroMag-std"          "tBodyGyroJerkMag-mean"    
[40] "tBodyGyroJerkMag-std"      "fBodyAcc-mean-X"           "fBodyAcc-mean-Y"          
[43] "fBodyAcc-mean-Z"           "fBodyAcc-std-X"            "fBodyAcc-std-Y"           
[46] "fBodyAcc-std-Z"            "fBodyAccJerk-mean-X"       "fBodyAccJerk-mean-Y"      
[49] "fBodyAccJerk-mean-Z"       "fBodyAccJerk-std-X"        "fBodyAccJerk-std-Y"       
[52] "fBodyAccJerk-std-Z"        "fBodyGyro-mean-X"          "fBodyGyro-mean-Y"         
[55] "fBodyGyro-mean-Z"          "fBodyGyro-std-X"           "fBodyGyro-std-Y"          
[58] "fBodyGyro-std-Z"           "fBodyAccMag-mean"          "fBodyAccMag-std"          
[61] "fBodyBodyAccJerkMag-mean"  "fBodyBodyAccJerkMag-std"   "fBodyBodyGyroMag-mean"    
[64] "fBodyBodyGyroMag-std"      "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-std" 

> names(subjectset) <- "participant"

### combine the 3 sets.

> threesets <- cbind(subjectset, yset, xset)

> str(threesets)
'data.frame':	10299 obs. of  68 variables:


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
### 30 participants each carrying out 6 activities, aggregate to find average. Assign to new set. Write new set. 

> tidy_set <- threesets[, 3:dim(threesets)[2]]
> tidy_AvgSet <- aggregate(tidy_set,list(threesets$participant,threesets$activity_descrip)

> write.table(tidy_AvgSet, file="tidy_data.txt", row.name=FALSE)
















