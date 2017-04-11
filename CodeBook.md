# Codebook 
The raw data was provided bei the University of California and can be downloaded from the following address: [https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original dataset included the following files:
“README.txt”
“features_info.txt”: Shows information about the variables used on the feature vector.
“features.txt”: List of all features.
“activity_labels.txt”: Links the class labels with their activity name.
“train/X_train.txt”: Training set.
“train/y_train.txt”: Training labels.
”test/X_test.txt”: Test set.
“test/y_test.txt”: Test labels.

It was processed using RStudio Version 1.0.136. The final tidy data set can be found in this repository ("tidy_data.txt"). 


## Description of run_analysis.R

__Attention!__ 
For the code to work properly the data files have to be downloaded and unziped and the working directory has to be set to the file where the unzipped textfiles are stored!

The goal of the run_analysis.R script is to produce a tidy data set which can be used for further analysis. It therefore reads in data from a number of given .txt files and merges the resulting tables into one big data table.
* First all the text-files (test data and training data) are read into individual tables.
* The test-data and the training-data where then merged into two seperate tables and labeled accordingly (the text-files “activity_labels.txt” and “features.txt” where used to label activities and features).
* When all the text-files are read in they are combined into one big data set.
* Using the "grep" function, all the columns containing “mean” and “std” strings were extracted and put into a new data table, including only the "activity_ids", the "subject_ids" and the “mean” and “std” columns.
* Using the labels from the activity_labels table, descriptive labels in the data_final_mean_std table are build and saved in a new table (easy_table).
* Using the "melt" function of the "reshape2" package the data is converted into a narrow table.
* Using the "dcast" function of the "reshape2" package the data is averaged (mean and standard deviation) 
* Finally the data is written to the "tidy_data.txt" file.

## Description of the "tidy_data.txt" file
The final tidy data file contains the following variables:

## Identifiers
* subject_ids --> 
* activity_ids  --> 
* activity_labels --> 

## Measurments
* activity_ids
* activity_labels
* subject_ids
* tBodyAccmeanX
* tBodyAccmeanY
* tBodyAccmeanZ
* tGravityAccmeanX
* tGravityAccmeanY
* tGravityAccmeanZ
* tBodyAccJerkmeanX
* tBodyAccJerkmeanY
* tBodyAccJerkmeanZ
* tBodyGyromeanX
* tBodyGyromeanY
* tBodyGyromeanZ
* tBodyGyroJerkmeanX
* tBodyGyroJerkmeanY
* tBodyGyroJerkmeanZ
* tBodyAccMagmean
* tGravityAccMagmean
* tBodyAccJerkMagmean
* tBodyGyroMagmean
* tBodyGyroJerkMagmean
* fBodyAccmeanX
* fBodyAccmeanY
* fBodyAccmeanZ
* fBodyAccmeanFreqX
* fBodyAccmeanFreqY
* fBodyAccmeanFreqZ
* fBodyAccJerkmeanX
* fBodyAccJerkmeanY
* fBodyAccJerkmeanZ
* fBodyAccJerkmeanFreqX
* fBodyAccJerkmeanFreqY
* fBodyAccJerkmeanFreqZ
* fBodyGyromeanX
* fBodyGyromeanY
* fBodyGyromeanZ
* fBodyGyromeanFreqX
* fBodyGyromeanFreqY
* fBodyGyromeanFreqZ
* fBodyAccMagmean
* fBodyAccMagmeanFreq
* fBodyBodyAccJerkMagmean
* fBodyBodyAccJerkMagmeanFreq
* fBodyBodyGyroMagmean
* fBodyBodyGyroMagmeanFreq
* fBodyBodyGyroJerkMagmean
* fBodyBodyGyroJerkMagmeanFreq
* angletBodyAccMeangravity
* angletBodyAccJerkMeangravityMean
* angletBodyGyroMeangravityMean
* angletBodyGyroJerkMeangravityMean
* angleXgravityMean
* angleYgravityMean
* angleZgravityMean
* tBodyAccstdX
* tBodyAccstdY
* tBodyAccstdZ
* tGravityAccstdX
* tGravityAccstdY
* tGravityAccstdZ
* tBodyAccJerkstdX
* tBodyAccJerkstdY
* tBodyAccJerkstdZ
* tBodyGyrostdX
* tBodyGyrostdY
* tBodyGyrostdZ
* tBodyGyroJerkstdX
* tBodyGyroJerkstdY
* tBodyGyroJerkstdZ
* tBodyAccMagstd
* tGravityAccMagstd
* tBodyAccJerkMagstd
* tBodyGyroMagstd
* tBodyGyroJerkMagstd
* fBodyAccstdX
* fBodyAccstdY
* fBodyAccstdZ
* fBodyAccJerkstdX
* fBodyAccJerkstdY
* fBodyAccJerkstdZ
* fBodyGyrostdX
* fBodyGyrostdY
* fBodyGyrostdZ
* fBodyAccMagstd
* fBodyBodyAccJerkMagstd
* fBodyBodyGyroMagstd
* fBodyBodyGyroJerkMagstd
