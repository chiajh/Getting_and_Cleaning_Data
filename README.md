Getting and Cleaning Data
===========

This is a repository contains the information/instructions about Course Project for Getting and Cleaning Data.

## Assignment submission files

run_analysis.R
README.md
CookBook.md

## Instructions

1) Download the source file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local folder e.g. "C:\Users\yourname\Module3\"

2) Unzip the source file into on your local folder e.g. "C:\Users\yourname\Module3\"

3) You should see all files after unzipping in "C:\Users\yourname\Module3\UCI HAR Dataset" folder

4) Put run_analysis.R file into "C:\Users\yourname\Module3\UCI HAR Dataset" folder

5) Open RStudio and make sure set the working directory to above folder e.g. setwd("C:\\Users\\yourname\\Module3\\UCI HAR Dataset\\") and then load and run run_analysis.R file using source("run_analysis.R") command.

6) Use data <- read.table("data_set_with_the_averages.txt") to read the data. 

## Dependencies

The R script assumes you have 'data.table' installed using install.packages("data.table")

Thank you.
