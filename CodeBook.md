---
title: "Codebook for Getting and Cleaning Data assignment"
author: "Claus Bo Hansen"
date: "December 21, 2017"
---

# Codebook for Getting and Cleaning Data assignment

This document describes the operations performed and the data contained
in the Getting and Cleaning Data assignment.

The objective of this excercise is to create one tidy dataset containing averages for mean and standard deviation
of data produced by a Samsung Galaxy S smartphone. The averages must be grouped by activity and subject (= person).

The steps taken to generate the dataset are:

1. Read feature labels from file *features.txt* and store in variable *labels*
2. Read activity labels from file *activity_labels.txt* and store in variable *activitylabels*
3. For each of the test and train datasets:
- Read data from file *X_test.txt* / *X_train.txt* and set column names to labels stored in *activitylabels*
- Merge descriptive activity labels from *activitylabels*
- Add column with subject (= person) ids read from file *subject_test.txt* / *subject_train.txt*
4. Combine the two datasets *testdata* and *traindata* from above into *alldata*
5. Subset columns containing activity, subject and mean/standard deviation columns into *mean_and_std_data*
6. Group *mean_and_std_data* on subject and activity
7. Calculate averages by group for mean and standard deviation and store result in *averages_by_group*
