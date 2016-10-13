# Code Book

## ID Fields

* `subject` - The participant ("subject") ID
* `activity` - The label of the activity

## finaldata1 & finaldata2 column names

* `personid` - subject
* `activities` - activity
* `tBodyAcc-mean()-X` 
* `tBodyAcc-mean()-Y` 
* `tBodyAcc-mean()-Z` 
* `tBodyAcc-std()-X` 
* `tBodyAcc-std()-Y` 
* `tBodyAcc-std()-Z` 
* `tGravityAcc-mean()-X` 
* `tGravityAcc-mean()-Y` 
* `tGravityAcc-mean()-Z` 
* `tGravityAcc-std()-X` 
* `tGravityAcc-std()-Y` 
* `tGravityAcc-std()-Z` 
* `tBodyAccJerk-mean()-X` 
* `tBodyAccJerk-mean()-Y` 
* `tBodyAccJerk-mean()-Z` 
* `tBodyAccJerk-std()-X` 
* `tBodyAccJerk-std()-Y` 
* `tBodyAccJerk-std()-Z` 
* `tBodyGyro-mean()-X` 
* `tBodyGyro-mean()-Y` 
* `tBodyGyro-mean()-Z` 
* `tBodyGyro-std()-X` 
* `tBodyGyro-std()-Y` 
* `tBodyGyro-std()-Z` 
* `tBodyGyroJerk-mean()-X` 
* `tBodyGyroJerk-mean()-Y` 
* `tBodyGyroJerk-mean()-Z` 
* `tBodyGyroJerk-std()-X` 
* `tBodyGyroJerk-std()-Y` 
* `tBodyGyroJerk-std()-Z` 
* `tBodyAccMag-mean()`
* `tBodyAccMag-std()` 
* `tGravityAccMag-mean()` 
* `tGravityAccMag-std()` 
* `tBodyAccJerkMag-mean()` 
* `tBodyAccJerkMag-std()` 
* `tBodyGyroMag-mean()` 
* `tBodyGyroMag-std()` 
* `tBodyGyroJerkMag-mean()` 
* `tBodyGyroJerkMag-std()` 
* `fBodyAcc-mean()-X` 
* `fBodyAcc-mean()-Y` 
* `fBodyAcc-mean()-Z` 
* `fBodyAcc-std()-X` 
* `fBodyAcc-std()-Y` 
* `fBodyAcc-std()-Z` 
* `fBodyAccJerk-mean()-X` 
* `fBodyAccJerk-mean()-Y` 
* `fBodyAccJerk-mean()-Z` 
* `fBodyAccJerk-std()-X` 
* `fBodyAccJerk-std()-Y` 
* `fBodyAccJerk-std()-Z` 
* `fBodyGyro-mean()-X`
* `fBodyGyro-mean()-Y` 
* `fBodyGyro-mean()-Z`
* `fBodyGyro-std()-X`
* `fBodyGyro-std()-Y` 
* `fBodyGyro-std()-Z` 
* `fBodyAccMag-mean()` 
* `fBodyAccMag-std()` 
* `fBodyBodyAccJerkMag-mean()`
* `fBodyBodyAccJerkMag-std()` 
* `fBodyBodyGyroMag-mean()` 
* `fBodyBodyGyroMag-std()` 
* `fBodyBodyGyroJerkMag-mean()` 
* `fBodyBodyGyroJerkMag-std()`


## Activities Vector

- 1, 2, 3, 4, 5, 6

## Activity Names Vector


- WALKING ....(corresponds to 1 )
- WALKING_UPSTAIRS ....(corresponds to 2 )
- WALKING_DOWNSTAIRS ...(corresponds to 3 )
- SITTING ...(corresponds to 4)
- STANDING ...(corresponds to 5 )
- LAYING ...(corresponds to 6)

## Describing Program Flow:
- load library plyr

- download zip file and store it

- get the column names for x from features file (each element corresponds to a table name)

- getting the activities names (level and labels) from the activity_labels text file

- get the subject id from subject_test text file and subject_train file. 

- for test data:
       1. create table out of x_test.txt
       2. create table out of y_test.txt
       3. create table out of subject_test.txt
       * column bind the above three tables to get "test data"
       
- for train data:
       1. create table out of x_train.txt
       2. create table out of y_train.txt
       3. create table out of subject_train.txt
       * column bind the above three tables to get "train data"
       
- Join the "test data" and "train data": "train data" stacked on "test data" to get final data

- resort the final data by the subject id

- redescribe the activities name nicely - converting levels - 1,2,3,4,5,6- to the corresponding labels
- filter out the mean and standard deviation columns only and store the data in finaldata1.csv
- create a folder called "result" to store data file
- write first data, finaldata1.csv into the folder "result"
- create a new dataset where the mean is conditional on first 2 column- personid and activities and store the data in finaldata2.csv
- write second data, finaldata2.csv into the folder
## -END-
