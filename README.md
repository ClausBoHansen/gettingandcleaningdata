# gettingandcleaningdata

This repo assumes that https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
is available. This dataset contains measurements from a Samsung Galaxy S smartphone.

The R script run_analysis.R reads the above file and creates a tidy variable averages_by_group, which
contains averages by activity and subjuct for all mean a standard deviation columns.

The script requires the dplyr package to be installed.
