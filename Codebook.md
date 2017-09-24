#  Codebook for Analysis of Data from Human Activity Recognition Using Smartphones

This file describes all the variables in the UCI dataset and the final tidy dataset returned by run_analysis.R. It also describes the transformations and work performed to clean up the data.

## Original data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities  wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The original dataset includes the following files:
=========================================

- 'README.txt'

A descriptive file with no variables/datasets.
- 'activity_labels.txt': Links the class labels with their activity name.
A list of six strings naming the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

- 'train/X_train.txt': Training set.
Measurements for the 70% of participants labeled as training data.

- 'train/y_train.txt': Training labels.
Labels for the training dataset specifying which activity is associated with the measurement (1 being WALKING, 2 being WALKING_UPSTAIRS, etc.)

- 'test/X_test.txt': Test set.
Similar to X_train.txt for testing data.

- 'test/y_test.txt': Test labels.
Similar to y_train.txt for testing data.

- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Other files include features_info.txt, features.txt, and others provided in folders labeled Inertial Signals (one for train and one for test). These files were not used in analysis and can be ignored.

## Data manipulation
First, measurement data was associated with their respective subject numbers and activity labels, and training and testing data was combined.

Then the mean and standard deviation for each set of measurements was found.

The activity column class was changed to factor and activity numbers were replaced with their respective labels (e.g. WALKING).

Each column was labeled an appropriate variable name.

Finally, a second data set was created with averages for each activity and subject.

## Output data
The final dataset consists of 180 observations of 4 variables.

Subject
  The subject #
  Integer
  1:30

Activity
  The activity that was done
  Factor
  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Mean
  The mean of the associated observations
  Numeric
  [various]

StDev
  The standard deviation of the associated observations
  Numeric
  [various]
