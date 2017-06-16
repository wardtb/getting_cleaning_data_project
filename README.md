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
  
  
  Codebook (also see Codebook.xlsx link)
  
  Original Variable Number	Variable Name	Data Type	Possible Values	Comment
N/A	Subject	Factor	1:30	Subject ID provided in original test and train datasets in "y_test.txt" file
N/A	Activity	Factor	Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying	Activity variable transformed from original "y_test.txt" and "y_train.txt" values based on "activity_labels.txt" mapping file
1	tBodyAcc-mean()-X	Num	-1:1	See features_info.txt file for description
2	tBodyAcc-mean()-Y	Num	-1:1	See features_info.txt file for description
3	tBodyAcc-mean()-Z	Num	-1:1	See features_info.txt file for description
41	tGravityAcc-mean()-X	Num	-1:1	See features_info.txt file for description
42	tGravityAcc-mean()-Y	Num	-1:1	See features_info.txt file for description
43	tGravityAcc-mean()-Z	Num	-1:1	See features_info.txt file for description
81	tBodyAccJerk-mean()-X	Num	-1:1	See features_info.txt file for description
82	tBodyAccJerk-mean()-Y	Num	-1:1	See features_info.txt file for description
83	tBodyAccJerk-mean()-Z	Num	-1:1	See features_info.txt file for description
121	tBodyGyro-mean()-X	Num	-1:1	See features_info.txt file for description
122	tBodyGyro-mean()-Y	Num	-1:1	See features_info.txt file for description
123	tBodyGyro-mean()-Z	Num	-1:1	See features_info.txt file for description
161	tBodyGyroJerk-mean()-X	Num	-1:1	See features_info.txt file for description
162	tBodyGyroJerk-mean()-Y	Num	-1:1	See features_info.txt file for description
163	tBodyGyroJerk-mean()-Z	Num	-1:1	See features_info.txt file for description
201	tBodyAccMag-mean()	Num	-1:1	See features_info.txt file for description
214	tGravityAccMag-mean()	Num	-1:1	See features_info.txt file for description
227	tBodyAccJerkMag-mean()	Num	-1:1	See features_info.txt file for description
240	tBodyGyroMag-mean()	Num	-1:1	See features_info.txt file for description
253	tBodyGyroJerkMag-mean()	Num	-1:1	See features_info.txt file for description
266	fBodyAcc-mean()-X	Num	-1:1	See features_info.txt file for description
267	fBodyAcc-mean()-Y	Num	-1:1	See features_info.txt file for description
268	fBodyAcc-mean()-Z	Num	-1:1	See features_info.txt file for description
294	fBodyAcc-meanFreq()-X	Num	-1:1	See features_info.txt file for description
295	fBodyAcc-meanFreq()-Y	Num	-1:1	See features_info.txt file for description
296	fBodyAcc-meanFreq()-Z	Num	-1:1	See features_info.txt file for description
345	fBodyAccJerk-mean()-X	Num	-1:1	See features_info.txt file for description
346	fBodyAccJerk-mean()-Y	Num	-1:1	See features_info.txt file for description
347	fBodyAccJerk-mean()-Z	Num	-1:1	See features_info.txt file for description
373	fBodyAccJerk-meanFreq()-X	Num	-1:1	See features_info.txt file for description
374	fBodyAccJerk-meanFreq()-Y	Num	-1:1	See features_info.txt file for description
375	fBodyAccJerk-meanFreq()-Z	Num	-1:1	See features_info.txt file for description
424	fBodyGyro-mean()-X	Num	-1:1	See features_info.txt file for description
425	fBodyGyro-mean()-Y	Num	-1:1	See features_info.txt file for description
426	fBodyGyro-mean()-Z	Num	-1:1	See features_info.txt file for description
452	fBodyGyro-meanFreq()-X	Num	-1:1	See features_info.txt file for description
453	fBodyGyro-meanFreq()-Y	Num	-1:1	See features_info.txt file for description
454	fBodyGyro-meanFreq()-Z	Num	-1:1	See features_info.txt file for description
503	fBodyAccMag-mean()	Num	-1:1	See features_info.txt file for description
513	fBodyAccMag-meanFreq()	Num	-1:1	See features_info.txt file for description
516	fBodyBodyAccJerkMag-mean()	Num	-1:1	See features_info.txt file for description
526	fBodyBodyAccJerkMag-meanFreq()	Num	-1:1	See features_info.txt file for description
529	fBodyBodyGyroMag-mean()	Num	-1:1	See features_info.txt file for description
539	fBodyBodyGyroMag-meanFreq()	Num	-1:1	See features_info.txt file for description
542	fBodyBodyGyroJerkMag-mean()	Num	-1:1	See features_info.txt file for description
552	fBodyBodyGyroJerkMag-meanFreq()	Num	-1:1	See features_info.txt file for description
4	tBodyAcc-std()-X	Num	-1:1	See features_info.txt file for description
5	tBodyAcc-std()-Y	Num	-1:1	See features_info.txt file for description
6	tBodyAcc-std()-Z	Num	-1:1	See features_info.txt file for description
44	tGravityAcc-std()-X	Num	-1:1	See features_info.txt file for description
45	tGravityAcc-std()-Y	Num	-1:1	See features_info.txt file for description
46	tGravityAcc-std()-Z	Num	-1:1	See features_info.txt file for description
84	tBodyAccJerk-std()-X	Num	-1:1	See features_info.txt file for description
85	tBodyAccJerk-std()-Y	Num	-1:1	See features_info.txt file for description
86	tBodyAccJerk-std()-Z	Num	-1:1	See features_info.txt file for description
124	tBodyGyro-std()-X	Num	-1:1	See features_info.txt file for description
125	tBodyGyro-std()-Y	Num	-1:1	See features_info.txt file for description
126	tBodyGyro-std()-Z	Num	-1:1	See features_info.txt file for description
164	tBodyGyroJerk-std()-X	Num	-1:1	See features_info.txt file for description
165	tBodyGyroJerk-std()-Y	Num	-1:1	See features_info.txt file for description
166	tBodyGyroJerk-std()-Z	Num	-1:1	See features_info.txt file for description
202	tBodyAccMag-std()	Num	-1:1	See features_info.txt file for description
215	tGravityAccMag-std()	Num	-1:1	See features_info.txt file for description
228	tBodyAccJerkMag-std()	Num	-1:1	See features_info.txt file for description
241	tBodyGyroMag-std()	Num	-1:1	See features_info.txt file for description
254	tBodyGyroJerkMag-std()	Num	-1:1	See features_info.txt file for description
269	fBodyAcc-std()-X	Num	-1:1	See features_info.txt file for description
270	fBodyAcc-std()-Y	Num	-1:1	See features_info.txt file for description
271	fBodyAcc-std()-Z	Num	-1:1	See features_info.txt file for description
348	fBodyAccJerk-std()-X	Num	-1:1	See features_info.txt file for description
349	fBodyAccJerk-std()-Y	Num	-1:1	See features_info.txt file for description
350	fBodyAccJerk-std()-Z	Num	-1:1	See features_info.txt file for description
427	fBodyGyro-std()-X	Num	-1:1	See features_info.txt file for description
428	fBodyGyro-std()-Y	Num	-1:1	See features_info.txt file for description
429	fBodyGyro-std()-Z	Num	-1:1	See features_info.txt file for description
504	fBodyAccMag-std()	Num	-1:1	See features_info.txt file for description
517	fBodyBodyAccJerkMag-std()	Num	-1:1	See features_info.txt file for description
530	fBodyBodyGyroMag-std()	Num	-1:1	See features_info.txt file for description
543	fBodyBodyGyroJerkMag-std()	Num	-1:1	See features_info.txt file for description
