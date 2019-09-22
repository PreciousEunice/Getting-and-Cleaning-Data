# Loading packages.
library(dplyr)

# Check if the file containing the dataset already exists.  
# If the file does not exist, download the file and unzip.

fileName <- "Samsung_accelerometer.zip"
if (!file.exists(fileName)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, fileName, method="curl")
  unzip(fileName)
}  

# Assigning names to files.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merges the training and the test sets to create one data set.
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

merged_data <- cbind(subject, y, x)

# Extracts only the measurements on the mean and standard deviation 
# for each measurement.
tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

# Uses descriptive activity names to name the activities in the data set
tidy_data <- mutate(tidy_data, code=activities[tidy_data$code,2])

# Appropriately labels the data set with descriptive variable names.
tidy_data <- rename(tidy_data, "Activity"="code")
names(tidy_data)<-gsub("^t", "Time ", names(tidy_data))
names(tidy_data)<-gsub("tBody", "Time Body ", names(tidy_data))
names(tidy_data)<-gsub("Acc", "Accelerometer ", names(tidy_data))
names(tidy_data)<-gsub("mean", "Mean ", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("meanfreq", "Mean ", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("gravity", "Gravity ", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope ", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude ", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency ", names(tidy_data))
names(tidy_data)<-gsub("std", "Standard Deviation", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "Angle ", names(tidy_data))
names(tidy_data)<-gsub("(\\.){1,3}", "", names(tidy_data))

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
final_dataset <- tidy_data %>%
  group_by(subject, Activity) %>%
  summarize_all(funs(mean))
write.table(final_dataset, "final_dataset.txt", row.name=FALSE)


