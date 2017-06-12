# Using plyr library for easier factor and variable renaming
library(dplyr)
library(plyr)

# Read in training data
y_train <- read.table("./train/y_train.txt")
x_train <- read.table("./train/X_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Read in test data
y_test <- read.table("./test/y_test.txt")
x_test <- read.table("./test/X_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Rename columns
colnames(subject_test) <- "Subject"
colnames(subject_train) <- "Subject"
colnames(y_test) <- "Activity"
colnames(y_train) <- "Activity"

# Find columns that are std and mean columns
features <- read.table("features.txt")
mean_cols <- grep("mean", features$V2, value = FALSE)
std_cols <- grep("std", features$V2, value = FALSE)
mean_std_cols <- c(mean_cols,std_cols)
sort(mean_std_cols)

# Remove columns that aren't std and mean columns from the test and train datasets
x_train <- x_train[,c(mean_std_cols)]
x_test <- x_test[,c(mean_std_cols)]

# Merge training data files into single dataset
train_df <- cbind(subject_train,y_train,x_train)

# Merge test data files into single dataset
test_df <- cbind(subject_test,y_test,x_test)

# Combine test and train datasets into single dataset
full_set <- rbind(train_df,test_df)

# Rename the activities values
full_set$Activity <- as.factor(full_set$Activity)
full_set$Subject <- as.factor(full_set$Subject)
full_set$Activity <- revalue(full_set$Activity,c("1"="Walking","2"="Walking_Upstairs","3"="Walking_Downstairs","4"="Sitting","5"="Standing","6"="Laying"))

# Rename the variable names
features$V1 <- as.character(paste("V",features$V1,sep = ""))
var_name_map <- match(colnames(full_set),features$V1)
colnames(full_set)[!is.na(var_name_map)] <- as.character(features$V2[na.omit(var_name_map)])

# Create a second data set with the average of each variable for each activity and each subject
df_to_submit <- full_set %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))
