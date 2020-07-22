# Getting and Cleaning Data Course Project
# Creating directory, downloading and unzipping data sets
if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data/data.zip")
unzip(zipfile = "./data/data.zip", exdir = "./data")

# Loading libraries to use
library(dplyr)
library(data.table)

# Names and Labels reading
feature_names <- read.table("./data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Training data reading
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activity_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE) 
features_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE) 

# Test data reading
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE) 
features_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE) 

# Merging data sets into one
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features <- rbind(features_train, features_test)
colnames(features) <- t(feature_names[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
complete_data <- cbind(features,activity,subject)
View(complete_data)

# Extracting only the measurements on the mean and standard deviation for each measurement
has_mean_or_std <- grep(".*Mean.*|.*Std.*", names(complete_data), ignore.case=TRUE)
columns_required <- c(has_mean_or_std, 562, 563)
dim(complete_data)
extracted_data <- complete_data[, columns_required]
str(extracted_data)

# Adding descriptive activity names to name the activities in the data set
extracted_data$Activity <- as.character(extracted_data$Activity)
for (i in 1:6) {
        extracted_data$Activity[extracted_data$Activity == i] <- as.character(
                activity_labels[i, 2])
}
extracted_data$Activity <- as.factor(extracted_data$Activity)
extracted_data$Activity

# Labeling the data set with descriptive variable names
names(extracted_data)
names(extracted_data)<-gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data)<-gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data)<-gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data)<-gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data)<-gsub("^t", "Time", names(extracted_data))
names(extracted_data)<-gsub("^f", "Frequency", names(extracted_data))
names(extracted_data)<-gsub("tBody", "TimeBody", names(extracted_data))
names(extracted_data)<-gsub("-mean()", "Mean", names(extracted_data), 
                            ignore.case = TRUE)
names(extracted_data)<-gsub("-std()", "STD", names(extracted_data), 
                            ignore.case = TRUE)
names(extracted_data)<-gsub("-freq()", "Frequency", names(extracted_data), 
                            ignore.case = TRUE)
names(extracted_data)<-gsub("angle", "Angle", names(extracted_data))
names(extracted_data)<-gsub("gravity", "Gravity", names(extracted_data))
names(extracted_data)

# Creating a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- aggregate(. ~Subject + Activity, extracted_data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject, tidy_data$Activity), ]
str(tidy_data)
View(tidy_data)
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)