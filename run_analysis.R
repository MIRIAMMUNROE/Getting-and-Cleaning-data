> library(dplyr)

> library(plyr)
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
> features <- read.table("~/features.txt", quote="\"", comment.char="")
>   View(features)
> activity_labels <- read.table("activity_labels.txt")
> str(activity_labels)
> xset <- rbind(X_train, X_test)
> yset <- rbind(y_train, y_test)
> subjectset <- rbind(subject_train, subject_test)
> names(features) <- c('feature_no', 'feature_names')
> extractm_sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
> xset <- xset[, extractm_sd]
> str(xset)
names(xset) <- gsub("\\(|\\)", "", (features[extractm_sd, 2]))
> activities <- read.table("activity_labels.txt")
> activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
> names(activities) <- c('activity_no', 'activity_descrip')
> yset[,1] = activities[ yset[,1],2]
> View(yset)
> names(yset) <- "activity_descrip"
> names(yset) <- "activity_descrip"
> names(xset)
> names(subjectset) <- "participant"
> threesets <- cbind(subjectset, yset, xset)
> tidy_set <- threesets[, 3:dim(threesets)[2]]
> tidy_AvgSet <- aggregate(tidy_set,list(threesets$participant,threesets$activity_descrip)

> write.table(tidy_AvgSet, file="tidy_data.txt", row.name=FALSE)
