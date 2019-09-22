# Getting-and-Cleaning-Data

## Peer-graded Assignment: Getting and Cleaning Data Course Project
This repository is a course project for the Getting and Cleaning Data Course. It contains the instructions on how to run analysis on Human Activity recognition dataset.

## R Version
"R version 3.5.1 (2018-07-02)"

## Dataset
Human Activity Recognition Using Smartphones

## Files
### 1.  CodeBook.md 
It describes the variables, the data, and any transformations or work performed to clean up the data.

### 2.  run_analysis.R 
This R script downloads the data followed by the 5 steps stated in the course project’s instructions:
1) Downloads and reads the data set.
- The dataset is downloaded and extracted as folder named UCI HAR Dataset.  The files contained in the dataset are assigned the following names:
-- 'features' <- "features.txt"
- 'activities' <- "activity_labels.txt"
- 'subject_test' <- "subject_test.txt"
- 'x_test' <- "X_test.txt"
- 'y_test' <- "y_test.txt"
- 'subject_train' <- "subject_train.txt"
- 'x_train' <- "X_train.txt"
- 'y_train' <- "y_train.txt"

2) Merges the training and the test sets to create one data set.
- The following dataframes were created using rbind() function
- 'subject' is created by merging 'subject_train' and 'subject_test' 
- 'x' is created by merging 'x_train' and x_test' 
- 'y' is created by merging 'y_train' and 'y_test' 
- Using cbind() function, 'subject', 'y' and 'x' were merged creating 'merged_data'.

3) Extracts only the measurements on the mean and standard deviation for each measurement.
- Using select() function, the following columns were extracted from 'merged_data: 'subject', 'code' and the 'columns' containing the mean and standard deviation (std) for each measurement.  This subset is assigned a name 'tidy_data'. 

4) Uses descriptive activity names to name the activities in the data set.
- The 'code' column of the 'tidy_data' is replaced with corresponding descriptive activity names taken from second column of the 'activities' dataframe.

5) Appropriately labels the data set with descriptive variable names.
- Renaming of variable and character string replacement were done to appropriately label the 'tidy_data' data set with descriptive variable names.

6) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- A second tidy data set, 'final_dataset', is created by grouping the data according to 'subject' and 'Activity', then summarizing the data set as means of each variable.  The 'final_dataset' is exported as 'final_dataset.txt' file. 

## References:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
