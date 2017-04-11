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
* BodyAcc.mean
* tBodyAcc.mean...Y
* tBodyAcc.mean...Z
* tGravityAcc.mean...X
* tGravityAcc.mean...Y
* tGravityAcc.mean...Z
* tBodyAccJerk.mean...X
* tBodyAccJerk.mean...Y
"12" "tBodyAccJerk.mean...Z"
"13" "tBodyGyro.mean...X"
"14" "tBodyGyro.mean...Y"
"15" "tBodyGyro.mean...Z"
"16" "tBodyGyroJerk.mean...X"
"17" "tBodyGyroJerk.mean...Y"
"18" "tBodyGyroJerk.mean...Z"
"19" "tBodyAccMag.mean.."
"20" "tGravityAccMag.mean.."
"21" "tBodyAccJerkMag.mean.."
"22" "tBodyGyroMag.mean.."
"23" "tBodyGyroJerkMag.mean.."
"24" "fBodyAcc.mean...X"
"25" "fBodyAcc.mean...Y"
"26" "fBodyAcc.mean...Z"
"27" "fBodyAcc.meanFreq...X"
"28" "fBodyAcc.meanFreq...Y"
"29" "fBodyAcc.meanFreq...Z"
"30" "fBodyAccJerk.mean...X"
"31" "fBodyAccJerk.mean...Y"
"32" "fBodyAccJerk.mean...Z"
"33" "fBodyAccJerk.meanFreq...X"
"34" "fBodyAccJerk.meanFreq...Y"
"35" "fBodyAccJerk.meanFreq...Z"
"36" "fBodyGyro.mean...X"
"37" "fBodyGyro.mean...Y"
"38" "fBodyGyro.mean...Z"
"39" "fBodyGyro.meanFreq...X"
"40" "fBodyGyro.meanFreq...Y"
"41" "fBodyGyro.meanFreq...Z"
"42" "fBodyAccMag.mean.."
"43" "fBodyAccMag.meanFreq.."
"44" "fBodyBodyAccJerkMag.mean.."
"45" "fBodyBodyAccJerkMag.meanFreq.."
"46" "fBodyBodyGyroMag.mean.."
"47" "fBodyBodyGyroMag.meanFreq.."
"48" "fBodyBodyGyroJerkMag.mean.."
"49" "fBodyBodyGyroJerkMag.meanFreq.."
"50" "angle.tBodyAccMean.gravity."
"51" "angle.tBodyAccJerkMean..gravityMean."
"52" "angle.tBodyGyroMean.gravityMean."
"53" "angle.tBodyGyroJerkMean.gravityMean."
"54" "angle.X.gravityMean."
"55" "angle.Y.gravityMean."
"56" "angle.Z.gravityMean."
"57" "tBodyAcc.std...X"
"58" "tBodyAcc.std...Y"
"59" "tBodyAcc.std...Z"
"60" "tGravityAcc.std...X"
"61" "tGravityAcc.std...Y"
"62" "tGravityAcc.std...Z"
"63" "tBodyAccJerk.std...X"
"64" "tBodyAccJerk.std...Y"
"65" "tBodyAccJerk.std...Z"
"66" "tBodyGyro.std...X"
"67" "tBodyGyro.std...Y"
"68" "tBodyGyro.std...Z"
"69" "tBodyGyroJerk.std...X"
"70" "tBodyGyroJerk.std...Y"
"71" "tBodyGyroJerk.std...Z"
"72" "tBodyAccMag.std.."
"73" "tGravityAccMag.std.."
"74" "tBodyAccJerkMag.std.."
"75" "tBodyGyroMag.std.."
"76" "tBodyGyroJerkMag.std.."
"77" "fBodyAcc.std...X"
"78" "fBodyAcc.std...Y"
"79" "fBodyAcc.std...Z"
"80" "fBodyAccJerk.std...X"
"81" "fBodyAccJerk.std...Y"
"82" "fBodyAccJerk.std...Z"
"83" "fBodyGyro.std...X"
"84" "fBodyGyro.std...Y"
"85" "fBodyGyro.std...Z"
"86" "fBodyAccMag.std.."
"87" "fBodyBodyAccJerkMag.std.."
"88" "fBodyBodyGyroMag.std.."
"89" "fBodyBodyGyroJerkMag.std.."
