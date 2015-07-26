# The purpose of this script is to clean a data set and come out with a final calculated independent tidy data set.
# There are a few steps will be performed by this script. The details are as follows.
# The data Source for this project is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 1. Merges the training and the test sets to create one data set.
file1 <- read.table("./train/X_train.txt")
file2 <- read.table("./test/X_test.txt")
X <- rbind(file1, file2)

file1 <- read.table("./train/subject_train.txt")
file2 <- read.table("./test/subject_test.txt")
S <- rbind(file1, file2)

file1 <- read.table("./train/y_train.txt")
file2 <- read.table("./test/y_test.txt")
Y <- rbind(file1, file2)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")

# Get the position of features with -mean() and -std() partial words. Escape (\\) the bracket.
index_mean_std <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) 

# Subset the columns that contain mean and std data only.
X <- X[, index_mean_std]


# 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")

Y[, 1] = activities[Y[, 1], 2]
names(Y) <- "activity"


# 4. Appropriately labels the data set with descriptive variable names. 
# Rename the X column names.
names(X) <- features[index_mean_std, 2]

# Remove the open and close bracket
names(X) <- gsub("\\(|\\)", "", names(X)) 


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Rename column name for S
names(S) <- "subject"

# Create final tidy data set
tidyData <- cbind(S, Y, X)

library(data.table)
dataDT <- data.table(tidyData)

# mean function applies to sub-data.table, called '.SD' 
calculatedData<- dataDT[, lapply(.SD, mean), by=c("subject", "activity")]  

# Write the calculated mean data set to file without row name
write.table(calculatedData, "dataset_with_average.txt", row.name=FALSE)


