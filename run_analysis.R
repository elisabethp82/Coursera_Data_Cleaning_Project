#clearing space
rm(list=ls())

#installing necessary packages
install.packages("reshape2")

#loading packages
library(reshape2)

# First all the textfiles are loaded as individual tables and saved into seperate variables

## reading file "activity_labels.txt" into a table and saving it in new variable "activities".
activities <- read.table("./activity_labels.txt", col.names = c("activity_ids", "activity_labels"))

## reading file "features.txt" into a table and saving it in new variable "features".
features <- read.table("./features.txt")


# Reading in the test data and labeling the columns

## reading file "X_test.txt" from the testdata folder into a table and saving it in new variable "test_data"
## simultaniously using "features" variable for labeling the coloumn names of test_data
test_data <- read.table("./test/X_test.txt", col.names = (features[,2]))

## reading file "y_test.txt" from the testdata folder into table and saving it in new variable "acitivity_ids_test"
## setting the column name to "activity_id"
activity_ids_test <- read.table("./test/y_test.txt", col.names = "activity_id")

## reading file "subject_test.txt" from the testdata folder into table and saving it in new variable "subjet_ids_test"
## setting the column name to "subject_id"
subject_ids_test <- read.table("./test/subject_test.txt", col.names = "subject_id")

## combining the testdata file with the test subject ids and test activity ids
testdata_final <- cbind(subject_ids_test, activity_ids_test, test_data)


# Reading in the training data and labeling the columns

## reading file "X_train.txt" from the traindata folder into a table and saving it in new variable "train_data"
## simultaniously using "features" variable for labeling the coloumn names of test_data
train_data <- read.table("./train/X_train.txt", col.names = (features[,2]))

## reading file "y_train.txt" from the traindata folder into table and saving it in new variable "acitivity_ids_train"
## setting the column name to "activity_id"
activity_ids_train <- read.table("./train/y_train.txt", col.names = "activity_id")

## reading file "subject_train.txt" from the traindata folder into table and saving it in new variable "subjet_ids_train"
## setting the column name to "subject_id"
subject_ids_train <- read.table("./train/subject_train.txt", col.names = "subject_id")

## combining the traindata file with the train subject ids and train activity ids
traindata_final <- cbind(subject_ids_train, activity_ids_train, train_data)

## combining final testdata file and final traindata file into one datatable
data_final <- rbind(testdata_final, traindata_final)

# choosing only those columns which contain mean or standard deviation
## storing the column names in the variable "colnames_data_final"
colnames_data_final <- names(data_final)

## finding indexes of columns containing the string "mean"
mean_colnames <- colnames_data_final[grep("mean", colnames_data_final, ignore.case = TRUE)]

## finding indexes of columns containing the string "std"
std_colnames <- colnames_data_final[grep("std", colnames_data_final, ignore.case = TRUE)]

## saving only subject ids, activity ids, columns containing means and std in one table
data_final_mean_std <- data_final[,c("subject_id","activity_id", mean_colnames, std_colnames)]

# Using the labels from the activity_labels table to build descriptive labels in the data_final_mean_std table
easy_data <- merge(activities, data_final_mean_std, by.x="activity_ids", by.y="activity_id", all=TRUE)

##Melt the dataset with the descriptive activity names for better handling
averaged_data <- melt(easy_data,id=c("activity_ids","activity_labels","subject_id"))

#Averaging data
averaged_data <- dcast(averaged_data, activity_ids + activity_labels + subject_id ~ variable, mean)

# Create a file with the new tidy dataset
write.table(averaged_data,"./tidy_movement_data.txt")


