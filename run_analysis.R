
##############################################
## installing and loading necessary package ##
##############################################

if("reshape2" %in% rownames(installed.packages()) == FALSE) {
        install.packages("reshape2")
}
library(reshape2)

############################################################################
## First all the textfiles are loaded as individual tables and saved into ##
## seperate variables.                                                    ##
############################################################################

# Reading file "activity_labels.txt" into a table and saving it in new variable "activities".
activities <- read.table("./activity_labels.txt", col.names = c("activity_ids", "activity_labels"))

# Reading file "features.txt" into a table and saving it in new variable "features".
features <- read.table("./features.txt")

# Reading file "X_test.txt" from the testdata folder into a table and saving it in new variable "test_data" 
# and simultaniously using the "features" variable for creating the column names of test_data.
test_data <- read.table("./test/X_test.txt", col.names = (features[,2]))

# Reading file "y_test.txt" from the testdata folder into a new table and saving it in new variable "acitivity_ids_test".
# Setting the column name to "activity_ids".
activity_ids_test <- read.table("./test/y_test.txt", col.names = "activity_ids")

# Reading file "subject_test.txt" from the testdata folder into a new table and saving it in new variable "subjet_ids_test".
# Setting the column name to "subject_ids".
subject_ids_test <- read.table("./test/subject_test.txt", col.names = "subject_ids")

# Combining the testdata file with the test subject ids and test activity ids.
testdata_final <- cbind(subject_ids_test, activity_ids_test, test_data)

# Reading file "X_train.txt" from the traindata folder into a table and saving it in new variable "train_data"
# and simultaniously using "features" variable for creating the coloumn names of train_data.
train_data <- read.table("./train/X_train.txt", col.names = (features[,2]))

# Reading file "y_train.txt" from the traindata folder into table and saving it in new variable "acitivity_ids_train".
# Setting the column name to "activity_ids"
activity_ids_train <- read.table("./train/y_train.txt", col.names = "activity_ids")

## reading file "subject_train.txt" from the traindata folder into table and saving it in new variable "subjet_ids_train"
## setting the column name to "subject_ids"
subject_ids_train <- read.table("./train/subject_train.txt", col.names = "subject_ids")

# Combining the traindata file with the train subject ids and train activity ids
traindata_final <- cbind(subject_ids_train, activity_ids_train, train_data)

# Combining final testdata file and final traindata file into one datatable.
data_final <- rbind(testdata_final, traindata_final)

#######################################################################################
## Next only those columns which contain means or standard deviations are extracted. ##
#######################################################################################

# Storing the column names in the variable "colnames_data_final".
colnames_data_final <- names(data_final)

# Finding indexes of all the columns containing the string "mean".
mean_colnames <- colnames_data_final[grep("mean", colnames_data_final, ignore.case = TRUE)]

# Finding indexes of columns containing the string "std".
std_colnames <- colnames_data_final[grep("std", colnames_data_final, ignore.case = TRUE)]

# Saving only subject ids, activity ids, columns containing means and std in one table.
data_final_mean_std <- data_final[,c("subject_ids","activity_ids", mean_colnames, std_colnames)]

###################################################
## Adding descriptive labels to activitie column ##
###################################################

# Using the labels from the activity_labels table to build descriptive labels in the data_final_mean_std table.
easy_data <- merge(activities, data_final_mean_std, by.x="activity_ids", by.y="activity_ids", all=TRUE)

############################################
## Melting dataset to create narrow data. ##
############################################

# Melt the dataset with the descriptive activity names
melted_data <- melt(easy_data,id=c("activity_ids","activity_labels","subject_ids"))

####################
## Averaging data ##
####################

averaged_data <- dcast(melted_data, activity_ids + activity_labels + subject_ids ~ variable, mean)

################################################
## Cleaning out exess dots in variable names. ##
################################################

tidy_data_colnames <- gsub("\\.", "", names(averaged_data))
names(averaged_data) <- tidy_data_colnames
tidy_data <- averaged_data

##############################################
## Writing the tidy dataset into a new file ##
##############################################

write.table(tidy_data,"./tidy_data.txt", row.names = FALSE)



