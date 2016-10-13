## The repo includes the following files:
=========================================

- 'README.md'

- run_analysis.R

- "result" - A folder storing two data sets that the homework requires:

 1. finaldata1.csv  - 10299 obs of 81 variables
 2. finaldata2.csv  - 180 obs of 81 variables

- 'Codebook.md' - a code book that describes the variables, the data, and any transformations or work to clean up the dat.
## What is going on:
R script called run_analysis.R that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

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