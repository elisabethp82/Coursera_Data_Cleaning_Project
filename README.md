# Coursera Data Cleaning Project: run_analysis.R Script explained
by Elisabeth Pelikan

This repository was produced for a course assignment during the “Getting and Cleaning Data” course by Jeff Leek, Roger D. Peng and Brian Caffo from Johns Hopkins University and distributed on the learning platform coursera.com.

The dataset used (Human Activity Recognition Using Smartphones Dataset; Version 1.0)
is provided by the University of California. It can be downloaded at the following address: [https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here’s a brief introduction to the experiments, as can be found in the readme file provided along with the dataset. 
“The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.”


The original dataset included the following data files:
* “README.txt”
* “features_info.txt”: Shows information about the variables used on the feature vector.
* “features.txt”: List of all features.
* “activity_labels.txt”: Links the class labels with their activity name.
* “train/X_train.txt”: Training set.
* “train/y_train.txt”: Training labels.
* ”test/X_test.txt”: Test set.
* “test/y_test.txt”: Test labels.


## Description of run_analysis.R
The goal of the run_analysis.R script is to produce a tidy data set which can be used for further analysis. It therefore reads in data from a number of given .txt files and merges the resulting tables into one big data table.
* First all the text-files are read into individual tables.
* The test-data and the train-data where then merged into two seperate tables and labeled accordingly (the text-files “activity_labels.txt” and “features.txt” where used to label activities and features).
* When all the text-files are read in they are combined into one big data set.
* Using the "grep" function, all the columns containing “mean” and “std” strings were extracted and put into a new data table, including only the "activity_ids", the "subject_id" and the “mean” and “std” columns.
* Using the labels from the activity_labels table, descriptive labels in the data_final_mean_std table are build and saved in a new table (easy_table).
* Lastly, with the help of the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included features, ordered by the activity name and the subject id, and the data is written to the "tidy_movement_data.txt" file.

A description of the "tidy_movement_data.txt" file may be found in the "CodeBook.md" file.

### Acknowledgements:
For more information about this dataset contact: activityrecognition@smartlab.ws

### License:
A use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

