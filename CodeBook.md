# Description of the `run_analysis.R` script

This script performs the analysis required by the course's assignment, in 5+1 steps as follows:
- Step 0: Firstly, the library "plyr", the "train" and "test" X_datasets, Y_datasets, the features and the activity labels are being
loaded in order to be used later in the analysis.

- Step 1: In this step, I merged the datasets of the "train" and "test" categories in order to create a new one as requested by the 
assignment.

- Step 2: In order to extract the mean and standrad deviation measurements of each measurement, I looked into features dataset
for the mean and std measurements and extract them to a new one. Then, I subset the columns of mean and std measurements and 
set names at the columns.

- Step 3: In this step new descriptive names for the columns are being set.

- Step 4: In this step new descriptive variable names are being set and then all data are being merged in a new clean and tidy 
data set.

- Step 5: In this step the average of the variables for each measurement and each activity is being calculated and then
the results are being written in a new tidy data set which is the `averageDataSet.txt` file in this repo.

# Description of the variables

The variables used in the abovementioned script `run_analysis.R`, are the following:
- `X_test`: Contains the data from the X_test txt file
- `Y_test`: Contains the data from the Y_test txt file 
- `subjectTest`: Contains the data from the subject_test txt file
- `X_train`: Contains the data from the X_train txt file
- `Y_train`: Contains the data from the Y_train txt file
- `subjectTrain`: Contains the data from the subject_test txt file 
- `dataSetFeatures`: Contains the data from the features txt file
- `activityLables`: Contains the data from the activity_labels txt file
- `XDataSet`: Contains the merged data from both the X_test and X_train datasets
- `YDataset`: Contains the merged data from both the Y_test and Y_train datasets
- `subjectDataSet`: Contains the merged data from both the subjectTest and subjectTrain datasets
- `meanStdFeatures`: Contains the mean and standard deviation measurements as extracted from the `dataSetFeatures` data set
- `resultedDataSet`: Contains the resulted cleand and tidy data set with the descriptive variable names and descriptive activity names
- `averageDataSet`: Contains the independent new tidy data set which is required by the assignment.
