# getting_cleaning_data_project
Coursera Getting and Cleaning Data Project

- Codebook.xlsx - Variable names, data types, and descriptions for all variables in the dataset.
- features_info.txt - Original document explaining feature variables from original data sets.
- run_analysis.R - R script which modifies original data set according to the specifications of the project. This script assumes that the original data set files are in the user's working directory.

Run_Analysis.R Steps

1) "y_train.txt", "x_train.txt", "subject_train.txt", "y_test.txt", "x_test.txt", "subject_test.txt" are loaded each as separate dataframes.
2) Subject variables (from "subject_train" and "subject_test") are renamed to the more descriptive variable name of "Subject"
3) Activity variables (from "y_test" and "y_train") are renamed to the more descriptive variable name of "Activity"
4) All columns from the test and train datasets that don't have the term "mean" or "std" explicitly contained in the variable name are removed based on the variable names in "features.txt". This is my interpretation of requirement #2 of the project: "Extracts only the measurements on the mean and standard deviation for each measurement."
5) The columns from the 3 dataframes loaded from the 3 "train" files ("y_train.txt", "x_train.txt", "subject_train.txt") are merged into a single dataframe.
6) The columns from the 3 dataframes loaded from the 3 "test" files ("y_test.txt", "x_test.txt", "subject_test.txt") are merged into a single dataframe.
7) The rows from the test and train dataframes are merged into a single dataframe.
8) The "Subject" variable is changed to a factor variable.
9) The "Actvitiy" variable is changed to a facor varialbe and the factor levels are renamed based on the map provided in "activity_labels.txt".
10) The feature variables are renamed based on the map provided in "feature_info.txt"
11) A new dataframe is created with the average of each feature variable for each activity and each subject.
  
