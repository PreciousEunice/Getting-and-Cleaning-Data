# Code Book

This code book describes the variables, the data, and the transformations or work performed to clean up the data.

## The Data ##
The data is downloaded from the following source:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The section below is lifted from the `README.txt` file in the dataset.

Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured.  The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- `README.txt`
- `features_info.txt`: Shows information about the variables listed on the 'features.txt'.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.

The following files are available for the train and test data. 

- `train/subject_train.txt`, `test/subject_test.txt`: Each row refers to one subject who performed the activity for each window sample. Values range from 1 to 30.      

- `train/Inertial Signals/total_acc_x_train.txt`, `test/Inertial Signals/total_acc_x_test.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Each row shows a `128` element vector. The same description applies for the `total_acc_x_train.txt`, `total_acc_x_test.txt` and for the
`total_acc_z_train.txt` and `total_acc_z_test.txt` files for the Y and Z axis.

- `train/Inertial Signals/body_acc_x_train.txt`, `test/Inertial Signals/body_acc_x_test.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- `train/Inertial Signals/body_gyro_x_train.txt`, `test/Inertial Signals/body_gyro_x_test.txt`: The angular velocity vector measured by the gyroscope for each window sample.   These values are expressed in `radians-per-second`. 

## Transformations or work performed to clean up the data

The `run_analysis.R` script performs the following transformations or work to clean up the data:

###1. Download and read the dataset.
The dataset is downloaded and extracted as folder named UCI HAR Dataset.  The files contained in the dataset are assigned the following names:
- features <- "features.txt"; 561 rows, 2 columns
The following part is lifted from the the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

- 'activities' <- "activity_labels.txt":  6 rows, 2 columns
This is the type of activities performed with the corresponding codes.  

- 'subject_test' <- "subject_test.txt":  2947 rows, 1 column
This contains the identification code of test subjects whom the measurements were taken from.

- 'x_test' <- "X_test.txt": 2947 rows, 561 columns
This contains the recorded features among the test subjects.

- 'y_test' <- "y_test.txt":  : 2947 rows, 1 columns
This contains the code of the activities performed while the measurements were taken.

- 'subject_train' <- "subject_train.txt":  7352 rows, 1 column
This contains the identification code of train subjects whom the measurements were taken from.

- 'x_train' <- "X_train.txt":  7352 rows, 561 columns
This contains the recorded features among the train subjects.

- 'y_train' <- "y_train.txt":  7352 rows, 1 columns
This contains the code of the activities performed while the measurements were taken.
     
###2. Merges the training and the test sets to create one single data set.
The following dataframes were created.
-'subject' (10299 rows, 1 column) is created by merging 'subject_train' and 'subject_test' using rbind() function.
-'x' (10299 rows, 561 columns) is created by merging 'x_train' and x_test' using rbind() function.
-'y' (10299 rows, 1 column) is created by merging 'y_train' and 'y_test' using rbind() function.
-'merged_data' (10299 rows, 563 column) is created by merging 'subject', 'y' and 'x' using cbind() function.

###3. Extracts only the measurements on the mean and standard deviation for each measurement. 
tidy_data (10299 rows, 88 columns) is created by subsetting merged_data, selecting the following columns: 'subject', 'code' and the 'columns' containing the mean and standard deviation (std) for each measurement.

###4. Uses descriptive activity names to name the activities in the data set
The 'code' column of the 'tidy_data' is replaced with corresponding descriptive activity names taken from second column of the 'activities' dataframe.

###5. Appropriately labels the data set with descriptive variable names. 
The following changes were done to appropriately label the 'tidy_data' data set with descriptive variable names.
- 'code' column is renamed 'Activity'.
- All "t" at the start of the variable name is replaced with "Time ".
- All "tBody" at the start of the variable name is replaced with "Time Body".
- "Acc" is replaced with "Accelerometer ".
- "mean" is replaced with "Mean ".
- "meanfreq" is replaced with "Mean ".
- "gravity" is replaced with "Gravity ".
- "Gyro" is replaced with "Gyroscope ".
- "Mag" is replaced with "Magnitude ".
- All "f" at the start of the variable name is replaced with "Frequency ".
- "std" is replaced with "Standard Deviation ".
- "angle" is replaced with "Angle ".
- One or multiple "." is removed.

### 6.  Create the Tidy Dataset

'final_dataset' (180 rows, 88 columns) is created by grouping the data according to 'subject' and 'Activity', then summarizing the data set as means of each variable.  The 'final_dataset' is exported as 'final_dataset.txt' file.  

