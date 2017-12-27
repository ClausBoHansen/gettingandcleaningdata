## Assignment in Getting and Cleaning Data
## Claus Bo Hansen

## Load libraries
library(dplyr)

## Settings
downloadlink <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localarchive <- "UCI_HAR_Dataset.zip"
extracteddir <- "UCI HAR Dataset"  # Determined by extracting the archive
labelfile    <- "features.txt"
activityfile <- "activity_labels.txt"
initialdir   <- getwd()

## Download and extract archive
download.file(downloadlink, localarchive)
unzip(localarchive)

## Set working directory to extracted archive
setwd(extracteddir)
datasets <- c("test", "train")

## Read column titles and activity labels
labels <- read.table(labelfile)
activitylabels <- read.table(activityfile, col.names = c("activityID", "activity"))

## Initialize variable to hold all oberservations
alldata <- NULL

## Read datasets
for (dataset in datasets) {
  dataname <- paste(dataset,"data", sep = "")
  assign(dataname, read.table(paste(dataset,"/X_", dataset,".txt", sep = ""), col.names = labels$V2))
  
  ## Read and add activity IDs
  testids <- read.table(paste(dataset,"/y_", dataset,".txt", sep = ""), col.names = "activityID")
  ## Merge activity labels
  testids <- merge(testids, activitylabels, by.x = "activityID", by.y = "activityID")
  assign(dataname, cbind(testids, get(dataname)))
  
  ## Read and add subject IDs
  subjectids <- read.table(paste(dataset,"/subject_", dataset,".txt", sep = ""), col.names = "subjectID")
  assign(dataname, cbind(subjectids, get(dataname)))
  
  ## Add to all observations variable
  alldata <- rbind(alldata, get(dataname))
}

## Create data table with only means and averages
mean_and_std_data <- select(alldata, grep("(^(activity|subjectID)$)|mean|std", names(alldata)))

## Group means and averages by subjectID and activity
mean_and_std_data <- group_by(mean_and_std_data, subjectID, activity)

## Calculate averages by group
averages_by_group <- summarize_all(mean_and_std_data, funs(mean))

## Write tidy dataset to file
setwd(initialdir)
write.table(averages_by_group, file = "means.txt", row.names = FALSE)
