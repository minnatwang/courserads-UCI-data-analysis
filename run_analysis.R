# FUNCTIONS & OTHER ----
# Clear workspace
rm(list = ls())

# Libraries to load
library(data.table)

# Splits a character vector by space character and finds mean and sd of all numerics therein 
# Returns a matrix with [,1] mean with [,2] sd
meanandsd <- function(input) {
  chars <- strsplit(as.character(input), "[[:space:]]")
  nums <- as.numeric(unlist(chars))
  tempmean <- mean(nums, na.rm = TRUE)
  tempsd <- sd(nums, na.rm = TRUE)
  list(tempmean, tempsd)
}

# Merge training and test data sets ====

# Actual data
#//TODO: add stringsAsFactors = FALSE
testdata <- read.csv("./UCI_HAR_Dataset/test/X_test.txt", header = FALSE)
traindata <- read.csv("./UCI_HAR_Dataset/train/X_train.txt", header = FALSE)

# Associated subject data
testsubject <- read.csv("./UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
trainsubject <- read.csv("./UCI_HAR_Dataset/train/subject_train.txt", header = FALSE)

# Associated activity data
testact <- read.csv("./UCI_HAR_Dataset/test/y_test.txt", header = FALSE)
trainact <- read.csv("./UCI_HAR_Dataset/train/y_train.txt", header = FALSE)
actlabels <- read.csv("./UCI_HAR_Dataset/activity_labels.txt", header = FALSE)

test <- cbind(testdata, testsubject, testact)
train <- cbind(traindata, trainsubject, trainact)
data <- rbind(test, train)

# Extract mean and stdev for each measurement ====
analysis <- sapply(data[,1], meanandsd)
data <- cbind(data, t(analysis))

data[,5] <- unlist(data[,5])
data[,4] <- unlist(data[,4])
data[,1] <- as.character(data[,1])

# Replace activity #s with names ====
actlevels <- sub("[[:digit:]][[:space:]]","",levels(actlabels[,1]))
data[,3] <- as.factor(data[,3])
levels(data[,3]) <- unlist(actlevels)
#data[,2] <- as.factor(data[,2])

# Label data set with variable names ====
names(data) <- c("Measurements", "Subject", "Activity", "Mean", "StDev")

# Create second data set with average for each activity and subject ====
ans <- aggregate(formula = cbind(Mean, StDev)~Subject+Activity, data = dataDT, FUN = mean)