

# --------------------Step 0 Load the initial datasets that will be used--------------------
library(plyr)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

dataSetFeatures <- read.table("./UCI HAR Dataset/features.txt")

activityLables <- read.table("./UCI HAR Dataset/activity_labels.txt")

# --------------------1st Step -> Merge the Data sets--------------------

XDataSet <- rbind(X_test, X_train)
YDataset <- rbind(Y_test, Y_train)
subjectDataSet <- rbind(subjectTest, subjectTrain)

# --------------------2nd Step -> Extract mean and std of measurments--------------------

# Look into features dataset for the mean and std measurements and extract them to a new one
meanStdFeatures <- grep("-(mean|std)\\(\\)", dataSetFeatures[, 2])

# Subset the columns of mean and std measurements and set names at the columns
XDataSet <- XDataSet[, meanStdFeatures]
names(XDataSet) <- dataSetFeatures[meanStdFeatures, 2]

# --------------------3rd Step -> Set descriptive activity names--------------------

YDataset[, 1] <- activityLables[YDataset[, 1], 2]

# Set new column name
names(YDataset) <- "Activity_Label"

# --------------------4th Step -> Set descriptive variable names--------------------

# Set new column name
names(subjectDataSet) <- "Subject_Label"

# Merge all data in a new clean and tidy data set
resultedDataSet <- cbind(XDataSet, YDataset, subjectDataSet)

# --------------------5th Step -> Tidy dataset with averages--------------------

averageDataSet <- ddply(resultedDataSet, .(Subject_Label, Activity_Label), function(x) colMeans(x[, 1:66]))

write.table(averageDataSet, "averageDataSet.txt", row.name=FALSE)
