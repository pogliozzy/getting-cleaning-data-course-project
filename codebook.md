## Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

All the similar data is merged using the `rbind()` function.
Only columns with the mean and standard deviation measures are taken, then the correct colums name from `features.txt` are applied
Also the names of activity are taken from `activity_labels.txt` and aplyed to the dataset.
Finally, we generate a new dataset with all the average measures for each subject and activity type and store it in `averages_data.txt`.

## Variables

Data from "UCI HAR Dataset" is stored in the following variables

`x_train`
`y_train`
`x_test`
`y_test`
`subject_train`
`subject_test` 

`x_data`
`y_data`
`subject_data`

Are used to merge all the data downloaded.

`features`
contains the correct names for the `x_data` dataset. The names are applied to the column names stored in `mean_and_std_features` dataset

`activities`
contains the correct names for the `y_data` dataset.
 
`merged_data` 
merges `x_data`, `y_data` and `subject_data` 

`averages_data`
contains the desired data that are finally stored in `averages_data.txt` file. 