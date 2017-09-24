# Analysis of Data from Human Activity Recognition Using Smartphones

run_analysis.R is meant to run on the Human Activity Recognition Using Smartphones Data Set from the UCI Machine Learning Repository. A description of the dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the dataset can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Getting Started

You will need R installed to run the code.

## Description

* run_analysis.R

This is the code that transforms the UCI data into the final dataset. It merges training and test datasets into one, calculates the mean and standard deviation for each set of measurements, creates labels, and averages the data for each activity and each subject.

* Codebook.md

This file describes all the variables in the UCI dataset and the final tidy dataset returned by run_analysis.R. It also describes the transformations and work performed to clean up the data.

## Authors

* Minna Wang

## Acknowledgments

* Getting and Cleaning data Coursera course
